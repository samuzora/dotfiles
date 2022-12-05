#!/usr/bin/env python3

from pwn import *

{bindings}

context.binary = {bin_name}


def conn():
    if args.LOCAL:
        p = process({proc_args})
        if args.GDB:
            context.terminal = "kitty"
            gdb.attach(p)
    else:
        p = remote("addr", 1337)

    return p


def main():
    p = conn()

    # good luck pwning :)

    p.interactive()


if __name__ == "__main__":
    main()
