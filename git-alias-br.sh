alias br='FORCE="";_git_br'
alias brf='FORCE=-f; _git_br'

function __is_a_number_or_string(){
re='^[0-9]+$'
regexp='number'
if [ -z $1 ]; then
   echo 'None'
fi
if [ ! -z $1 ] && [[ ! $1 =~ $re ]] ; then
   echo 'string'
else
   echo 'number'
fi

}

function _git_br(){
regexp="$(__is_a_number_or_string $1)"
if [[ $regexp == "string" ]] ; then
   search_str=$1
else
   search_str="------>"
fi
echo -e "\e[97m"

git br > /tmp/git-listofbranches.txt
input="/tmp/git-listofbranches.txt"
counter=0
sed -i -e 's/*/------> /g' /tmp/git-listofbranches.txt
while IFS= read -r line
do
  if [[ $line == *"$search_str"* ]]; then
    echo -e "\e[31m$counter ) $line"
  elif [[ ! $regexp == "string" ]]; then
    echo -e "\e[97m$counter ) $line"
  fi
  if [[ $regexp == 'number' ]] && [[ ! $line == *"------>"* ]] && [[ $1 -eq $counter ]]; then
     for (( i=-18; i<${#line}; i++))
     do
        printf "*"
     done
     echo ""
     (git co $FORCE $line)
     break 
  fi
counter=$((counter=counter+1))
done < "$input"
tput sgr0
}
