# RegEx notes and cheatsheet

* use a single `|` to say 'or'
* `[ ]` - says any of the characters inside the brackets
* `?` make the preceding token optional
* `.+` - matches all characters to the end of the line
* use parentheses to group characters as using the `|` alone divide the regex into only a left and right side.
* `^` matches only if it's at the beginning of a string
* `$` matches only if it's the end of a string
* `+` is greedy - it won't just get the next token. it will keep searching until it reaches the last one.
* `+?` is not greedy - it will just search to the next occurrence of a token.
* `{3}` - would match 3 occurrences of the preceding token
* `{3,4}` - could match the range of 3 to 4 characters of the preceding token

## Flags
* `\w` - matches any word character
* `\r` = carriage return
* `\n` = new lines
* `\s` = space characters
* `\w` = word character
* `\d` = digits 0-9

## Lookahead and Lookbehind
* `(?<!`  = negative look behind
* `(?<=`  = positive look behind
* `(?=`  = positive look ahead 
* `(?!`  = negative look ahead
