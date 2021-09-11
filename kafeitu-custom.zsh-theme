PROMPT='%{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} 
%{$fg_bold[cyan]%}➜  %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=") %{$fg[green]%}✔"
ZSH_THEME_GIT_PROMPT_ADDED=") %{$fg[cyan]%}⚑"
ZSH_THEME_GIT_PROMPT_MODIFIED=") %{$fg[cyan]%}⚑"
ZSH_THEME_GIT_PROMPT_DELETED=") %{$fg[cyan]%}⚑"
ZSH_THEME_GIT_PROMPT_RENAMED=") %{$fg[cyan]%}⚑"
ZSH_THEME_GIT_PROMPT_UNMERGED=") %{$fg[cyan]%}⚑"
