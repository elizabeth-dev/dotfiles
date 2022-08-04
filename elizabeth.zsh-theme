if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="white"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ -n $SSH_CONNECTION ]]; then
  USERINFO="%{${fg[green]}%}%n%{$reset_color%}%{${fg[yellow]}%}@%m%{$reset_color%}"
elif [[ -n $GITPOD_HOST ]]; then
  USERINFO="%{${fg[green]}%}%n%{$reset_color%}@$(jq -r --jsonargs .checkoutLocation <<< $GITPOD_WORKSPACE_CONTEXT )"
else
  USERINFO="%{${fg[green]}%}%n%{$reset_color%}@%m"
fi

PROMPT='$USERINFO %{${fg_bold[blue]}%}:: %{$reset_color%}%{${fg[green]}%}%3~$(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}%(!.#.>)%{${reset_color}%} '

RPS1="${return_code} %*"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
