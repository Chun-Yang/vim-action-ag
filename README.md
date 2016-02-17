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

## Configuration

### Recommanded Shortcuts
```vimscript
" use * to search current word in normal mode
nmap * <Plug>AgActionWord
" use * to search selected text in visual mode
vmap * <Plug>AgActionVisual
```

### Escape characters
There are some special characters used in Ag, like '$' which is treated as the
end of the line. Most of the time we use literal meaning of these characters.
You can set escapes for these characters in `g:vim_action_ag_escape_chars`.
By Default, this global variable is set like this:
```
let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'
```
