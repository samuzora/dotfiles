# Nushell Config File
#
# version = 0.80.1

# For more information on defining custom themes, see
# https://www.nushell.sh/book/coloring_and_theming.html
# And here is the theme collection
# https://github.com/nushell/nu_scripts/tree/main/themes

# aliases
alias pwninit = pwninit --template-path ~/.config/pwninit/template.py
alias zipfile = /bin/zip
alias dwl = wget --content-disposition
alias ngrok = docker run --net=host -it -e NGROK_AUTHTOKEN=2LGGmCeGgd1RjsISAKXM47E0k9Q_6b7xjFumfE5sX6mmK72MH ngrok/ngrok:latest
alias wingcc = x86_64-w64-mingw32-gcc

alias ze = zellij
alias zed = zellij delete-session
alias zec = zellij delete-session
alias zel = zellij list-sessions
alias zes = zellij -s
alias zea = zellij a

alias tms = tmux new -s
alias tml = tmux ls
alias tmk = tmux kill-session -t
alias tma = tmux a -t

def pwnrpath [
    binary: path # binary to patch
    --library-dir (-d) = ./lib: directory # directory for libraries (libc.so.6 etc)
    --linker (-l): path # path to linker binary (default: ld-linux-x86-64.so.2 in specified library-dir)
] {

    let _linker: path = if $linker != null { $linker } else { $library_dir | path join ld-linux-x86-64.so.2 }

    let binary_patched = $binary + "_patched"
    cp $binary $binary_patched

    patchelf --set-rpath $library_dir $binary_patched
    patchelf --set-interpreter $_linker $binary_patched
}

def kpwn [] { 
    help kpwn
}

# The compressed kernel image is in vmlinuz - extract it using this command
def "kpwn im" [
    --input (-i): path = ./vmlinuz # path to vmlinuz
    --output (-o): path = ./vmlinux # path to save extracted image to
] {
    extract-image.sh $input | save $output
    print "Kernel image extracted!"
}

# Further extract symbols from a kernel image
def "kpwn sym" [
    --input (-i): path = ./vmlinux # path to vmlinux
    --output (-o): path = ./vmlinux_extracted # path to save symboled vmlinux to
] {
    vmlinux-to-elf $input $output
    print "Symbols extracted!"
}

# The compressed filesystem is in initramfs.cpio - unserialize using this command
def "kpwn fs" [
    --input (-i): path = ./initramfs.cpio # path to initramfs.cpio
] {
    cat $input | cpio -idm
    print "Filesystem extracted!"
}

# Compress the filesystem with the compiled exploit in it
def "kpwn cfs" [
    --input (-i): path = ./exploit.c # path to exploit.c
] {
    compress.sh $input
}

# PATH
$env.PATH = ($env.PATH | append [
    "/home/samuzora/ctf/tools/kernel-pwn" 
    "/home/samuzora/ctf/tools/kernel-pwn/vmlinux-to-elf"
    "/mnt/c/Program Files/IDA Professional 9.2" 
    "/mnt/c/Users/lucas/AppData/Local/SumatraPDF" 
    "/home/samuzora/.local/share/gem/ruby/3.0.0/bin"
    "/home/samuzora/.cargo/bin"
    "/home/samuzora/go/bin"
    "/usr/bin/vendor_perl"
    "/mnt/c/Users/lucas/.cargo/bin"
    "/mnt/c/Users/lucas/scoop/apps/goneovim"
    "~/.wasmtime/bin"
    "/home/samuzora/ctf/tools/wabt/build"
    "/home/samuzora/.foundry/bin"
    "/home/samuzora/ctf/tools/depot_tools"
    "/home/samuzora/.huff/bin"
    "/home/samuzora/ctf/tools/esptool"
    "/home/samuzora/ctf/tools/esp32_image_parser"
    "/home/samuzora/ctf/tools/vdexExtractor/bin"
    "/home/samuzora/.wokwi/bin"
    "/home/samuzora/ctf/comp/2025-H0/greyctf/finals/google-cloud-sdk/path.bash.inc"
])

