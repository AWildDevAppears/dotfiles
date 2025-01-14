local bindings = {
    toggle_term = "<A-t>",
    toggle_outline = "<nop>",
    toggle_diagnostics = "<nop>",

    -- Buffers
    prev_buffer = "<A-,>",
    next_buffer = "<A-.>",

    -- Documentation
    hover_docs = "K",

    -- GOTO
    goto_definition = "<leader>gd",      -- Goto Definition
    goto_type_definition = "<leader>gD", -- Goto Type definition
    goto_references = "<leader>gA",      -- Goto All references
    code_actions = "<leader>a",

    -- Files
    find_file = "<leader>ff",
    find_string = "<leader>fg",
    rename = "<leader>cd", -- Change definition
    find_in_current_file = "<leader>gs",
    file_format = "<leader>fi",

    -- Comments
    comment = "<leader>gc",
    block_comment = "<leader>gb",

    -- Sidebar
    toggle_sidebar = "<C-b>",
    focus_sidebar = "\\",

    -- Jump
    jump_normal = "s",
    jump_treesitter = "S",

    -- Diagnostics
    diag_continue = "<F5>",
    diag_step_over = "<F10>",
    diag_step_into = "<F11>",
    diag_step_out = "<F12>",
    diag_toggle_breakpoint = "<leader>db",
    diag_open_repl = "<leader>dr",
    diag_next = "]d",
    diag_prev = "[d",

    -- Terminal
    toggle_terminal = "<A-t>",

    -- Macros
    macro_file_format = "<C-I>",

    -- ZED
    zed_workspace_open = "<C-o>",
    zed_confirm = "<Enter>",
    zed_diagnostics = "<F8>",
}

return bindings
