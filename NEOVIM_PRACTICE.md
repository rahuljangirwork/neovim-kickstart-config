# 🚀 Neovim Kickstart Practice Guide

Welcome to your Neovim journey! This guide will help you master the essential skills.

## 📋 Table of Contents
1. [Opening & Creating Files](#opening--creating-files)
2. [Basic Navigation](#basic-navigation)
3. [Editing Modes](#editing-modes)
4. [Essential Keybindings](#essential-keybindings)
5. [File Explorer (Neo-tree)](#file-explorer-neo-tree)
6. [Fuzzy Finding (Telescope)](#fuzzy-finding-telescope)
7. [Code Editing](#code-editing)
8. [Saving & Quitting](#saving--quitting)

---

## 🎯 Quick Start Practice

### Opening & Creating Files

```bash
# Open Neovim
nvim

# Open a specific file
nvim myfile.txt

# Open file at specific line
nvim +25 myfile.txt

# Open multiple files
nvim file1.txt file2.txt
```

**Try this now:**
```bash
cd ~/github/neovim-kickstart-config
nvim practice.lua
```

---

## 🧭 Basic Navigation

Neovim uses **hjkl** for movement (forget arrow keys!):

| Key | Action |
|-----|--------|
| `h` | Move left ← |
| `j` | Move down ↓ |
| `k` | Move up ↑ |
| `l` | Move right → |
| `w` | Jump to next word |
| `b` | Jump back one word |
| `0` | Jump to start of line |
| `$` | Jump to end of line |
| `gg` | Go to first line |
| `G` | Go to last line |
| `{number}G` | Go to line {number} |
| `Ctrl+u` | Scroll up half page |
| `Ctrl+d` | Scroll down half page |

**Practice Task:** Navigate through this document using only `hjkl` and word jumps!

---

## 🎨 Editing Modes

Neovim has different modes:

### Normal Mode (Default)
- This is where you navigate
- Press `Esc` to return here from any mode

### Insert Mode (For Typing)
| Key | Action |
|-----|--------|
| `i` | Insert before cursor |
| `a` | Insert after cursor |
| `I` | Insert at start of line |
| `A` | Insert at end of line |
| `o` | Open new line below |
| `O` | Open new line above |

### Visual Mode (For Selecting)
| Key | Action |
|-----|--------|
| `v` | Character-wise visual |
| `V` | Line-wise visual |
| `Ctrl+v` | Block-wise visual |

### Command Mode
- Press `:` to enter
- Used for saving, quitting, etc.

---

## ⚡ Essential Keybindings

### File Operations
| Keys | Action |
|------|--------|
| `<Space>w` | Save file |
| `:w` | Save file |
| `:q` | Quit |
| `:wq` or `ZZ` | Save and quit |
| `:q!` | Quit without saving |

### Copy, Cut, Paste
| Keys | Action |
|------|--------|
| `yy` | Yank (copy) line |
| `dd` | Delete (cut) line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `y{motion}` | Yank text (e.g., `yaw` = yank a word) |
| `d{motion}` | Delete text (e.g., `daw` = delete a word) |

### Undo/Redo
| Keys | Action |
|------|--------|
| `u` | Undo |
| `Ctrl+r` | Redo |

### Search
| Keys | Action |
|------|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor |

---

## 📁 File Explorer (Neo-tree)

Your config has **Neo-tree** installed!

| Keys | Action |
|------|--------|
| `<Space>e` | Toggle file explorer |
| `j/k` | Navigate up/down |
| `Enter` | Open file/folder |
| `a` | Add new file |
| `d` | Delete file |
| `r` | Rename file |
| `y` | Copy file |
| `x` | Cut file |
| `p` | Paste file |
| `?` | Show help |

**Practice:** Open Neo-tree and create a new file!

---

## 🔍 Fuzzy Finding (Telescope)

**Telescope** is your super-powered file finder!

| Keys | Action |
|------|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep (search in files) |
| `<Space>fb` | Browse buffers |
| `<Space>fh` | Help tags |
| `Ctrl+n/p` | Navigate results |
| `Enter` | Open selected |
| `Esc` | Close Telescope |

**Practice:** Press `<Space>ff` and find this file!

---

## ✏️ Code Editing

### LSP (Language Server Protocol)
Your setup has LSP configured!

| Keys | Action |
|------|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Show hover documentation |
| `<Space>rn` | Rename symbol |
| `<Space>ca` | Code actions |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

### Autocompletion
While typing in insert mode:
- `Ctrl+n` / `Ctrl+p` - Navigate suggestions
- `Enter` - Accept suggestion
- `Ctrl+e` - Close suggestions

### Comments
| Keys | Action |
|------|--------|
| `gcc` | Comment/uncomment line |
| `gc{motion}` | Comment motion (e.g., `gcap` = comment paragraph) |
| (Visual) `gc` | Comment selection |

---

## 💾 Saving & Quitting

### Common Commands
```vim
:w          " Save
:q          " Quit
:wq         " Save and quit
:q!         " Quit without saving
:qa         " Quit all windows
:wqa        " Save all and quit
```

### Quick Keys
- `<Space>w` - Save current file
- `ZZ` - Save and quit
- `ZQ` - Quit without saving

---

## 🏋️ Practice Exercises

### Exercise 1: Create a Simple File
1. Open Neovim: `nvim hello.lua`
2. Press `i` to enter insert mode
3. Type: `print("Hello, Neovim!")`
4. Press `Esc` to return to normal mode
5. Type `:wq` to save and quit

### Exercise 2: Navigate & Edit
1. Open this file: `nvim NEOVIM_PRACTICE.md`
2. Navigate to line 50: `50G`
3. Move word by word: `w` and `b`
4. Jump to end of line: `$`
5. Jump to start: `0`

### Exercise 3: Copy & Paste
1. Navigate to any line
2. Press `yy` to copy the line
3. Press `p` to paste below
4. Press `u` to undo

### Exercise 4: Use File Explorer
1. Press `<Space>e` to open Neo-tree
2. Press `a` to create a new file
3. Name it `test.txt`
4. Press `Enter` to open it
5. Add some text
6. Save with `:w`

### Exercise 5: Search Files
1. Press `<Space>ff` to open file finder
2. Type the name of any file
3. Press `Enter` to open it

---

## 🎓 Advanced Tips

### Window Management
| Keys | Action |
|------|--------|
| `<Space>sv` | Split vertically |
| `<Space>sh` | Split horizontally |
| `Ctrl+w h/j/k/l` | Navigate between splits |
| `Ctrl+w q` | Close current split |

### Buffer Management
| Keys | Action |
|------|--------|
| `:bn` | Next buffer |
| `:bp` | Previous buffer |
| `:bd` | Delete buffer |
| `<Space>fb` | Telescope buffer list |

### Terminal
| Keys | Action |
|------|--------|
| `:terminal` | Open terminal |
| `Ctrl+\` `Ctrl+n` | Exit terminal mode |

---

## 🎯 Daily Workflow Example

```bash
# 1. Open Neovim
nvim

# 2. Find your file
<Space>ff

# 3. Start coding (LSP helps you!)
# - Autocomplete appears automatically
# - Use gd to jump to definitions
# - Use K to see documentation

# 4. Save your work
<Space>w

# 5. Search in files
<Space>fg

# 6. Commit your changes
# Use Neo-tree to see git status
<Space>e
```

---

## 📚 Resources

- `:help` - Built-in help
- `:Tutor` - Interactive Neovim tutorial
- `:checkhealth` - Check your setup
- [README.md](file:///home/rahul/github/neovim-kickstart-config/README.md) - Your config documentation

---

## 🚀 Next Steps

1. ✅ Complete all 5 exercises above
2. ✅ Practice navigation for 10 minutes using only `hjkl`
3. ✅ Create a new project file and use LSP features
4. ✅ Customize your keybindings in `lua/core/keymaps.lua`
5. ✅ Explore plugins in the `lua/plugins/` directory

**Remember:** Learning Neovim takes time. Practice daily for 10-15 minutes and you'll become proficient in 2 weeks!

---

**Happy Vimming! 🎉**
