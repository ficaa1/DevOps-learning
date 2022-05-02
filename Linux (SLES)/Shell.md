# Shell commands
Global config files are situated in /etc/

User profiles : 
- ~/.profile
- ~/.bashrc
- ~/.alias

---------------------
**Table of contents**
  - [Aliases](#aliases)
  - [History](#history)
  - [Variables](#variables)
  - [Wildcards (a bit of pattern matching)](#wildcards-a-bit-of-pattern-matching)
    - [Examples](#examples)
  - [Escape characters](#escape-characters)
  - [Variables](#variables-1)
  - [Special Variables](#special-variables)
  - [Channel Redirection](#channel-redirection)
  - [Chaining Commands](#chaining-commands)
  - [Useful commands](#useful-commands)

## Aliases
>alias ALIAS_NAME="Command"
--> put in ~/.profile to make permanent

>unalias ALIAS_NAME
## History
- Shell history: ~/.bash_history
- Search history for a command: command PG_UP/PG_DN

## Variables
- echo -> display de value of a var
- set -> display all shell vars and functions
- env -> display only env vars

## Wildcards (a bit of pattern matching)
- \* -> any number or zero values
- ? -> Any one value
- {...} -> List of values ({a,b,c})
- [...] -> Range of values ([1-9])
- [!abc] -> None of these

### Examples
>ls file* -> file, file1, file123

>ls server? -> server1,server2,server3

>ls file{1,2,3} -> file1, file123

>ls file[1-3] -> same as above

>ls file[!123] -> file

## Escape characters
- \ -> Next char as ASCII equiv.
- "..." -> Interpret all chars except: $, \ , `
- '...' -> Interpret all chars

## Variables
- $ or ${...} -> Reference a value stored in a variable, example: $PATH
- \`...` or $(...) -> Execute a command and return output as input for another command, example: cat $(ls /data1/*)

## Special Variables
- $? -> Return value of the prev. executed command
- $0 -> Name of the cmd being executed
- $# -> Number of command arguments
- $* -> All command arguments
- \$1,\$2,...,\$N -> Value of the selected argument
- $\$ -> PID of the current shell

## Channel Redirection
- \> -> Redirect stdout into a **file**
- \>> -> Redirect stdout, **appending** to a file
- 2>, 2>> -> Redirect stderr
- < -> Redirect stdin from a file, example: mail geeko < email_body.txt
- | -> Use stdout from one cmd as stdin of another, example: ls /etc | grep samba
- tee -> Redirect stdout to a file AND the terminal, example: ls /etc | tee etc_directory.txt

## Chaining Commands
- ; -> Chain commands
- && -> Chain only if 1st commmand returns no errors
- || -> Chain only if 1st command returns an error

## Useful commands
- tail -> show last lines
  - -n -> nb of lines
  - -f -> Follow, keeps displaying tail with changes happening
- find -> Search for files
- type -> type filename
- grep -> See regexp