# fnm setup
load-env (fnm env --shell bash | lines | str replace 'export ' '' | str replace -a '"' '' | split column "=" | rename name value | where name != "FNM_ARCH" and name != "PATH" | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value })
$env.PATH = ($env.PATH | prepend $"($env.FNM_MULTISHELL_PATH)/bin")

let dark_theme = {
    # color for nushell primitives
    separator: white
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    bool: {|| if $in { 'light_cyan' } else { 'light_gray' } }
    int: white
    filesize: {|e|
        if $e == 0b {
            'white'
        } else if $e < 1mb {
            'cyan'
        } else { 'blue' }
    }
    duration: white
    date: {|| (date now) - $in |
        if $in < 1hr {
            'purple'
        } else if $in < 6hr {
            'red'
        } else if $in < 1day {
            'yellow'
        } else if $in < 3day {
            'green'
        } else if $in < 1wk {
            'light_green'
        } else if $in < 6wk {
            'cyan'
        } else if $in < 52wk {
            'blue'
        } else { 'dark_gray' }
    }
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cellpath: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray
    search_result: {bg: red fg: white}

    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: white bg: red attr: b}
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
}

let light_theme = {
    # color for nushell primitives
    separator: dark_gray
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    bool: {|| if $in { 'dark_cyan' } else { 'dark_gray' } }
    int: dark_gray
    filesize: {|e|
        if $e == 0b {
            'dark_gray'
        } else if $e < 1mb {
            'cyan_bold'
        } else { 'blue_bold' }
    }
    duration: dark_gray
    date: {|| (date now) - $in |
        if $in < 1hr {
            'purple'
        } else if $in < 6hr {
            'red'
        } else if $in < 1day {
            'yellow'
        } else if $in < 3day {
            'green'
        } else if $in < 1wk {
            'light_green'
        } else if $in < 6wk {
            'cyan'
        } else if $in < 52wk {
            'blue'
        } else { 'dark_gray' }
    }
    range: dark_gray
    float: dark_gray
    string: dark_gray
    nothing: dark_gray
    binary: dark_gray
    cellpath: dark_gray
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray
    search_result: {fg: white bg: red}

    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: white bg: red attr: b}
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
}

# External completer example
# let carapace_completer = {|spans|
#     carapace $spans.0 nushell $spans | from json
# }


