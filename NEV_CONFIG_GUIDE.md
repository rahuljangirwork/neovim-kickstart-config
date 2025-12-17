# 🚀 Rahul's Neovim Kickstart Configuration

Welcome to **Rahul's Neovim Configuration** project! This is a complete, beginner-friendly setup for Neovim, designed to be fast, beautiful, and easy to use.

Whether you are new to Neovim or looking for a solid starting point, this guide will help you install, understand, and master this configuration.

---

## 📋 Project Overview

This configuration is built with **Lua**, the modern configuration language for Neovim. It uses the **Lazy.nvim** package manager to handle plugins efficiently.

### ✨ Key Features
- **⚡ Fast Startup**: Optimized for speed using lazy loading.
- **🎨 Beautiful UI**: Uses the **Nord** color scheme for a clean, professional look.
- **📁 File Explorer**: integrated **Neo-tree** for easy file navigation.
- **🔍 Fuzzy Finding**: **Telescope** for finding files, text, and commands instantly.
- **🧠 Intelligent Coding**: 
    - **LSP** (Language Server Protocol) for code intelligence.
    - **Treesitter** for advanced syntax highlighting.
    - **Autocompletion** for faster coding.
    - **None-ls** for formatting and linting.
- **⌨️ Efficient Keymaps**: Custom shortcuts to keep your hands on the keyboard.

---

## 🛠️ Prerequisites

Before installing this configuration, make sure you have the following tools installed on your Linux system:

1.  **Neovim** (Version 0.9 or later recommended)
    ```bash
    # Ubuntu/Debian
    sudo apt install neovim
    
    # Arch Linux
    sudo pacman -S neovim
    ```
2.  **Git** (To clone the repository)
    ```bash
    sudo apt install git
    ```
3.  **Nerd Font** (Important for icons!)
    - Download and install a Nerd Font (e.g., [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)).
    - Set this font in your terminal emulator settings.
4.  **C Compiler** (gcc) & **Make** (Required for some plugins like Treesitter/Telescope)
    ```bash
    sudo apt install build-essential
    ```
5.  **Ripgrep** (For fast searching with Telescope)
    ```bash
    sudo apt install ripgrep
    ```

---

## 📥 Installation

Installing this configuration is as simple as cloning this repository into your Neovim configuration directory.

> [!WARNING]
> This will overwrite your existing Neovim configuration. Back up your `~/.config/nvim` folder if you have one!

1.  **Backup old config (optional but recommended)**:
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    ```

2.  **Clone the Repository**:
    ```bash
    git clone https://github.com/rahuljangirwork/neovim-kickstart-config.git ~/.config/nvim
    ```

3.  **Start Neovim**:
    ```bash
    nvim
    ```
    Neovim will automatically detect the new configuration and start installing all plugins via **lazy.nvim**. Wait for the process to complete, then restart Neovim.

---

## ⌨️ Keymaps & Usage Guide

The Leader Key is set to: **`<Space>`**

### 📂 File Management
| Keybinding | Action |
|------------|--------|
| `<C-s>` | Save file |
| `<leader>sn` | Save without formatting |
| `<C-q>` | Quit file |
| `<leader>e` | Toggle File Explorer (Neo-tree) |

### 🪟 Window Management
| Keybinding | Action |
|------------|--------|
| `<leader>v` | Split window **vertically** |
| `<leader>h` | Split window **horizontally** |
| `<leader>se` | Make split windows equal size |
| `<leader>xs` | Close current split window |
| `<C-h/j/k/l>` | Navigate Left/Down/Up/Right between windows |
| `<Arrows>` | Resize active window |

### 📑 Buffer & Tab Management
| Keybinding | Action |
|------------|--------|
| `<Tab>` | Next Buffer |
| `<S-Tab>` | Previous Buffer |
| `<leader>x` | Close current Buffer |
| `<leader>b` | New Buffer |
| `<leader>to` | Open new Tab |
| `<leader>tx` | Close current Tab |
| `<leader>tn/tp` | Next/Previous Tab |

### 🔍 Search & Find (Telescope)
| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find Files |
| `<leader>fg` | Live Grep (Search text in all files) |
| `<leader>fb` | Find Buffers |
| `<leader>fh` | Help Tags |

### 🧠 Code Intelligence (LSP)
| Keybinding | Action |
|------------|--------|
| `gd` | Go to Definition |
| `gr` | Go to References |
| `K` | Hover Documentation |
| `<leader>ca` | Code Actions |
| `<leader>rn` | Rename Symbol |
| `<leader>d` | Open Diagnostics (Errors/Warnings) |

### 🎨 Theme & Visuals
| Keybinding | Action |
|------------|--------|
| `<leader>bg` | Toggle Background Transparency |
| `<leader>lw` | Toggle Line Wrapping |

---

## 🏗️ Configuration Structure

If you want to modify this configuration, here is how the files are organized in the `lua/` directory:

```text
~/.config/nvim
├── init.lua              # Entry point: loads core config and lazy.nvim
├── lazy-lock.json        # Lockfile for plugin versions (Do not edit manually)
└── lua/
    ├── core/             # Core Neovim settings
    │   ├── options.lua   # Vim options (line numbers, tabs, etc.)
    │   ├── keymaps.lua   # Global keybindings
    │   └── snippets.lua  # Custom snippets
    └── plugins/          # Plugin configurations
        ├── colortheme.lua     # Nord theme setup
        ├── lsp.lua            # Language Server Protocol setup
        ├── treesitter.lua     # Syntax highlighting
        ├── telescope.lua      # Fuzzy finder
        ├── neotree.lua        # File explorer
        └── ... (other plugins)
```

To add a new plugin, simply create a new file in `lua/plugins/my-plugin.lua` and return the lazy.nvim plugin spec!

---

## ❓ FAQ

**Q: My icons are showing as boxes!**  
A: You likely haven't installed a **Nerd Font**. Please install one (like JetBrainsMono Nerd Font) and configure your terminal to use it.

**Q: How do I update plugins?**  
A: Open Neovim and run the command `:Lazy update`.

---

Happy Coding! 🚀
