{
  mkPkgs,
  inputs,
  ...
}: {
  extraPlugins = [
    (mkPkgs "menu" inputs.menu)
  ];

  extraConfigLua = ''
    vim.keymap.set("n", "<RightMouse>", function()
      vim.cmd.exec '"normal! \\<RightMouse>"'

      require("menu").open("default", { mouse = true })
    end, {})
  '';
}
