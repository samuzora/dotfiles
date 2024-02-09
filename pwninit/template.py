#!/usr/bin/env python3

from pwn import *
import time

{bindings}

context.binary = {bin_name}

if args.LOCAL:
    p = process({proc_args})
    if args.GDB:
        gdb.attach(p)
        pause()
else:
    p = remote("addr", 1337)

# good luck pwning :)

p.interactive()
