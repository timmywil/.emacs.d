Installation
----------------------------
Add a symbolic link to the .emacs in this repo to your home directory (after removing any existing .emacs file):

```bash
ln -s ~/.emacs.d/.emacs ~/.emacs
```

Also, install all submodules:

```bash
git submodule update --init --recursive
```


Useful commands
-----------------------------

#### `C-u 0 M-x byte-recompile-directory`

Compile all emacs lisp files in a directory. `C-u 0` suppresses prompts for each `*.el` file.
