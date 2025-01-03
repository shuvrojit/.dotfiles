# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/go/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="/home/shuv40/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fzf thefuck web-search copypath copyfile copybuffer dirhistory)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias c="clear"
alias s="sudo"
alias pi="sudo pacman -S"
alias pu="sudo pacman -Syyu"
alias pr="sudo pacman -Rns"
alias s="source"
alias ls="ls -la"
alias ln="ln -sf"
alias ln="ln"

alias w="wget --progress=bar"
alias wr="wget -c --progress=bar"

# starting sway on tty1 by default
# if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  # exec sway
# fi

# hyprland
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    export SDL_VIDEODRIVER=wayland
    export MOZ_ENABLE_WAYLAND=1
    # export GTK_THEME=Catppuccin-blue:dark
    exec Hyprland
fi


alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
alias em="emacsclient -c"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
source ~/.config/nvm/nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#bat customization
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# fzf configurations
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# Uncomment the following line to disable fuzzy completion
# export DISABLE_FZF_AUTO_COMPLETION="true"
# Uncomment the following line to disable key bindings (CTRL-T, CTRL-R, ALT-C)
# export DISABLE_FZF_KEY_BINDINGS="true"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

export FZF_DEFAULT_COMMAND='ag'


# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.

(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# Import the colors.
# . "${HOME}/.cache/wal/colors.sh"

# Create the alias.
# alias dmen='dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'

export ALTERNATE_EDITOR=''
alias e="emacsclient --tty"
# XDG_CURRENT_DESKTOP=sway
XDG_CURRENT_DESKTOP=hyprland
alias g="git"
alias gc="git clone"
alias yr="yarn run"
alias ya="yarn add"
alias ds="docker start"
alias dh="docker stop"
alias npd="npm run dev"
alias npf="npm run format"
alias npt="npm run test"
alias npb="npm run build"



# alias wl="wl-screenrec -f "$(date +"%Y_%m_%d_%I_%M_%p_%S")".mp4"
alias wl="wl-screenrec -f "$(date +"%Y-%m-%d-%I-%M-%p")".mp4"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export PATH="$PATH:/opt/miniconda3/bin/"

CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
export CHROME_EXECUTABLE
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

alias man="qman"
alias igm='(cd ~/.income-generator; sh start.sh)'


# Define a function to find directories using fd and fzf
cd_to_dir() {
    local selected_dir
    selected_dir=$(fd -t d . "$1" | fzf +m --height 50% --preview 'tree -C {}')
    # selected_dir=$(fd -t d . ~/Desktop/ | fzf +m --height 50% --preview 'tree -C {}')

    if [[ -n "$selected_dir" ]]; then
        # Change to the selected directory
        cd "$selected_dir" || return 1
    fi
}

emacs_to_dir() {
    local selected_dir
    selected_dir=$(fd -t d . "$1" | fzf +m --height 50% --preview 'tree -C {}')
    # selected_dir=$(fd -t d . ~/Desktop/ | fzf +m --height 50% --preview 'tree -C {}')

    if [[ -n "$selected_dir" ]]; then
        # Change to the selected directory
        e "$selected_dir" &
    fi
}

emacs_to_file() {
    local selected_file
    selected_file=$(fd -t f . "$1" | fzf +m --height 50% --preview 'tree -C {}')
    # selected_dir=$(fd -t d . ~/Desktop/ | fzf +m --height 50% --preview 'tree -C {}')

    if [[ -n "$selected_file" ]]; then
        # Change to the selected directory
         "$selected_file" &
    fi
}

# Create an alias for the function
alias cdd='cd_to_dir ~/Desktop/'
alias cde='emacs_to_dir ~/Desktop/'
alias cds='cd_to_dir'
alias cfe='emacs_to_file ~/'
alias gc="git clone"
alias gs="git status"

export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export XDG_CONFIG_HOME="$HOME/.config/"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export XDG_RUNTIME_DIR=/run/user/$(id -u)
