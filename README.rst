============
Bash scripts
============

All kinds of scripts that I thought were useful as some point

Installation
------------
These are all meant to be installed with stow: https://www.gnu.org/software/stow

Preparation::

  $ sudo apt-get stow        
  $ mkdir /usr/local/stow    (optional: change permissions to allow non-root writing)
  $ cd /usr/local/stow
  $ git clone git@github.com:sjoerdk/bash_scripts.git
  

See available scripts::
  
  $ ls /usr/local/stow/bash_scripts

  
To install a script::
  
  $ cd /usr/local/stow/bash_scripts
  $ sudo stow <script name> --target=/usr/local
  
  The script name is just the directory name stow/bash_scripts. For example:    
  $ sudo stow sync_walkman --target=/usr/local

  
To uninstall a script::
  
  $ cd /usr/local/stow/bash_scripts
  $ sudo stow --delete <script name> --target=/usr/local

  
