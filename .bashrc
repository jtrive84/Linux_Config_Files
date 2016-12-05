# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-3

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
alias cls='printf "\e[H\e[2J"'
#
# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
#alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
#alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

alias find="/cygdrive/c/cygwin64/bin/find.exe"
alias sort="/cygdrive/c/cygwin64/bin/sort.exe"

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func

######THIS WORKS NO WRAP########
#NOTE: This is a single color unit: \[\e[0;92m\]

#Original Prompt specification:
#PS1='\[\e[32m\]\u@\h:\W> \[\e[0m\]'

#dark on dark/dark white/light white:
PS1='\[\e[0;97m\][\[\e[0;37m\]\h\[\e[0;97m\]] \[\e[0;97m\]<\[\e[0;37m\]\W\[\e[0;97m\]> \[\e[0;93m\]$ \[\e[0;96m\]'



# Regular Colors
#\[\033[0;30m\] # Black
#\[\033[0;31m\] # Red
#\[\033[0;32m\] # Green
#\[\033[0;33m\] # Yellow
#\[\033[0;34m\] # Blue
#\[\033[0;35m\] # Purple
#\[\033[0;36m\] # Cyan
#\[\033[0;37m\] # White

# High Intensty
#\[\033[0;90m\] # Black
#\[\033[0;91m\] # Red
#\[\033[0;92m\] # Green
#\[\033[0;93m\] # Yellow
#\[\033[0;94m\] # Blue
#\[\033[0;95m\] # Purple
#\[\033[0;96m\] # Cyan
#\[\033[0;97m\] # White


#\a         # an ASCII bell character (07)
#\d         # the date in "Weekday Month Date" format (e.g., "Tue May 26")
#\D{format} # the format is passed to strftime(3) and the result
            # is inserted into the prompt string an empty format
            # results in a locale-specific time representation.
            # The braces are required
#\e         # an ASCII escape character (033)
#\h         # the hostname up to the first '.'
#\H         # the hostname
#\j         # the number of jobs currently managed by the shell
#\l         # the basename of the shell's terminal device name
#\n         # newline
#\r         # carriage return
#\s         # the name of the shell, the basename of $0 (the portion following
            # the final slash)
#\t         # the current time in 24-hour HH:MM:SS format
#\T         # the current time in 12-hour HH:MM:SS format
#\@         # the current time in 12-hour am/pm format
#\A         # the current time in 24-hour HH:MM format
#\u         # the username of the current user
#\v         # the version of bash (e.g., 2.00)
#\V         # the release of bash, version + patch level (e.g., 2.00.0)
#\w         # the current working directory, with $HOME abbreviated with a tilde
#\W         # the basename of the current working directory, with $HOME
            # abbreviated with a tilde
#\!         # the history number of this command
#\#         # the command number of this command
#\$         # if the effective UID is 0, a #, otherwise a $
#\nnn       # the character corresponding to the octal number nnn
#\\         # a backslash
#\[         # begin a sequence of non-printing characters, which could be used
            # to embed a terminal control sequence into the prompt
#\]         # end a sequence of non-printing characters


#Replace any leading leading 0; with 1; for bold colors
#Replace any leading 0; with 4; to underline
eval "$(dircolors -b /home/James/dircolors.db)"

#/cygdrive/c/cygwin64/lib/libpython2.7.dll
#/cygdrive/c/cygwin64/lib/libpython3.4.dll

#Python Standard Libraries:
#/cygdrive/c/cygwin64/lib/python2.7
#/cygdrive/c/cygwin64/lib/python3.4

#export C_INCLUDE_PATH="C:/cygwin64/usr/include/python2.7":"C:/cygwin64/usr/include"
#export CPLUS_INCLUDE_PATH="/cygdrive/c/cygwin64/usr/include/python2.7"
#export PYTHONPATH=/cygdrive/c/cygwin64/bin:/cygdrive/c/cygwin64/lib/python3.4:/cygdrive/c/cygwin64/lib/python3.4/site-packages


#clear bash history:
#cat /dev/null > /home/James/.bash_history && history -c

#set path to put cygdrive before Anaconda distribution:
PATH=/cygdrive/c/cygwin64/bin:$PATH

alias python=/cygdrive/c/cygwin64/bin/python3.4.exe
alias python2=/cygdrive/c/cygwin64/bin/python2.7.exe
alias python3=/cygdrive/c/cygwin64/bin/python3.4.exe





cd /cygdrive/e
