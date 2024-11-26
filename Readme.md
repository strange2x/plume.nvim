# Plume.nvim

### What is Plume.nvim?

Plume.nvim is my personal Neovim configuration, which I have been hacking up for some time now. The main objective for me is the ease of use at which the users should be able to setup a workable and cool looking (very important) Neovim configuration. The number of extensions that are installed and being used is set to a minimum without affecting the functionality.

### Pre-Requisits

There is only two pre-requisit for Plume.nvim

- Make sure cmake is installed and available in path
- Make sure to star the repo (lol) (Not really a requirement but thanks)
- There are couple of packages that needs to be installed before starting with the cloning process
    - cmake (For telescope-fzf-plugin to work)

### Installation

Installation is pretty simple, just clone the repo to the .config/nvim folder and launch.

### Components

- Catppuccin Mocha theme by default
- LSP Setup with Mason and Mason LSP config
- Completions using nvim-cmp and LuaSnip
- Lualine as the status Lualine
- NvimTree as the file browser
- Telescope Integratio wherever possible
- Vim Fugitive integration
- LspSaga integration
- Treesitter
- Treesitter text objects
- One major thing is that there is both efm-langserver and Formatter.nvim integrated, both working in a way that the files that efm being the primary one, if a filetype is not supported by efm, then Formatter will try to format the particular file. If Formatter is also not available for the particular file, then LSP formatting will be tried. If all the options are not available, then sorry, no formatting for the file. But for most of the scenarios, this should cover everything.
- There is no git integration configured in this setup as I personally dont use it. I have tmux set up and the next pane that I have in my workflow is lazygit and am using it directly

### Checkout

Check the default_installed.lua file in the lua folder to see the different plugins and formatters added. If you want to add new, then just add here and it will be automatically included in the next restart

### Feature Requests

In case of any feature request, please feel free to create a Github Issue and I will take a look at it whenever possible.

In case of suggestions also, please feel free to create the issues.

Suggestions and Feature requests are always welcome.
