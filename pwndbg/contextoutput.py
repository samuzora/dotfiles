import splitmind

(splitmind.Mind()
  .tell_splitter(show_titles=True)
  .tell_splitter(set_title="command")
  .above(of="main", display="disasm", banner="top", size="30%")
  .show("code", on="disasm", banner="none")
  .right(of="main", display="stack", size="25%")
  .above(of="main", display="legend", size="60%")
  .show("regs", on="legend")
).build(nobanner=True)
