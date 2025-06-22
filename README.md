# Nvim Configuration by Moeez Ali

This repository (`github.com/moeezali2375/nvim`) contains my personal Neovim configuration, designed to provide a **fast, efficient, and highly customizable** development environment.

---

## Features

* **⚡️ Speedy Startup:** Optimized for quick loading times.
* **🧠 Intelligent Autocompletion:** Powered by Language Server Protocol (LSP) for various languages.
* **💡 Smart Code Navigation:** Easily jump to definitions, references, and implementations.
* **🎨 Intuitive Syntax Highlighting:** Clear and readable code with Treesitter.
* **⚙️ Robust Plugin Management:** Using `lazy.nvim` for efficient plugin handling.
* **🚀 Enhanced Productivity:** Keybindings and custom functions to streamline your workflow.

---

## Installation

### Prerequisites

* **Neovim (v0.9.0 or later):** Ensure you have a recent version of Neovim installed. You can download it from the [official Neovim website](https://neovim.io/).
* **Git:** Required to clone the repository.
* **Stow:** (Recommended) For symlinking the configuration files. Install it via your system's package manager (e.g., `sudo apt install stow` on Debian/Ubuntu, `brew install stow` on macOS).

### Steps

1.  **Backup your existing Neovim configuration (optional but recommended):**

    ```bash
    mv ~/.config/nvim ~/.config/nvim_backup
    ```

2.  **Clone this repository:**

    ```bash
    git clone [https://github.com/moeezali2375/nvim.git](https://github.com/moeezali2375/nvim.git) ~/.config/nvim
    ```

3.  **Install plugins:**

    Open Neovim:

    ```bash
    nvim
    ```

    `lazy.nvim` will automatically detect and install the plugins defined in the configuration. This may take a few moments.

4.  **Install Language Servers, Formatters, and Linters (Optional):**

    Depending on the languages you work with, you may need to install specific language servers, formatters, and linters. These are typically managed by `nvim-lspconfig` and `null-ls.nvim` within this configuration. Refer to their respective documentation for details on installing specific tools.

---

## Usage

### Keybindings

This configuration uses a `leader` key set to **`<space>`**. Many of the custom keybindings are organized around this leader key.

Here are some common keybinding categories (not an exhaustive list):

* **`<leader>ff`**: Find files (using Telescope)
* **`<leader>fg`**: Grep (search within files, using Telescope)
* **`<leader>fs`**: Search current buffer (using Telescope)
* **`<leader>tv`**: Toggle NvimTree (file explorer)
* **`<leader>h`**: Go to definition (LSP)
* **`<leader>gr`**: Go to references (LSP)
* **`<leader>rn`**: Rename symbol (LSP)
* **`<leader>ca`**: Code actions (LSP)

**Explore more keybindings within the `lua/moez/keymaps.lua` file.**

### Plugins

This configuration leverages several powerful plugins:

* **`lazy.nvim`**: A modern plugin manager for Neovim.
* **`nvim-lspconfig`**: Neovim's built-in LSP client configuration.
* **`nvim-tree/nvim-tree.lua`**: A file explorer.
* **`nvim-telescope/telescope.nvim`**: A highly extensible fuzzy finder.
* **`nvim-treesitter/nvim-treesitter`**: For enhanced syntax highlighting and parsing.
* **`hrsh7th/nvim-cmp`**: Autocompletion plugin.
* **`williamboman/mason.nvim` & `williamboman/mason-lspconfig.nvim`**: Simplified management of LSP servers, DAP servers, and linters.
* **`jose-rivas/null-ls.nvim`**: Use Neovim as a language server for various linters, formatters, etc.

**Refer to the `lua/moez/lazy.lua` file for the full list of plugins and their configurations.**

---

## Customization

This configuration is designed to be easily customizable.

* **`lua/keymaps.lua`**: Defines all custom keybindings.
* **`init.lua`**: Manages all plugins and their individual configurations.

Feel free to modify these files to suit your preferences and workflow.

---

## Contributing

If you find this configuration useful or have suggestions for improvements, feel free to open an issue or submit a pull request!
