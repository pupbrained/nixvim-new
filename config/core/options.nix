{lib, ...}:
with lib; {
  enableMan = true;
  viAlias = true;
  vimAlias = true;

  autoCmd = [
    {
      command = "set guicursor=a:ver1-blinkon0";
      event = "VimLeave";
      pattern = "*";
    }
  ];

  clipboard = {
    register = "unnamedplus";

    providers = {
      wl-copy.enable = true;
      xclip.enable = true;
    };
  };

  globals.mapleader = " ";

  opts = {
    cursorline = true;
    cursorlineopt = "number";

    pumblend = 0;
    pumheight = 10;

    expandtab = true;
    shiftwidth = 2;
    smartindent = true;
    tabstop = 2;
    softtabstop = 2;

    ignorecase = true;
    smartcase = true;
    mouse = "a";
    cmdheight = 0;

    number = true;
    relativenumber = true;
    numberwidth = 2;
    ruler = false;

    signcolumn = "yes";
    splitbelow = true;
    splitright = true;
    timeoutlen = mkDefault 400;
    splitkeep = "screen";
    termguicolors = true;

    conceallevel = 2;

    undofile = true;

    wrap = false;

    virtualedit = "block";
    winminwidth = 5;
    fileencoding = "utf-8";
    list = true;
    smoothscroll = true;
    scrolloff = 5;

    #interval for writing swap file to disk, also used by gitsigns
    updatetime = 250;

    fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:";
    foldcolumn = "1";
    foldenable = true;
    foldlevel = 99;
    foldlevelstart = 99;
  };

  extraLuaPackages = ps: with ps; [luarocks];

  extraConfigLua = ''
    vim.opt.whichwrap:append("<>[]hl")
    vim.opt.listchars:append("space:·")
  '';
}
