#!/bin/bash
vimConfigFile='.vimrc'
vimBasicConfig='set number
syntax on
set showmode
set mouse=a
set encoding=utf-8
set t_Co=256
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set cursorline
set scrolloff=5
set laststatus=2
set ruler
set showmatch
set hlsearch
set ignorecase
set listchars=tab:»■,trail:■
set list
set wildmenu
set wildmode=longest:list,full'

# create config file
if [ ! -f "$vimConfigFile" ]
then
    sudo touch -r $vimConfigFile
    echo "File [$vimConfigFile] creation complete!!!"
    echo "$vimBasicConfig" > $vimConfigFile
else
    echo "File [$vimConfigFile] already exists!!!"
    echo "Do you want to override the file? yes or no"
    read yesOrNoFile
    if [[ $yesOrNoFile == y* || $yesOrNoFile == Y* ]]
    then
        echo "$vimBasicConfig" > $vimConfigFile
    else
        echo "Do you want to add data to the configuration file? yes or no"
        read yesOrNoFile
        if [[ $yesOrNoFile == y* || $yesOrNoFile == Y* ]]
        then
            echo "$vimBasicConfig" >> $vimConfigFile
        else
            exit 3
        fi
    fi
fi

echo "Config success"