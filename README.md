# Dotfiles

This repository contains configuration files ("dotfiles") for setting up and customizing your development environment. The configurations primarily focus on **Neovim** and **Zsh**.

## Features

### Neovim Configuration
- Plugins for enhanced functionality, including file tree navigation, syntax highlighting, and Git integration.
- Plugin management using [`lazy.nvim`](https://github.com/folke/lazy.nvim).
- Custom configurations for Telescope, Treesitter, and more.

### Zsh Shell Customization
- Useful aliases and settings to enhance productivity.
- Optional configurations for faster repository status in large projects.

## Setup and Installation

### 1. Clone this repository to your home directory:
```bash
git clone https://github.com/slick-codes/dotfiles.git ~/dotfiles
```

### 2. Symlink configuration files to their appropriate locations:
```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
```

### 3. Install dependencies for Neovim plugins:
- Ensure you have Neovim installed.
- Install `lazy.nvim` for managing plugins (see `.config/nvim/lua/config/lazy.lua`).

## Key Plugins

### Neovim
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter): Enhanced syntax highlighting and code parsing.
- [`nvim-telescope`](https://github.com/nvim-telescope/telescope.nvim): Fuzzy file finder and enhanced search.
- [`neo-tree.nvim`](https://github.com/nvim-neo-tree/neo-tree.nvim): File tree explorer.
- [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim): Git integration for Neovim.
- [`vim-illuminate`](https://github.com/RRethy/vim-illuminate): Highlights words under the cursor.

### Shell
- Customizable `.zshrc` file for shell enhancements.

## Contributions

Feel free to fork and submit pull requests for improvements or additional features. All contributions are welcome!

## License

This repository is available under the MIT License. See the [LICENSE](./LICENSE) file for more details.
