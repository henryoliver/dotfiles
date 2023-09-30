--       __  _________   ________  __
--      / / / / ____/ | / / __ \ \/ /   Henry Oliver
--     / /_/ / __/ /  |/ / /_/ /\  /    https://github.com/henryoliver
--    / __  / /___/ /|  / _, _/ / /     https://twitter.com/henry_s_oliver
--   /_/ /_/_____/_/ |_/_/ |_| /_/
--

local modules = {
    "config.opts",
    "config.lazy",
    "config.keys",
    "config.auto",
}

for _, module in ipairs(modules) do
    require(module)
end
