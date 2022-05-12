--       __  _________   ________  __
--      / / / / ____/ | / / __ \ \/ /   Henry Oliver
--     / /_/ / __/ /  |/ / /_/ /\  /    https://github.com/henryoliver
--    / __  / /___/ /|  / _, _/ / /     https://twitter.com/henry_s_oliver
--   /_/ /_/_____/_/ |_/_/ |_| /_/
--

-- Plugin management via Packer
require("plugins")

-- Vim mappings, see lua/config/which.lua for more mappings
require("mappings")

-- All non plugin related (vim) options
require("options")

-- Vim autocommands/autogroups
require("autocmd")
