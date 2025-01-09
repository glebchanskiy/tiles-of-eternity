local icons = require("icons")
local colors = require("colors")
local settings = require("settings")


-- Execute the event provider binary which provides the event "cpu_update" for
-- the cpu load data, which is fired every 2.0 seconds.
sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0")

local cpu = sbar.add("item", "widgets.memory",{
  position = "right",
  background = {
    height = 22,
    color = { alpha = 0 },
    border_color = { alpha = 0 },
    drawing = true,
  },
  icon = { string = icons.cpu },
  label = {
    string = "0%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 13.0,
    },
    align = "right",
  },
  padding_right = settings.paddings + 6
})

cpu:subscribe("cpu_update", function(env)
  local load = tonumber(env.total_load)
  cpu:set({
    label = env.total_load .. "%",
  })
end)
-- Background around the cpu item
sbar.add("bracket", "widgets.memory.bracket", { cpu.name }, {
  background = { color = colors.bg1 }
})

-- Background around the cpu item
sbar.add("item", "widgets.memory.padding", {
  position = "right",
  width = settings.group_paddings
})
