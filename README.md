# scribe.nvim

<!-- panvimdoc-ignore-start -->

![code size](https://img.shields.io/github/languages/code-size/Ostralyan/scribe.nvim?style=flat-square)
![license](https://img.shields.io/github/license/Ostralyan/scribe.nvim?style=flat-square)
<!-- ![GitHub all releases](https://img.shields.io/github/downloads/ostralyan/scribe.nvim/total?style=flat-square) -->

![scribe short](https://user-images.githubusercontent.com/7123333/195979769-5ff8cfb4-c7dd-4897-89fa-9c6705659f0f.gif)

<!-- panvimdoc-ignore-end -->

A convenient way to find and take notes written in Lua.

<!-- Insert Demo -->

<!-- `scribe.nvim` requires Neovim >= 0.5. -->

## Contents


- [Getting Started](#getting-started)
- [Usage](#usage)
- [Setup](#setup)
- [Contributing](#contributing)
- [Wish List](#wish-list)

## Getting Started

### Required Dependencies

* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) is required to find notes.

### Installation

#### [vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'Ostralyan/scribe.nvim'
" Telescope is a required dependency for :ScribeFind to work
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
```

#### [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
return require('packer').startup(function(use)
  use 'nvim-telescope/telescope.nvim', tag = '0.1.0',
  use 'Ostralyan/scribe.nvim'
end)
```

#### [dein.vim](https://github.com/Shougo/dein.vim)
```viml
call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.0' })
call dein#add('Ostralyan/scribe.nvim')
```

## Usage

```viml
" Creates a new default file (scribe.md) or opens the file up if it exists.
" The default file can be configured under setup.
nnoremap <leader>ss :ScribeOpen<cr>

" Creates a new file or opens the file up if it exists.
" Requires a filename.
nnoremap <leader>so :ScribeOpen<space>

" Opens telescope up to <directory>
" The directory can be configured in setup.
nnoremap <leader>sf :ScribeFind<cr>
```

## Setup
### Default setup
```lua
-- Default values
-- { 
--   directory = '~/notes',
--   file_ext = 'md',
--   default_file = 'scribe'
-- }
require('scribe').setup{}
```

### Custom setup with project root as default directory
```lua
require('scribe').setup{ 
  directory = './notes',
  file_ext = '.txt',
  default_file = 'scribe'
}
```

## Contributing

All contributions are welcome! Just open a pull request. Feel free to take stab at wish list.

## Wish List
* Support markdown preview
* Add setup configuration to allow for customizable preview.
* More Usage examples for packer, dein, and more
* Setup examples in Lua
* Add multiple search directories
