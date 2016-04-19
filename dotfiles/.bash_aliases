# Bash Alias
# Note: If you change anything to this file, you'll need to log out and log back into bash.
#       Put this file in your home directory.
# Your ~/.bashrc file should have a few lines allowing for the addition of a ~/.bash_aliases.
# I've written this file with a few things that seem useful
# WARNING: DON'T USE THIS FILE! If you see it on my Git Repo, don't use it!


alias lesser='less -eFMXR'	# Use less better. `cat $file | lesser`
alias disksz='df -hT'		# See the size of the mounted file systems
alias lsdir='ls -ladF $@'	# List all the directories in a directory.  (This one needs work.) `lsdir $pattern`
alias dirsz='du -sh $@'		# List the files size of the of a directory. (This one needs work.) 'dirsz $pattern`
alias upandup='sudo apt-get update && sudo apt-get upgrade'	# Update and Upgrade (Todo: Add a -y argument for automatic override)
alias bye='sudo shutdown -h now'                                # Shut down the system  (Todo: Ask firs or override with a -y argument)
alias top='htop'						# Use htop instead of top

# See if we can pipe these
alias ctls='ls -la $@ | wc -l'  # Count the number of foles in a directory
alias ctdir='dirsz $@ | wc -l'	# Count the directories only
alias ctcat='cat $@ | wc -l'	# Count the number of lines in a file.

# Ask before executing these commands
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# Multimedia
alias sxiv='sxiv -a'		# Animate GIFs

# NOT ALIASES (I just think this would be an ideal place to make notes for now.
# ldconfig -p | grep 'ldevent'	# you should run this if the thing you just installed had some stuff that began with lib or ended with .so, .la, or .lo
# sudo ldconfig
