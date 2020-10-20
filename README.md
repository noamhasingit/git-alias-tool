# git-alias-tool
How-To

Edit your local aliases bash file:

> vim ~/.bash_aliases

Copy the content of th efile into this file

Apply change: > . vim ~/.bash_aliases
### git-alias-br.sh ####
The alias show and change git branches, similer to "git co" and "git co -f"

Command: br

Output: Shows all local brnches

Command: br <string> 
  
  Example: br multi
  
  Output: Show branches names containing a substring

Command: br <number>
  
  Example: br 2
  
  Output: Checkout branch according to branch numerations.

Command: brf 

Output: same as br but with -f option to the git checkout command

