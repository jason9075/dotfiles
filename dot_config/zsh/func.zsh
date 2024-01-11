# Git History Code Browser
# $1 is the file name, optional
ghc(){
  if [ -z "$1" ]; then
    ghc-all
  else
    ghc-file "$1"
  fi 

}
ghc-all(){
  git log --pretty=format:'%h' | \
  while read -r commit; do
      git show "$commit" --format="%b" | rg "^[\+\-]" | sed "s/^/$commit /"
  done | \
  fzf --ansi \
      --no-sort \
      --preview-window 'right:60%' \
      --preview "echo {} | cut -d' ' -f1 | xargs -I % git show % --color=always | delta" \
      --bind 'alt-n:preview-down,alt-p:preview-up,alt-s:toggle-sort' \
      --bind "enter:execute(echo {} | cut -d' ' -f1 | xargs -I % git show % | delta -s)"
}
# don't know why, using pipe delta in single file may cause some problem, so I use tput cols to get the width of the terminal
ghc-file(){
  local file=$1
  if [ ! -f "$file" ]; then
    echo "File "$file" not found!"
    return 1
  fi

  git log --pretty=format:'%h' -- $file | \
  while read -r commit; do
      git show "$commit" --format="%b" $file | rg "^[\+\-]" | sed "s/^/$commit /"
  done | \
  fzf --ansi \
      --no-sort \
      --preview-window 'right:60%' \
      --preview "echo {} | cut -d' ' -f1 | xargs -I % git show % -- $file | delta" \
      --bind 'alt-n:preview-down,alt-p:preview-up,alt-s:toggle-sort' \
      --bind "enter:execute(echo {} | cut -d' ' -f1 | xargs -I % git show --color=always % -- $file | delta -s -w $(tput cols) | less -R)" \
      --bind "ctrl-e:execute(echo {} | cut -d' ' -f1 | xargs -I % git show % | delta -s)"
}

# Vim Grep
# ref: https://news.ycombinator.com/item?id=31010090
# ref: https://www.mankier.com/1/fzf#Key/Event_Bindings
vg() {
  rg . \
    --line-number \
    --no-heading \
    --color=always \
    --colors 'match:fg:white' \
    --colors 'match:style:nobold' \
    --smart-case "$@" | \
      fzf --reverse -d ':' -n 3.. \
        --ansi \
        --preview-window 'right:45%' \
        --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
        --bind 'alt-n:preview-down,alt-p:preview-up,alt-s:toggle-sort' \
        --bind 'enter:become(nvim {1}:{2})'
}

# Git Stash
# https://gist.github.com/junegunn/a563d9e3e07fd721d618562762ec619d
gstash() {
  local out k reflog
  out=(
    $(git stash list --pretty='%C(yellow)%gd %>(14)%Cgreen%cr %C(blue)%gs' |
      fzf --ansi --no-sort --header='enter:show, ctrl-d:diff, ctrl-o:pop, ctrl-y:apply, ctrl-x:drop' \
          --preview='git stash show --color=always -p $(cut -d" " -f1 <<< {}) | head -'$LINES \
          --preview-window=down:50% --reverse \
          --bind='enter:execute(git stash show --color=always -p $(cut -d" " -f1 <<< {}) | less -r > /dev/tty)' \
          --bind='ctrl-d:execute(git diff --color=always $(cut -d" " -f1 <<< {}) | less -r > /dev/tty)' \
          --expect=ctrl-o,ctrl-y,ctrl-x))
  k=${out[0]}
  reflog=${out[1]}
  [ -n "$reflog" ] && case "$k" in
    ctrl-o) git stash pop $reflog ;;
    ctrl-y) git stash apply $reflog ;;
    ctrl-x) git stash drop $reflog ;;
  esac
}

# Git Commit Browser
# https://gist.github.com/junegunn/f4fca918e937e6bf5bad
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}
