return {
  "3rd/diagram.nvim",
  dependencies = {
    "3rd/image.nvim",
  },
  opts = {
    renderer_options = {
      mermaid = {
        background = "transparent",
        theme = "dark",
      },
      plantuml = {
        charset = "UTF-8",
      },
      d2 = {
        theme = "200",
      },
    },
  },
}
