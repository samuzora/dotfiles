#!/usr/bin/env python3

from pwn import *

{bindings}

context.binary = {bin_name}
context.terminal = ["tmux", "splitw", "-v"]

def rol(val: int, r_bits: int = 0x11, max_bits: int = 64) -> int:
    return (val << r_bits % max_bits) & (2 ** max_bits - 1) | ((val & (2 ** max_bits - 1)) >> (max_bits - (r_bits % max_bits)))

def encrypt(pos: int, ptr: int):
    return (pos >> 12) ^ ptr

def decrypt(val: int):
    mask = 0xfff << 52
    while mask:
        v = val & mask
        val ^= (v >> 12)
        mask >>= 12
    return val

if args.LOCAL:
    p = process({proc_args})
    if args.GDB:
        gdb.attach(p)
        pause()
else:
    p = remote("addr", 1337)

# good luck pwning :)

p.interactive()
