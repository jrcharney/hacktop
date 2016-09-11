#!/bin/bash
# File: hound.sh
# Info: Find a string in a file in a directory in Linux! (INCEPTION!) :-P

echo "Sorry, this doesn't work."
exit 0

usage(){
	cat << EOF
Usage: \$ hound \$string [\$dir]  # returns a list of files [in \$dir] that may contain \$string

Sure you can use grep, hound is a little more mnemonic.

A special shoutout to Black More Ops for this article to help make things clear.
	http://www.blackmoreops.com/2014/08/20/find-files-containing-specific-text/

This usage function just recites some of the usual grep options.

\$ grep [options] "text string to search" directory-path	# Hound uses this format
\$ grep [options] PATTERN [FILE...]
\$ grep [options] [ -e PATTERN | -f FILE ] [FILE...]

options
-c	--count
		Count the number of lines that match our pattern.
		It does not count the instance, 
		just the lines where there are instances.
-E	--extended-regexp or egrep 
		Use Extended Regular Expression (ERE) for the PATTERN
-F	--fixed-strings or fgrep 
		Interpret PATTERN as list of fixed strings 
		(rather than regular expressions) separated by new lines, 
		any of which is to be matched.
-G	--basic-regexp or grep
		Use Basic Regular Expression (BRE) for the PATTERN.
		This is default.
-P	--perl-regexp or pgrep
		Use Perl Compatible Regular Expression (PCRE) for the PATTERN.
		Still experimental.
-e PATTERN	--regexp=PATTERN 
		Use PATTERN as the pattern.
		This can be used to specify multiple search patterns 
		or protect a pattern beginning with a hyphen (-).
-f FILE	--file=FILE
		Obtain patterns from FILE, one per line.
		The empty file contains zerip patterns, and so matches nothing.
-H	--with-filename
		Print the file name for each match.
		This is the default when there is more than one file to search
-i	--ignore-case
		Ignore case
-n	--line-number
		Prefix each line of output with the 1-based line number
		within its input file.
-r	--recursive or -d recurse
		Read all files under each directory, recursively,
		following symbolic links only if they are on the command line.
-R	--dereference-recurvise
		Read all files under each directory, recursively.
		Follow all symbolic links, unlike -r
-v	--invert-match 
		Invert the sense of the match, to select non-matching lines. 
		Basically, match the OPPOSITE of PATTERN.
-w	--word-regexp
		Select only those lines containing manches from whole words.
		The test is that the matching substring must either be 
		at the beginning of the line, or preceded by a non-word 
		constituent character. Similarly, it must either be at
		the end of the line or followed by a non-word constituent character.
		Word-constituent characters are letters, digits, and the underscore.
-x	--line-regexp
		Select only those matches that exactly match the whole line.
		This option has the same effect as anchoring the 
		regular expression with ^ and \$.
--color=WHEN	
		Highlight results with color. WHEN is 'never', 'always', or 'auto'.

If you want to use options, consider using grep instead of hound.
For more options, man grep.
EOF
	exit 0
}

[ $# -eq 0 ] && usage

# TODO: Fix the bug that makes hound search other directories after it has exhausted searches in the current directory and its children.

case $# in
	1)
		grep --color=always -i -r -H "$1" $(pwd)	# search the current working directory
		;;
	2)	
		if [ -d $2 ]; then		# If argument 2 is a directory
			grep --color=always -i -r -H "$1" $2	# search the directory
		elif [ -f $2 ]; then		# If argument 2 is a regular file
			grep --color=always -i "$1" $2		# search the file
		else
			printf "ERROR: '%s' is not a directory or file.\n" $2
		fi
		;;
	*)
		printf "ERROR: Too many arguments! Quote your string and try again.\n"
		printf "If you are looking for guidance, run hound without arguments.\n"
		exit 1
		;;
esac
