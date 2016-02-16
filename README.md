## Dependency
https://github.com/rking/ag.vim

## Instruction
This plugin map `gag` to do Ag search.

## Examples
- Normal Mode
  - `gagiw` to search the word
  - `gagi'` to search the words inside single quotes.
- Visual Mode
  - `gag` to search the selected text

## Recommanded Shortcuts
```vimscript
" use * to search current word in normal mode
nmap * <Plug>AgActionWord
" use * to search selected text in visual mode
vmap * <Plug>AgActionVisual
```
