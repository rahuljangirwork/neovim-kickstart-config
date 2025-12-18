# 📖 Complete Guide to Rahul's Neovim Configuration

> **A comprehensive guide for beginners to understand, install, and master this Neovim configuration.**

---

## 📑 Table of Contents

1. [What is This?](#-what-is-this)
2. [Prerequisites](#-prerequisites)
3. [Installation](#-installation)
4. [First Launch](#-first-launch)
5. [Understanding Neovim Basics](#-understanding-neovim-basics)
6. [Complete Keybindings Reference](#-complete-keybindings-reference)
7. [Plugins Explained](#-plugins-explained)
8. [Configuration Structure](#-configuration-structure)
9. [How to Customize](#-how-to-customize)
10. [Troubleshooting](#-troubleshooting)
11. [FAQ](#-faq)

---

## 🎯 What is This?

This is a **complete Neovim configuration** designed to turn Neovim (a terminal-based text editor) into a powerful, modern IDE (Integrated Development Environment) similar to VS Code, but faster and more keyboard-focused.

### ✨ Key Features

- **⚡ Lightning Fast**: Starts in milliseconds, not seconds
- **🎨 Beautiful UI**: Nordic-themed color scheme with transparent background
- **📁 File Explorer**: Neo-tree for easy file navigation
- **🔍 Fuzzy Finder**: Find files and text instantly with Telescope
- **🧠 Smart Code Intelligence**:
  - **LSP**: Code completion, go-to-definition, error checking
  - **Treesitter**: Advanced syntax highlighting
  - **Auto-formatting**: Code formats automatically on save
- **📊 Status Line**: Information-rich status bar with Lualine
- **🔄 Git Integration**: See git changes directly in the editor
- **⌨️ Efficient Keybindings**: Everything accessible from the keyboard

### 🎓 Who is This For?

- **Beginners** who want a ready-to-use Neovim setup
- **Developers** looking for a fast, keyboard-driven IDE
- **Students** learning to code with a professional setup
- **Anyone** who wants to understand how Neovim works

---

## 🛠️ Prerequisites

Before installing, make sure you have these tools on your Linux system:

### 1. **Neovim** (Version 0.9 or newer)

```bash
# Ubuntu/Debian
sudo apt install neovim

# Arch Linux
sudo pacman -S neovim

# Check version (should be 0.9+)
nvim --version
```

### 2. **Git** (To clone repositories)

```bash
# Ubuntu/Debian
sudo apt install git

# Arch Linux
sudo pacman -S git
```

### 3. **Nerd Font** (⚠️ IMPORTANT for icons!)

Without a Nerd Font, you'll see boxes (□) instead of icons.

1. Download a Nerd Font: [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip)
2. Extract and install:
   ```bash
   mkdir -p ~/.local/share/fonts
   unzip JetBrainsMono.zip -d ~/.local/share/fonts/
   fc-cache -fv
   ```
3. **Set the font in your terminal emulator settings**

### 4. **Build Tools** (For Telescope and Treesitter)

```bash
# Ubuntu/Debian
sudo apt install build-essential

# Arch Linux
sudo pacman -S base-devel
```

### 5. **Ripgrep** (For fast text searching)

```bash
# Ubuntu/Debian
sudo apt install ripgrep

# Arch Linux
sudo pacman -S ripgrep
```

### 6. **Node.js** (For many LSP servers)

```bash
# Ubuntu/Debian
sudo apt install nodejs npm

# Arch Linux
sudo pacman -S nodejs npm
```

---

## 📥 Installation

> [!WARNING]
> This will **replace** your current Neovim config. Back up first if you have one!

### Step 1: Backup Existing Configuration (Optional but Recommended)

```bash
# Backup your current config
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
```

### Step 2: Clone This Repository

```bash
git clone https://github.com/rahuljangirwork/neovim-kickstart-config.git ~/.config/nvim
```

### Step 3: Start Neovim

```bash
nvim
```

On first launch, Neovim will:
1. Install the **Lazy.nvim** plugin manager
2. Download and install all plugins automatically
3. Install language servers via **Mason**

**Wait for everything to complete** (may take 2-5 minutes), then:
- Type `:q` to quit
- Run `nvim` again

---

## 🚀 First Launch

### What You'll See

1. **Alpha Dashboard**: A welcome screen with "NEOVIM" ASCII art
2. Press `q` to close the dashboard OR just start typing to open a file

### Opening Your First File

```bash
# Open a file
nvim myfile.txt

# Open Neovim in a directory
nvim .
```

### Basic Navigation (Read This First!)

If you're new to Vim/Neovim, here's how to move around:

#### **Modes** (Neovim has different modes):
- **Normal Mode**: Default mode for navigation and commands (press `Esc` to enter)
- **Insert Mode**: For typing text (press `i` to enter)
- **Visual Mode**: For selecting text (press `v` to enter)
- **Command Mode**: For running commands (press `:` to enter)

#### **Basic Movement** (in Normal Mode):
- `h` - Move left
- `j` - Move down
- `k` - Move up
- `l` - Move right

**OR** just use arrow keys!

#### **Basic Editing**:
- `i` - Enter Insert mode (start typing)
- `Esc` - Exit Insert mode (back to Normal mode)
- `:w` - Save file
- `:q` - Quit
- `:wq` - Save and quit

---

## ⌨️ Complete Keybindings Reference

> **Leader Key**: The leader key is set to **`Space`** (spacebar)

### 📂 File Management

| Keybinding | Action | Mode |
|------------|--------|------|
| `<C-s>` | **Save** current file | Normal |
| `<leader>sn` | Save **without** auto-formatting | Normal |
| `<C-q>` | **Quit** current file | Normal |

### 🗂️ File Explorer (Neo-tree)

| Keybinding | Action | Mode |
|------------|--------|------|
| `<leader>e` | **Toggle** file explorer (left side) | Normal |
| `\` | **Reveal** current file in explorer | Normal |
| `<leader>ngs` | Open **Git Status** window | Normal |

**Inside Neo-tree:**
| Key | Action |
|-----|--------|
| `<Enter>` or `l` | Open file/folder |
| `<Space>` | Toggle folder expand/collapse |
| `C` | Close folder |
| `z` | Close all folders |
| `a` | Add new file |
| `A` | Add new directory |
| `d` | Delete file/folder |
| `r` | Rename file/folder |
| `x` | Cut to clipboard |
| `c` | Copy |
| `p` | Paste |
| `y` | Copy to clipboard |
| `H` | Toggle hidden files |
| `q` | Close Neo-tree |
| `?` | Show help |

### 🪟 Window Management

| Keybinding | Action | Mode |
|------------|--------|------|
| `<leader>v` | Split window **vertically** | Normal |
| `<leader>h` | Split window **horizontally** | Normal |
| `<leader>se` | Make splits equal size | Normal |
| `<leader>xs` | Close current split | Normal |
| `<C-h>` | Move to **left** window | Normal |
| `<C-j>` | Move to **bottom** window | Normal |
| `<C-k>` | Move to **top** window | Normal |
| `<C-l>` | Move to **right** window | Normal |
| `<Up>` | Decrease window height | Normal |
| `<Down>` | Increase window height | Normal |
| `<Left>` | Decrease window width | Normal |
| `<Right>` | Increase window width | Normal |

### 📑 Buffer Management (Open Files)

| Keybinding | Action | Mode |
|------------|--------|------|
| `<Tab>` | Go to **next** buffer | Normal |
| `<S-Tab>` | Go to **previous** buffer | Normal |
| `<leader>x` | **Close** current buffer | Normal |
| `<leader>b` | Create **new** buffer | Normal |
| `<leader><leader>` | **Find** buffer (Telescope) | Normal |

### 🏷️ Tab Management

| Keybinding | Action | Mode |
|------------|--------|------|
| `<leader>to` | Open new **tab** | Normal |
| `<leader>tx` | Close current **tab** | Normal |
| `<leader>tn` | Go to **next** tab | Normal |
| `<leader>tp` | Go to **previous** tab | Normal |

### 🔍 Search & Find (Telescope)

| Keybinding | Action | Mode |
|------------|--------|------|
| `<leader>sf` | **Find Files** by name | Normal |
| `<leader>sg` | **Live Grep** (search text in all files) | Normal |
| `<leader>sw` | Search current **word** under cursor | Normal |
| `<leader>sd` | Search **diagnostics** (errors/warnings) | Normal |
| `<leader>sh` | Search **help** tags | Normal |
| `<leader>sk` | Search **keymaps** | Normal |
| `<leader>ss` | Search **Telescope** pickers | Normal |
| `<leader>sr` | **Resume** last search | Normal |
| `<leader>s.` | Search **recent files** | Normal |
| `<leader>/` | **Fuzzy search** in current buffer | Normal |
| `<leader>s/` | Search in **open files** | Normal |

**Inside Telescope:**
| Key | Action |
|-----|--------|
| `<C-j>` | Move to next result |
| `<C-k>` | Move to previous result |
| `<C-l>` | Open file |
| `<Esc>` | Close Telescope |

### 🧠 LSP (Code Intelligence)

| Keybinding | Action | Mode |
|------------|--------|------|
| `gd` | **Go to Definition** | Normal |
| `gr` | **Go to References** | Normal |
| `gI` | **Go to Implementation** | Normal |
| `gD` | **Go to Declaration** | Normal |
| `<leader>D` | Go to **Type Definition** | Normal |
| `K` | Show **hover documentation** | Normal |
| `<leader>ca` | **Code Actions** (quick fixes) | Normal/Visual |
| `<leader>rn` | **Rename** symbol | Normal |
| `<leader>ds` | **Document Symbols** (outline) | Normal |
| `<leader>ws` | **Workspace Symbols** | Normal |
| `<leader>th` | Toggle **Inlay Hints** | Normal |

### 🐛 Diagnostics (Errors & Warnings)

| Keybinding | Action | Mode |
|------------|--------|------|
| `[d` | Go to **previous** diagnostic | Normal |
| `]d` | Go to **next** diagnostic | Normal |
| `<leader>d` | Show diagnostic in **floating window** | Normal |
| `<leader>q` | Open diagnostics **list** | Normal |

### ✍️ Auto-completion (Insert Mode)

| Keybinding | Action | Mode |
|------------|--------|------|
| `<C-n>` | Next completion item | Insert |
| `<C-p>` | Previous completion item | Insert |
| `<Tab>` | Next item OR expand snippet | Insert |
| `<S-Tab>` | Previous item | Insert |
| `<C-y>` | **Confirm** completion | Insert |
| `<C-Space>` | Trigger completion manually | Insert |
| `<C-b>` | Scroll docs up | Insert |
| `<C-f>` | Scroll docs down | Insert |
| `<C-l>` | Jump to next snippet placeholder | Insert |
| `<C-h>` | Jump to previous snippet placeholder | Insert |

### 💬 Comments

| Keybinding | Action | Mode |
|------------|--------|------|
| `<C-/>` (or `<C-_>`) | Toggle **line comment** | Normal |
| `<C-c>` | Toggle **line comment** | Normal |
| `<C-/>` (or `<C-_>`) | Toggle **block comment** | Visual |

### ✨ Visual Mode Helpers

| Keybinding | Action | Mode |
|------------|--------|------|
| `<` | Indent **left** (stay in visual mode) | Visual |
| `>` | Indent **right** (stay in visual mode) | Visual |
| `p` | Paste (keep yanked text) | Visual |

### 🎨 UI & Appearance

| Keybinding | Action | Mode |
|------------|--------|------|
| `<leader>bg` | Toggle **background transparency** | Normal |
| `<leader>lw` | Toggle **line wrapping** | Normal |

### 🔧 Other Useful Shortcuts

| Keybinding | Action | Mode |
|------------|--------|------|
| `<C-d>` | Scroll **down** (centered) | Normal |
| `<C-u>` | Scroll **up** (centered) | Normal |
| `n` | Next search result (centered) | Normal |
| `N` | Previous search result (centered) | Normal |
| `x` | Delete character (no copy) | Normal |

---

## 🔌 Plugins Explained

This configuration uses **14 plugin modules**. Here's what each does:

### 1. **Neo-tree** (`neotree.lua`)
- **What**: File explorer sidebar
- **Why**: Browse and manage files/folders easily
- **Toggle**: `<leader>e`

### 2. **Telescope** (`telescope.lua`)
- **What**: Fuzzy finder for files, text, commands
- **Why**: Find anything instantly without clicking
- **Use**: `<leader>sf` (find files), `<leader>sg` (search text)

### 3. **LSP** (`lsp.lua`)
- **What**: Language Server Protocol - code intelligence
- **Why**: Get code completion, error checking, go-to-definition
- **Supports**: Python, JavaScript/TypeScript, Lua, HTML, CSS, JSON, YAML, Docker, Terraform, SQL
- **Keybinding**: `gd` (go to definition), `K` (docs)

### 4. **Treesitter** (`treesitter.lua`)
- **What**: Advanced syntax highlighting
- **Why**: Colors your code beautifully and accurately
- **Auto-installs** parsers for 30+ languages

### 5. **Auto-completion** (`autocompletion.lua`)
- **What**: Intelligent code suggestions as you type
- **Why**: Write code faster with auto-complete
- **Uses**: nvim-cmp + LuaSnip
- **Trigger**: Automatic, or `<C-Space>`

### 6. **None-ls** (`none-ls.lua`)
- **What**: Formatting and linting
- **Why**: Auto-format code on save, show linting errors
- **Formatters**: Prettier (JS/TS/HTML), Stylua (Lua), Ruff (Python), shfmt (Bash)
- **Auto-formats** on save!

### 7. **Bufferline** (`bufferline.lua`)
- **What**: Tab-like buffer bar at the top
- **Why**: See all open files at a glance
- **Navigate**: `<Tab>` / `<S-Tab>`

### 8. **Lualine** (`lualine.lua`)
- **What**: Status line at the bottom
- **Why**: Shows mode, file, git branch, diagnostics, location

### 9. **Alpha** (`alpha.lua`)
- **What**: Welcome dashboard
- **Why**: Nice greeting when you start Neovim
- **Shows**: ASCII art + recent files

### 10. **Git Signs** (`gitsigns.lua`)
- **What**: Git change indicators
- **Why**: See added/modified/deleted lines in the gutter

### 11. **Comment** (`comment.lua`)
- **What**: Easy commenting
- **Why**: Toggle comments with `<C-/>`

### 12. **Nord Theme** (`colortheme.lua`)
- **What**: Nordic color scheme
- **Why**: Beautiful, professional look
- **Toggle transparency**: `<leader>bg`

### 13. **Indent Blankline** (`indent-blankline.lua`)
- **What**: Indentation guides
- **Why**: See indentation levels clearly

### 14. **Misc Plugins** (`misc.lua`)
- **vim-tmux-navigator**: Navigate between tmux panes and vim windows
- **vim-sleuth**: Auto-detect indentation
- **vim-fugitive**: Git integration
- **which-key**: Show keybinding hints
- **nvim-autopairs**: Auto-close brackets/quotes
- **todo-comments**: Highlight TODO comments
- **nvim-colorizer**: Show color previews

---

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point - loads everything
├── lazy-lock.json           # Plugin version lockfile (don't edit)
├── .stylua.toml             # Lua formatter config
└── lua/
    ├── core/                # Core Neovim settings
    │   ├── options.lua      # Vim options (line numbers, tabs, etc.)
    │   ├── keymaps.lua      # Global keybindings
    │   └── snippets.lua     # Custom snippets & diagnostics config
    └── plugins/             # Plugin configurations (one file per plugin)
        ├── alpha.lua
        ├── autocompletion.lua
        ├── bufferline.lua
        ├── colortheme.lua
        ├── comment.lua
        ├── gitsigns.lua
        ├── indent-blankline.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── misc.lua
        ├── neotree.lua
        ├── none-ls.lua
        ├── telescope.lua
        └── treesitter.lua
```

### How It Works

1. **init.lua** is the entry point
2. It loads `core/options.lua`, `core/keymaps.lua`, `core/snippets.lua`
3. It sets up **Lazy.nvim** (plugin manager)
4. It loads all plugin configs from `plugins/` directory
5. Lazy.nvim installs and loads plugins on demand

---

## 🎨 How to Customize

### Adding a New Plugin

1. Create a new file: `~/.config/nvim/lua/plugins/myplugin.lua`
2. Return a table in Lazy.nvim format:

```lua
return {
  'author/plugin-name',
  config = function()
    -- Plugin setup here
  end,
}
```

3. Add it to `init.lua`:

```lua
require('lazy').setup {
  -- ... existing plugins ...
  require 'plugins.myplugin',
}
```

4. Restart Neovim - the plugin will auto-install!

### Changing Keybindings

Edit `lua/core/keymaps.lua`:

```lua
vim.keymap.set('n', '<leader>h', ':echo "Hello!"\<CR>', { noremap = true, silent = true })
```

### Changing Color Scheme

Edit `lua/plugins/colortheme.lua` - replace `'shaunsingh/nord.nvim'` with another theme.

### Changing Options

Edit `lua/core/options.lua`. For example:

```lua
vim.o.number = false          -- Disable line numbers
vim.o.relativenumber = false  -- Disable relative line numbers
vim.o.tabstop = 2             -- Use 2 spaces for tabs
```

### Installing Language Servers

Language servers auto-install via Mason. To add more:

Edit `lua/plugins/lsp.lua`, add to the `servers` table:

```lua
local servers = {
  -- ... existing servers ...
  gopls = {},  -- Go language server
  rust_analyzer = {},  -- Rust language server
}
```

### Managing Plugins

```vim
:Lazy              " Open Lazy.nvim UI
:Lazy update       " Update all plugins
:Lazy sync         " Install/update/clean plugins
:Lazy clean        " Remove unused plugins
```

### Managing LSP Servers

```vim
:Mason             " Open Mason UI
:MasonUpdate       " Update Mason
:MasonInstall <server>   " Install a server
:MasonUninstall <server> " Remove a server
```

---

## 🐛 Troubleshooting

### Icons Show as Boxes (□)

**Problem**: You don't have a Nerd Font installed or your terminal isn't using it.

**Solution**:
1. Install a Nerd Font (see [Prerequisites](#prerequisites))
2. **Set the font in your terminal emulator** (this is the step people miss!)
   - For GNOME Terminal: Edit → Preferences → Profile → Text → Custom font
   - For Alacritty: Edit `~/.config/alacritty/alacritty.yml`
   - For Kitty: Edit `~/.config/kitty/kitty.conf`

### Plugins Not Installing

**Problem**: First launch didn't install plugins.

**Solution**:
```vim
:Lazy sync
```

### Language Server Not Working

**Problem**: No code completion or diagnostics.

**Solution**:
1. Check if the server is installed: `:Mason`
2. Check if LSP is attached: `:LspInfo`
3. Manually install: `:MasonInstall <server-name>`

### Treesitter Errors

**Problem**: Errors about missing parsers or compilers.

**Solution**:
1. Install build tools:
   ```bash
   sudo apt install build-essential
   ```
2. Update Treesitter:
   ```vim
   :TSUpdate
   ```

### Telescope Not Finding Files

**Problem**: `ripgrep` is not installed.

**Solution**:
```bash
sudo apt install ripgrep
```

### Formatting Not Working

**Problem**: Code doesn't auto-format on save.

**Solution**:
1. Check if formatter is installed: `:Mason`
2. Check `none-ls` status: `:NullLsInfo`
3. Install missing formatter: `:MasonInstall prettier` (or other)

### Config Broke After Update

**Solution**:
1. Check Lazy.nvim for errors: `:Lazy`
2. View errors: `:messages`
3. Restore lock file:
   ```bash
   cd ~/.config/nvim
   git checkout lazy-lock.json
   ```

### Transparent Background Not Working

**Problem**: Terminal doesn't support transparency.

**Solution**:
- Use a terminal that supports transparency (Kitty, Alacritty, GNOME Terminal)
- Enable transparency in terminal settings
- Toggle in Neovim: `<leader>bg`

### image.nvim Build Warning (Lua 5.1 Required)

**Problem**: Error message when installing plugins:
```
`lua` version `5.1` needed, but found `Lua 5.4.8`
Will try building anyway, but will likely fail...
```

**What's happening**: The `image.nvim` plugin (used for Neo-tree image previews) requires Lua 5.1, but your system has Lua 5.4.

**Solution**: Enable `hererocks` in your lazy.nvim configuration. This is already configured in `init.lua`:

```lua
require('lazy').setup({
  -- ... plugins ...
}, {
  rocks = {
    enabled = true,
    hererocks = true, -- Automatically install Lua 5.1 for plugins that need it
  },
})
```

- **hererocks** automatically manages different Lua versions for different plugins
- No system-level changes needed
- After the first restart with this config, the warning should disappear

**Alternative solutions** if you don't want hererocks:
1. Remove `image.nvim` from `lua/plugins/neotree.lua` dependencies (line 8) if you don't need image previews
2. Install Lua 5.1 system-wide: `sudo apt install lua5.1 liblua5.1-dev` (Ubuntu/Debian)

---

## ❓ FAQ

### Q: What is Neovim?
**A**: Neovim is a modern, improved version of Vim - a highly efficient terminal-based text editor. It's fully keyboard-driven and extremely fast.

### Q: Do I need to know Vim to use this?
**A**: Basic Vim knowledge helps! Start with:
- `i` to enter Insert mode (typing)
- `Esc` to exit Insert mode
- `:w` to save
- `:q` to quit
- See [First Launch](#-first-launch) for more basics

### Q: Can I use this for [insert language]?
**A**: Probably! This config supports:
- **Fully configured**: Python, JavaScript/TypeScript, Lua, HTML/CSS, JSON, YAML, Bash
- **Easily added**: Go, Rust, Java, C++, PHP, Ruby, and 100+ more via Mason

### Q: How do I update plugins?
**A**:
```vim
:Lazy update
```

### Q: How do I uninstall this?
**A**:
```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
```

### Q: Can I use this with VS Code?
**A**: Not directly, but you can use the [VSCode Neovim extension](https://github.com/vscode-neovim/vscode-neovim).

### Q: Is this better than VS Code?
**A**: Different! Neovim is:
- ✅ Faster, lighter, runs in terminal
- ✅ More keyboard-efficient
- ❌ Steeper learning curve
- ❌ Fewer GUI features

### Q: How much RAM does this use?
**A**: ~50-100 MB (vs VS Code's 500+ MB)

### Q: Where can I learn more about Vim?
**A**: 
- Run `vimtutor` in terminal (30-minute tutorial)
- [Vim Adventures](https://vim-adventures.com/) (game)
- [ThePrimeagen's Vim Course](https://www.youtube.com/watch?v=H3o4l4GVLW0)

### Q: Something broke, help!
**A**: 
1. Check `:checkhealth`
2. Read error messages: `:messages`
3. See [Troubleshooting](#-troubleshooting)
4. Open an issue on GitHub

### Q: Can I contribute?
**A**: Yes! Open a PR or issue on the [GitHub repo](https://github.com/rahuljangirwork/neovim-kickstart-config).

---

## 🎉 You're Ready!

You now have a complete understanding of this Neovim configuration. Start with:

1. ✅ Open Neovim: `nvim`
2. ✅ Toggle file explorer: `<leader>e` (Space + e)
3. ✅ Find files: `<leader>sf` (Space + s + f)
4. ✅ Start coding!

**Pro Tip**: Print the [Keybindings Reference](#-complete-keybindings-reference) and keep it handy while learning.

Happy coding! 🚀

---

**Author**: Rahul  
**Repository**: [github.com/rahuljangirwork/neovim-kickstart-config](https://github.com/rahuljangirwork/neovim-kickstart-config)  
**License**: MIT
