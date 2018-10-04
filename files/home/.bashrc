# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Check if ~/.email is there.  If so, source it.  If not, run configInstance
# and THEN source it so we have the variables in it ($DCE and $EMAIL)
if [ -f ~/.email ]; then
        . ~/.email
else
	echo "Detected first-time login.  Running configInstance..."
	/home/oracle/bin/configInstance
	. ~/.email
fi

alias sqlplus="rlwrap -rc sqlplus"
export TERM=linux