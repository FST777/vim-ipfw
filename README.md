# vim-ipfw

Syntax-highlighting for IPFW-based rule-files. This was specifically made to highlight rule-files that need to be parsed by a preprocessor, so it might not be foolproof. Pull-requests are welcome.

## Installation

Just copy the files in your ~/.vim/ directory.


## Usage

For actual syntax highlighting, `:setfiletype ipfw` inside vim or add `# vim: set syntax=ipfw` at the end of your file.

A tabulated rule-set without rulenumbers works best. On FreeBSD, it can be nicely used via:
```sh
firewall_enable="YES"
firewall_type="/path/to/ruleset"
firewall_flags="-fp /path/to/awk-script"
```
with:
```awk
#!/usr/bin/awk -f
BEGIN {
    x=2000                  # Start rule-numbering at 2000
}
!/^(#|[[:space:]]*$)/ {     # Only format and print non-comment, non-empty lines
    gsub(/#.*$/, "")        # Strip trailing comments
    print "add "x" "$0      # Add the rule with the current number
    x = x + 10              # Increment the rule-number
}
```
