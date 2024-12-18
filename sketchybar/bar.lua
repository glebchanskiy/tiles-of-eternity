local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  height = 40,
  blur_radius=25,
  background = {
    color = colors.black
  },
  padding_right = 10,
  padding_left = 10,
  y_offset=-1
})
