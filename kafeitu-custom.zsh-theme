PROMPT='%{$fg[yellow]%}%~ %{$fg_bold[yellow]%}$(git_prompt_info)%{$fg_bold[yellow]%} 
%{$fg_bold[yellow]%}➜  %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=") %{$fg[green]%}✔"
ZSH_THEME_GIT_PROMPT_ADDED=") %{$fg[yellow]%}⚑"
ZSH_THEME_GIT_PROMPT_MODIFIED=") %{$fg[yellow]%}⚑"
ZSH_THEME_GIT_PROMPT_DELETED=") %{$fg[yellow]%}⚑"
ZSH_THEME_GIT_PROMPT_RENAMED=") %{$fg[yellow]%}⚑"
ZSH_THEME_GIT_PROMPT_UNMERGED=") %{$fg[yellow]%}⚑"

#syntax highlighting
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=blue"
ZSH_HIGHLIGHT_STYLES[command]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[alias]="fg=yellow"

