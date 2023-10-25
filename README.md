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

Some of these will be put into set up scripts at a later date. Others (rarer occurances) will be kept here for referencing but skipped in scripts

### Windows

#### Vim Not Picking Up .vimrc

1. Go to Control Panel -> Environment Variables
1. Add entry for either user or system variable
  - Variable Name : HOME
  - Variable Value: %userprofile%

#### Fix Status Line Display Issues 

**Windows** 
```cmd
@echo Install
git clone https://github.com/powerline/fonts "%userprofile%\repos\powerline_fonts"
cd "%userprofile%\repos\powerline_fonts"
powershell -executionpolicy bypass -file ./install.ps1
@echo Cleanup
cd "%userprofile%\repos\powerline_fonts"
rmdir /s /q "%userprofile%\repos\powerline_fonts"
```

```bash
git clone https://github.com/powerline/fonts "~/repos/powerline_fonts"
cd 
./install.sh
cd ..
rm -rf "~/repos/powerline_fonts"
```



