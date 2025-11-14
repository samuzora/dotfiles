import splitmind

(splitmind.Mind()
  .tell_splitter(show_titles=True)
  .tell_splitter(set_title="command")
  .right(of="main", display="legend", size="25%")
  .below(of="main", display="disasm", size="30%")
  .show("code", on="disasm", banner="none")
  .show("regs", on="legend")
).build(nobanner=True)