# The default config record. This is where much of your global configuration is setup.
$env.config = {
    # true or false to enable or disable the welcome banner at startup
    show_banner: false,
    ls: {
        use_ls_colors: true # use the LS_COLORS environment variable to colorize output
        clickable_links: true # enable or disable clickable links. Your terminal has to support links.
    }
    rm: {
        always_trash: true # always act as if -t was given. Can be overridden with -p
    }
    table: {
        mode: light # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
        index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
        show_empty: true # show 'empty list' and 'empty record' placeholders for command output
        trim: {
            methodology: wrapping # wrapping or truncating
            wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
            truncating_suffix: "..." # A suffix used by the 'truncating' methodology
        }
    }

    explore: {
        help_banner: true
        exit_esc: true

        command_bar_text: '#C4C9C6'
        # command_bar: {fg: '#C4C9C6' bg: '#223311' }

        status_bar_background: {fg: '#1D1F21' bg: '#C4C9C6' }
        # status_bar_text: {fg: '#C4C9C6' bg: '#223311' }

        highlight: {bg: 'yellow' fg: 'black' }

        status: {
            # warn: {bg: 'yellow', fg: 'blue'}
            # error: {bg: 'yellow', fg: 'blue'}
            # info: {bg: 'yellow', fg: 'blue'}
        }

        try: {
            # border_color: 'red'
            # highlighted_color: 'blue'

            # reactive: false
        }

        table: {
            split_line: '#404040'

            cursor: true

            line_index: true
            line_shift: true
            line_head_top: true
            line_head_bottom: true

            show_head: true
            show_index: true

            # selected_cell: {fg: 'white', bg: '#777777'}
            # selected_row: {fg: 'yellow', bg: '#C1C2A3'}
            # selected_column: blue

            # padding_column_right: 2
            # padding_column_left: 2

            # padding_index_left: 2
            # padding_index_right: 1
        }

        config: {
            cursor_color: {bg: 'yellow' fg: 'black' }

            # border_color: white
            # list_color: green
        }
    }

    history: {
        max_size: 10000 # Session has to be reloaded for this to take effect
        sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
        file_format: "sqlite" # "sqlite" or "plaintext"
        isolation: true # true enables history isolation, false disables it. true will allow the history to be isolated to the current session. false will allow the history to be shared across all sessions.
    }
    completions: {
        case_sensitive: false # set to true to enable case-sensitive completions
        quick: true  # set this to false to prevent auto-selecting completions when only one remains
        partial: true  # set this to false to prevent partial filling of the prompt
        algorithm: "prefix"  # prefix or fuzzy
        external: {
            enable: false # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up my be very slow
            max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
            completer: null # check 'carapace_completer' above as an example
        }
    }
    # filesize: {
    #     metric: true # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
    #     format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
    # }
    cursor_shape: {
        emacs: line # block, underscore, line, blink_block, blink_underscore, blink_line (line is the default)
        vi_insert: block # block, underscore, line , blink_block, blink_underscore, blink_line (block is the default)
        vi_normal: underscore # block, underscore, line, blink_block, blink_underscore, blink_line (underscore is the default)
    }
    color_config: $dark_theme   # if you want a light theme, replace `$dark_theme` to `$light_theme`
    footer_mode: 25 # always, never, number_of_rows, auto
    float_precision: 2 # the precision for displaying floats in tables
    use_ansi_coloring: true
    bracketed_paste: true # enable bracketed paste, currently useless on windows
    edit_mode: vi # emacs, vi
    shell_integration: {
        # osc2 abbreviates the path if in the home_dir, sets the tab/window title, shows the running command in the tab/window title
        osc2: true
        # osc7 is a way to communicate the path to the terminal, this is helpful for spawning new tabs in the same directory
        osc7: true
        # osc8 is also implemented as the deprecated setting ls.show_clickable_links, it shows clickable links in ls output if your terminal supports it. show_clickable_links is deprecated in favor of osc8
        osc8: true
        # osc9_9 is from ConEmu and is starting to get wider support. It's similar to osc7 in that it communicates the path to the terminal
        osc9_9: false
        # osc133 is several escapes invented by Final Term which include the supported ones below.
        # 133;A - Mark prompt start
        # 133;B - Mark prompt end
        # 133;C - Mark pre-execution
        # 133;D;exit - Mark execution finished with exit code
        # This is used to enable terminals to know where the prompt is, the command is, where the command finishes, and where the output of the command is
        osc133: true
        # osc633 is closely related to osc133 but only exists in visual studio code (vscode) and supports their shell integration features
        # 633;A - Mark prompt start
        # 633;B - Mark prompt end
        # 633;C - Mark pre-execution
        # 633;D;exit - Mark execution finished with exit code
        # 633;E - NOT IMPLEMENTED - Explicitly set the command line with an optional nonce
        # 633;P;Cwd=<path> - Mark the current working directory and communicate it to the terminal
        # and also helps with the run recent menu in vscode
        osc633: true
        # reset_application_mode is escape \x1b[?1l and was added to help ssh work better
        reset_application_mode: true
    }
    render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.

    hooks: {
        pre_prompt: [{||
            null  # replace with source code to run before the prompt is shown
        }]
        pre_execution: [{||
            null  # replace with source code to run before the repl input is run
        }]
        env_change: {
            PWD: [{|before, after|
                null  # replace with source code to run if the PWD environment is different since the last repl input
            }]
        }
        display_output: {||
            if (term size).columns >= 100 { table -e } else { table }
        }
        command_not_found: {||
            null  # replace with source code to return an error message when a command is not found
        }
    }
    menus: [
        # Configuration for default nushell menus
        # Note the lack of source parameter
        {
            name: completion_menu
            only_buffer_difference: false
            marker: "| "
            type: {
                layout: columnar
                columns: 4
                col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
        {
            name: history_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: list
                page_size: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
        {
            name: help_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: description
                columns: 4
                col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
                selection_rows: 4
                description_rows: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
        # Example of extra menus created using a nushell source
        # Use the source field to create a list of records that populates
        # the menu
        {
            name: commands_menu
            only_buffer_difference: false
            marker: "# "
            type: {
                layout: columnar
                columns: 4
                col_width: 20
                col_padding: 2
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
            source: { |buffer, position|
                $nu.scope.commands
                | where name =~ $buffer
                | each { |it| {value: $it.name description: $it.usage} }
            }
        }
        {
            name: vars_menu
            only_buffer_difference: true
            marker: "# "
            type: {
                layout: list
                page_size: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
            source: { |buffer, position|
                $nu.scope.vars
                | where name =~ $buffer
                | sort-by name
                | each { |it| {value: $it.name description: $it.type} }
            }
        }
        {
            name: commands_with_description
            only_buffer_difference: true
            marker: "# "
            type: {
                layout: description
                columns: 4
                col_width: 20
                col_padding: 2
                selection_rows: 4
                description_rows: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
            source: { |buffer, position|
                $nu.scope.commands
                | where name =~ $buffer
                | each { |it| {value: $it.name description: $it.usage} }
            }
        }
    ]
    keybindings: [
        {
            name: completion_menu
            modifier: none
            keycode: tab
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: completion_menu }
                    { send: menunext }
                ]
            }
        }
        {
            name: completion_previous
            modifier: shift
            keycode: backtab
            mode: [emacs, vi_normal, vi_insert] # Note: You can add the same keybinding to all modes by using a list
            event: { send: menuprevious }
        }
        {
            name: history_menu
            modifier: control
            keycode: char_r
            mode: emacs
            event: { send: menu name: history_menu }
        }
        {
            name: next_page
            modifier: control
            keycode: char_x
            mode: emacs
            event: { send: menupagenext }
        }
        {
            name: undo_or_previous_page
            modifier: control
            keycode: char_z
            mode: emacs
            event: {
                until: [
                    { send: menupageprevious }
                    { edit: undo }
                ]
            }
        }
        {
            name: yank
            modifier: control
            keycode: char_y
            mode: emacs
            event: {
                until: [
                    {edit: pastecutbufferafter}
                ]
            }
        }
        {
            name: unix-line-discard
            modifier: control
            keycode: char_u
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {edit: cutfromlinestart}
                ]
            }
        }
        {
            name: kill-line
            modifier: control
            keycode: char_k
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    {edit: cuttolineend}
                ]
            }
        }
        # Keybindings used to trigger the user defined menus
        {
            name: commands_menu
            modifier: control
            keycode: char_t
            mode: [emacs, vi_normal, vi_insert]
            event: { send: menu name: commands_menu }
        }
        {
            name: vars_menu
            modifier: alt
            keycode: char_o
            mode: [emacs, vi_normal, vi_insert]
            event: { send: menu name: vars_menu }
        }
        {
            name: commands_with_description
            modifier: control
            keycode: char_s
            mode: [emacs, vi_normal, vi_insert]
            event: { send: menu name: commands_with_description }
        }
    ]
}

use ~/.config/nushell/starship/init.nu
source ~/.zoxide.nu

# wslg workaround
# dbus-update-activation-environment --systemd DISPLAY
