# vim-mutant
Vim plugin to run mutation testing using the Mutant gem

## Installation
Recommended installation via Pathogen:

```
cd ~/.vim/bundle && git clone git@github.com:DNACodeStudios/vim-mutant.git
```

## Configuration
### Key Mappings

Add your preferred key mappings to your `.vimrc` file.
```vimrc
" mutant.vim mappings
map <Leader>mt :call RunMutationTest()<CR>
map <Leader>nt :call RunNearestMutationTest()<CR>
```
