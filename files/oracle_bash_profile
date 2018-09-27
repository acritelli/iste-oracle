# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# Oracle required umask
umask 022

# Set x forwarding display
DISPLAY=localhost:10.0

# Set oracle specific variables
ORACLE_HOME=/u01/app/oracle/product/12.2.0/db_1
ORACLE_BASE=/u01/app/oracle


PATH=$PATH:$ORACLE_HOME/bin
PATH=$PATH:$HOME/.local/bin:$HOME/bin

EDITOR=vim
export localIP=`/sbin/ifconfig | awk 'BEGIN { FS = "[ :]+" } /inet addr:10./ { print $4 }'`
PS1="`whoami`@\$localIP:[\$PWD]`echo -e '\n$ '`"

export PATH DISPLAY ORACLE_HOME ORACLE_BASE EDITOR
