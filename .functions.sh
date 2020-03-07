# functions
curly () {
  curl $@ | js-beautify -n -f -
}

caniuse () {
  local domain="http://caniuse.com/"
  local query

  if [ $# -eq 0 ]; then
    open ${domain}
  else
    for term in "$@"; do
      query=$(python -c "import sys, urllib.parse as ul; print(ul.quote('${term}'));")
      open "${domain}#search=${query}"
    done
  fi
}

oman () {
  local domain="https://linux.die.net/man/1/"
  local query

  if [ $# -eq 0 ]; then
    open ${domain}
  else
    for term in "$@"; do
      query=$(python -c "import sys, urllib.parse as ul; print(ul.quote('${term}'));")
      open "${domain}${query}"
    done
  fi
}


get-remote() {
  local user = $1
  local server = $2
  local path = $3
  local destination = $4
  local reverse = $5

  if [ "$reverse" == true ]; then
    scp "${path} ${user}@${server}:${destination}"
  else
    scp "${user}@${server}:${path} ${destination}"
  fi
}

gitp () {
  printf "Resolving to git p$@ \n\n"
  git p$@
}

mcd () {
  mkdir $@
  cd $@
}

p () {
  cd ~/Code/$@
  clr
}

# count amount of lines in a file
flen () {
  a=0
  while read line
    do a=$(($a+1));
  done < "$@"

  du -sk "$@"
  echo "Final line count is: $a";
}

# decompress a file
extract () {
  if [[ "$PLATFORM" == "mac" ]]; then
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
          *)     echo "'$1' cannot be extracted via extract()" ;;
      esac
    else
        echo "'$1' is not a valid file"
    fi
  else
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar -xjf $1     ;;
        *.tar.gz)    tar -xzf $1     ;;
        *.bz2)       bunzip2 $1      ;;
        *.rar)       unrar e $1      ;;
        *.gz)        gunzip $1       ;;
        *.tar)       tar -xf $1      ;;
        *.tbz2)      tar -xjf $1     ;;
        *.tgz)       tar -xzf $1     ;;
        *.zip)       unzip $1        ;;
        *.Z)         uncompress $1   ;;
        *.7z)        7z e $1         ;;
          *)     echo "'$1' cannot be extracted via extract()" ;;
      esac
    else
        echo "'$1' is not a valid file"
    fi
  fi;
}

parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# go up a file stem towards root
up () {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

rebase () {
  case $1 in
    on )
      git rebase ${*:2}
    ;;
    skip )
      git rebase --skip
    ;;
    next )
      git rebase --continue
    ;;
    continue )
      git rebase --continue
    ;;
    stop )
      git rebase --abort
    ;;
    abort )
      git rebase --abort
    ;;
    * )
      printf "REBASE\n\nrebase on [branch],\nrebase skip (git rebase --skip),\nrebase next (git rebase --continue),\nrebase stop (git rebase --abort)\n\n"
  esac
}

mkcd () {
  mkdir $@;
  cd $1;
}

httpHeaders () {
  /usr/bin/curl -I -L $@;  # httpHeaders:      Grabs headers from web page
}

#   httpDebug:  Download a web page and show info on what took time
#   -------------------------------------------------------------------
httpDebug () {
  /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n";
}
