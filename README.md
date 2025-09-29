<h1 align="center">Super Light<br>Nvim Configuration

![nvim-showcase](https://github.com/user-attachments/assets/e08f04dc-f262-4f1b-9cd5-32c4b215d8c2)
</h1>
A modular and fast Neovim setup using **Lua** and **lazy.nvim** for plugin management.  
This setup includes LSP configurations, key mappings, plugin configurations, and more.

---

## Dependencies

- node >= 20.x
- ripgrep
- Nerd Font

## Installation

### 1. Backup your existing nvim config 
```sh 
mv ~/.config/nvim ~/.config/nvim.backup
```

### 2. Clone super light nvim config  
```sh
git clone https://github.com/manu-xo5/nvim ~/.config/nvim
```

---

## Folder Structure

```
├── init.lua
├── lazy-lock.json
└── lua
   ├── custom
   │   ├── keymap.lua
   │   ├── lsp-server-config.lua
   │   └── option.lua
   └── plugin
       ├── auto-pair.lua
       ├── blink.lua
       ├── colorscheme.lua
       ├── conform.lua
       ├── lsp.lua
       ├── neogit.lua
       ├── snacks.lua
       └── treesitter.lua
```
