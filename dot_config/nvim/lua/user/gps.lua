local icons = require("user.icons")

local navic = require("nvim-navic")
-- Customized config
navic.setup({
    disable_icons = false,                          -- Setting it to true will disable all icons
    icons = {
        ["class-name"] = icons.kind.Class .. " ",   -- Classes and class-like objects
        ["function-name"] = icons.kind.Function .. " ", -- Functions
        ["method-name"] = icons.kind.Method .. " ", -- Methods (functions inside class-like objects)
        ["container-name"] = icons.type.Object .. " ", -- Containers (example: lua tables)
        ["tag-name"] = icons.misc.Tag .. " ",       -- Tags (example: html tags)
        ["mapping-name"] = icons.type.Object .. " ",
        ["sequence-name"] = icons.type.Array .. " ",
        ["null-name"] = icons.kind.Field .. " ",
        ["boolean-name"] = icons.type.Boolean .. " ",
        ["integer-name"] = icons.type.Number .. " ",
        ["float-name"] = icons.type.Number .. " ",
        ["string-name"] = icons.type.String .. " ",
        ["array-name"] = icons.type.Array .. " ",
        ["object-name"] = icons.type.Object .. " ",
        ["number-name"] = icons.type.Number .. " ",
        ["table-name"] = icons.ui.Table .. " ",
        ["date-name"] = icons.ui.Calendar .. " ",
        ["date-time-name"] = icons.ui.Table .. " ",
        ["inline-table-name"] = icons.ui.Calendar .. " ",
        ["time-name"] = icons.misc.Watch .. " ",
        ["module-name"] = icons.kind.Module .. " ",
    },
    separator = " " .. icons.ui.ChevronRight .. " ",
    -- limit for amount of context shown
    -- 0 means no limit
    -- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
    -- in context names (eg: function names, class names, etc)
    depth = 0,
    -- indicator used when context is hits depth limit
    depth_limit_indicator = "..",
})
