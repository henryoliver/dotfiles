return {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "yamatsum/nvim-nonicons",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local nonicons = require("nvim-nonicons")
        local codecompanion = require("codecompanion")
        local codecompanion_adapters = require("codecompanion.adapters")

        codecompanion.setup({
            opts = {
                system_prompt = "",
            },
            strategies = {
                chat = {
                    adapter = "anthropic",
                    opts = {
                        completion_provider = "cmp",
                    },
                },
                inline = { adapter = "anthropic" },
                cmd = { adapter = "anthropic" },
            },
            keymaps = {
                send = {
                    callback = function(chat)
                        vim.cmd("stopinsert")
                        chat:submit()
                        chat:add_buf_message({ role = "llm", content = "" })
                    end,
                    index = 1,
                    description = "Send",
                },
            },
            sources = {
                per_filetype = {
                    codecompanion = { "codecompanion" },
                },
            },
            adapters = {
                opts = {
                    show_defaults = false,
                },
                anthropic = function()
                    return codecompanion_adapters.extend("anthropic", {
                        schema = {
                            model = {
                                default = "claude-opus-4-0",
                            },
                        },
                    })
                end,
                openai = function()
                    return codecompanion_adapters.extend("openai", {
                        schema = {
                            model = {
                                default = "o4-mini",
                            },
                        },
                    })
                end,
                xai = function()
                    return codecompanion_adapters.extend("xai", {
                        schema = {
                            model = {
                                default = "grok-3",
                            },
                        },
                    })
                end,
            },
            display = {
                chat = {
                    intro_message = "",
                    show_token_count = true,
                    icons = {
                        pinned_buffer = "" .. nonicons.get("milestone") .. " ",
                        watched_buffer = "" .. nonicons.get("eye") .. " ",
                    },
                    window = {
                        layout = "float", -- float|vertical|horizontal|buffer
                        border = "rounded",
                        height = 0.9,
                        width = 0.8,
                        opts = {
                            number = false,
                            relativenumber = false,
                            colorcolumn = "",
                            foldenable = false,
                        },
                    },
                },
                diff = { enabled = false },
            },
            prompt_library = {
                ["Senior Developer"] = {
                    strategy = "chat",
                    description = "Get expert code advice with full project context and external references",
                    opts = {
                        short_name = "senior",
                        auto_submit = false,
                        is_default = true,
                        is_slash_cmd = true,
                        ignore_system_prompt = true,
                    },
                    prompts = {
                        {
                            role = "system",
                            content = function(context)
                                return string.format(
                                    [[I want you to act as a senior %s developer. I will ask you specific questions and I want you to return raw code only (no codeblocks and no explanations). If you can't respond with code, respond with nothing]],
                                    context.filetype
                                )
                            end,
                            opts = {
                                visible = true,
                            },
                        },
                        {
                            role = "user",
                            opts = {
                                contains_code = true,
                            },
                        },
                    },
                },
            },
        })

        -- CodeCompanion Spinner Module
        local spinner = (function()
            local M = {
                processing = false,
                spinner_index = 1,
                namespace_id = nil,
                timer = nil,
                spinner_symbols = {
                    "⠋",
                    "⠙",
                    "⠹",
                    "⠸",
                    "⠼",
                    "⠴",
                    "⠦",
                    "⠧",
                    "⠇",
                    "⠏",
                },
                filetype = "codecompanion",
            }

            function M:get_buf(filetype)
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype == filetype then
                        return buf
                    end
                end
                return nil
            end

            function M:update_spinner()
                if not self.processing then
                    self:stop_spinner()
                    return
                end

                self.spinner_index = (self.spinner_index % #self.spinner_symbols) + 1

                local buf = self:get_buf(self.filetype)
                if buf == nil then
                    return
                end

                vim.api.nvim_buf_clear_namespace(buf, self.namespace_id, 0, -1)

                local last_line = vim.api.nvim_buf_line_count(buf) - 1
                vim.api.nvim_buf_set_extmark(buf, self.namespace_id, last_line, 0, {
                    virt_lines = { { { self.spinner_symbols[self.spinner_index] .. " Processing...", "Comment" } } },
                    virt_lines_above = true,
                })
            end

            function M:start_spinner()
                self.processing = true
                self.spinner_index = 0

                if self.timer then
                    self.timer:stop()
                    self.timer:close()
                    self.timer = nil
                end

                self.timer = vim.loop.new_timer()
                self.timer:start(
                    0,
                    100,
                    vim.schedule_wrap(function()
                        self:update_spinner()
                    end)
                )
            end

            function M:stop_spinner()
                self.processing = false

                if self.timer then
                    self.timer:stop()
                    self.timer:close()
                    self.timer = nil
                end

                local buf = self:get_buf(self.filetype)
                if buf == nil then
                    return
                end

                vim.api.nvim_buf_clear_namespace(buf, self.namespace_id, 0, -1)
            end

            function M:init()
                self.namespace_id = vim.api.nvim_create_namespace("CodeCompanionSpinner")

                vim.api.nvim_create_augroup("CodeCompanionHooks", { clear = true })
                local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

                vim.api.nvim_create_autocmd({ "User" }, {
                    pattern = "CodeCompanionRequest*",
                    group = group,
                    callback = function(request)
                        if request.match == "CodeCompanionRequestStarted" then
                            self:start_spinner()
                        elseif request.match == "CodeCompanionRequestFinished" then
                            self:stop_spinner()
                        end
                    end,
                })
            end

            M:init()
            return M
        end)()
    end,
    keys = {
        { "<Leader>in", "<Cmd>CodeCompanionChat<CR>", desc = "Chat" },
        { "<Leader>ic", "<Cmd>CodeCompanionChat Toggle<CR>", desc = "Toggle" },

        { "<Leader>io", "<Cmd>CodeCompanionChat openai<CR>", desc = "Chat OpenAI" },
        { "<Leader>il", "<Cmd>CodeCompanionChat anthropic<CR>", desc = "Chat Claude" },
        { "<Leader>ik", "<Cmd>CodeCompanionChat xai<CR>", desc = "Chat Grok" },

        { "<Leader>im", "<Cmd>CodeCompanionCmd<CR>", desc = "Generate Command" },
        { "<Leader>ia", "<Cmd>CodeCompanionActions<CR>", desc = "Action Palette" },

        { "<Leader>ig", "<Cmd>CodeCompanion /commit<CR>", desc = "Git Commit" },
        { "<Leader>is", "<Cmd>CodeCompanion /senior<CR>", desc = "Senior Developer" },

        { "<Leader>ia", "<Cmd>CodeCompanionChat Add<CR>", mode = "v", desc = "Add Chat" },

        { "<Leader>ii", "<Cmd>CodeCompanion<CR>", mode = "v", desc = "Inline" },
        { "<Leader>io", "<Cmd>CodeCompanion openai<CR>", mode = "v", desc = "Inline OpenAI" },
        { "<Leader>il", "<Cmd>CodeCompanion anthropic<CR>", mode = "v", desc = "Inline Claude" },
    },
}
