{
  mkPkgs,
  inputs,
  ...
}: {
  extraPlugins = [(mkPkgs "borderline" inputs.borderline)];

  extraConfigLua = ''
    require('borderline').setup({
      border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }
    })
  '';
}
