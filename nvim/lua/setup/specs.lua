require('specs').setup({
  show_jumps = true,
  min_jump = 15,
  popup = {
    inc_ms = 20,
    blend = 10,
    fader = require('specs').linear_fader,
    resizer = require('specs').shrink_resizer,
    winhl = "PMenu",
  }
})
require('specs').toggle()
