{
  mkKey,
  specObj,
  ...
}: let
  inherit (mkKey) mkKeymap;

  normal = [
    (mkKeymap "n" "<s-h>" "<esc>:bprev<cr>" "Previous Buffer")
    (mkKeymap "n" "<s-l>" "<esc>:bnext<cr>" "Next Buffer")

    (mkKeymap "n" "<C-d>" "<C-d>zz" "Scroll Down and Recenter")
    (mkKeymap "n" "<C-u>" "<C-u>zz" "Scroll Up and Recenter")
    (mkKeymap "n" "<leader>A" "gg0vG$" "Select All")
    (mkKeymap "n" "<leader>F" "<cmd>lua vim.lsp.buf.declaration()<cr>" "Go to Declaration")
    (mkKeymap "n" "<leader>N" "<cmd>lua vim.diagnostic.goto_prev()<cr>" "Go to Previous Diagnostic")
    (mkKeymap "n" "<leader>a" "<cmd>lua vim.lsp.buf.code_action()<cr>" "Code Action")
    (mkKeymap "n" "<leader>d" "<cmd>lua vim.diagnostic.open_float()<cr>" "Diagnostics")
    (mkKeymap "n" "<leader>f" "<cmd>lua vim.lsp.buf.definition()<cr>" "Go to Definition")
    (mkKeymap "n" "<leader>n" "<cmd>lua vim.diagnostic.goto_next()<cr>" "Go to Next Diagnostic")
    (mkKeymap "n" "<leader>r" "<cmd>lua vim.lsp.buf.rename()<cr>" "Rename Symbol")
    (mkKeymap "n" "<leader>t" "<cmd>lua require('alternate-toggler').toggleAlternate()<cr>" "Toggle Alternate")
  ];

  v = [
    (mkKeymap "v" "<" "<gv" "Indent out")
    (mkKeymap "v" ">" ">gv" "Indent in")
    (mkKeymap "v" "s" "<esc><cmd>'<,'>sort<cr>" "Sort Visual Selection")
  ];
in {
  keymaps = normal ++ v;

  wKeyList = [
    (specObj ["<leader>A" "" "" "true"])
    (specObj ["<leader><leader>" "" "" "true"])
    (specObj ["<leader>q" "" "quit/session"])
    (specObj ["<leader><tab>" "" "tabs"])
    (specObj ["z" "" "fold"])
    (specObj ["g" "" "goto"])
    (specObj ["[" "" "next"])
    (specObj ["]" "" "prev"])
    (specObj ["<leader>u" "󰔎" "ui"])
    (specObj ["<leader>|" "" "vsplit"])
    (specObj ["<leader>-" "" "split"])
  ];

  extraConfigLua = ''
    -- Use black hole register for 'x', 'X', 'c', 'C'
    vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'X', '"_X', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'C', '"_C', { noremap = true, silent = true })

    -- Visual mode
    vim.api.nvim_set_keymap('v', 'x', '"_d', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', 'X', '"_d', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', 'C', '"_c', { noremap = true, silent = true })


    -- In visual mode, paste from the clipboard without overwriting it
    vim.api.nvim_set_keymap("v", "p", '"_dP', { noremap = true, silent = true })

    -- Only this hack works in command mode
    vim.cmd([[
      cnoremap <C-j> <C-n>
      cnoremap <C-k> <C-p>
    ]])
  '';
}
