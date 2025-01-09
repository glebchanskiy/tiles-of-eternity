local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local cpu = sbar.add("item", "widgets.cpu",{
  position = "right",
  background = {
    height = 22,
    color = { alpha = 0 },
    border_color = { alpha = 0 },
    drawing = true,
  },
  icon = { string = icons.memory },
  label = {
    string = "0GB",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 13.0,
    },
    align = "right",
  },
  padding_right = settings.paddings + 6
})

cpu:subscribe("system_stats", function(env)
  local load = tonumber(env.RAM_USED)
  cpu:set({
    label = env.RAM_USED,
  })
end)
-- Background around the cpu item
sbar.add("bracket", "widgets.cpu.bracket", { cpu.name }, {
  background = { color = colors.bg1 }
})

-- Background around the cpu item
sbar.add("item", "widgets.cpu.padding", {
  position = "right",
  width = settings.group_paddings
})
