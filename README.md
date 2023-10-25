Dot Files
=========

Setups
------

### Linux

```bash
git clone git@github.com:b0dee/.dotfiles ~/repos/.dotfiles
cd ~/repos/.dotfiles
./setup.sh
```

### Windows 

```cmd
git clone git@github.com:b0dee/.dotfiles %userprofile%/repos/.dotfiles
cd ~/repos/.dotfiles
setup.cmd
```


Notes
-----

### Windows

#### Vim Not Picking Up .vimrc

1. Go to Control Panel -> Environment Variables
1. Add entry for either user or system variable
  - Variable Name : HOME
  - Variable Value: %userprofile%






