# Vim Grep
# ref: https://news.ycombinator.com/item?id=31010090
# ref: https://www.mankier.com/1/fzf#Key/Event_Bindings
vg() {
  rg . --line-number --no-heading --color=always --colors 'match:fg:white' --colors 'match:style:nobold' --smart-case "$@" | \
    fzf --reverse -d ':' -n 3.. --ansi --preview-window 'right:45%' \
    --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
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
  local out shas sha q k
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" \
          --print-query --expect=ctrl-d --toggle-sort=\`); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = ctrl-d ]; then
      git diff --color=always $shas | delta
    else
      for sha in $shas; do
        git show --color=always $sha | delta
      done
    fi
  done
}

# Git Blame Browser
# $1 is the file name
gbb(){
  git log --pretty=format:'%h' -- $1 | \  # find all commits that touched the file
  while read -r commit; do
      git show "$commit" --format="%H %b" $1 | sed "s/^/$commit /"  # show the commit and diff
  done | \
  fzf --ansi --preview 'echo {} | cut -d" " -f1 | xargs -I % git show % --color=always | delta' --preview-window=right:60% \
    --bind 'alt-n:preview-down,alt-p:preview-up' 
}
