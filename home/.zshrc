# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Dependencies You Need for this Config
# zsh-syntax-highlighting - syntax highlighting for ZSH in standard repos
# autojump - jump to directories with j or jc for child or jo to open in file manager
# zsh-autosuggestions - Suggestions based on your history

# Initial Setup
# touch "$HOME/.cache/zshhistory
# Setup Alias in $HOME/zsh/aliasrc
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Custom Variables
EDITOR=vim

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

# FZF
#eval "$(fzf)"

## replace find with fd
#export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip_cwd_prefix --exclude .git"

# Custom ZSH Binds
bindkey '^ ' autosuggest-accept
bindkey -s '^o' 'lf\n'
# Load aliases and shortcuts if existent.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

# Load ; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/autojump/autojump.zsh 2>/dev/null
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

mcd () {
    mkdir -p "$1"
    cd "$1"
}

getDuration(){
  exiftool -ext mp4 -r -n -q -p '${Duration;$_ = ConvertDuration(our $total += $_)}' . | tail -n 1
}
source ~/powerlevel10k/powerlevel10k.zsh-theme
export LM_LICENSE_FILE=/mnt/Data/Downloads/LR-158001_License.dat
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=/usr/local/lib/nodejs/node-v18.16.0-linux-x64/bin:$PATH
export PATH=/home/mahmoud/.cargo/bin:$PATH
export PATH=/home/mahmoud/.arm/to/install/dir/gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu/bin/:$PATH
autoload -Uz compinit
fpath+=~/.zfunc
export PATH=$PATH:/home/mahmoud/.local/bin
export PATH=$PATH:/opt/riscv/bin/
export PATH=$PATH:/opt/oss-cad-suite/bin
export PATH=$PATH:/mnt/OS/Vivado/Vivado/2019.1/bin/;
export PATH=$PATH:~/intelFPGA/22.1std/questa_fse/bin;  

lf() {
    cd "$(command lf -print-last-dir "$@")"
}
eval "$(zoxide init zsh --cmd cd)"

LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
.git=:\
Desktop=:\
Documents=:\
Downloads=:\
Dotfiles=:\
Dropbox=:\
Music=:\
Pictures=:\
Public=:\
Templates=:\
Videos=:\
Escritorio=:\
Documentos=:\
Descargas=:\
Música=:\
Imágenes=:\
Público=:\
Plantillas=:\
Vídeos=:\
Bureau=:\
Images=:\
Musique=:\
Publique=:\
Téléchargements=:\
Vidéos=:\
Imagens=:\
Modelos=:\
Área de trabalho=:\
Documenti=:\
Immagini=:\
Modelli=:\
Musica=:\
Pubblici=:\
Scaricati=:\
Scrivania=:\
Video=:\
Bilder=:\
Dokumente=:\
Musik=:\
Schreibtisch=:\
Vorlagen=:\
Öffentlich=:\
Dokumentumok=:\
Képek=:\
Zene=:\
Letöltések=:\
Számítógép=:\
Videók=:\
.bash_aliases=:\
.bash_history=:\
.bash_logout=:\
.bash_profile=:\
.bashprofile=:\
.bashrc=:\
.dmrc=:\
.DS_Store=:\
.fasd=:\
.fehbg=:\
.gitattributes=:\
.gitconfig=:\
.gitignore=:\
.gitlab-ci.yml=:\
.gvimrc=:\
.inputrc=:\
.jack-settings=:\
.mime.types=:\
.ncmpcpp=:\
.nvidia-settings-rc=:\
.pam_environment=:\
.profile=:\
.recently-used=:\
.selected_editor=:\
.vim=:\
.viminfo=:\
.vimrc=:\
.Xauthority=:\
.Xdefaults=:\
.xinitrc=:\
.xinputrc=:\
.Xresources=:\
.zshrc=:\
_gvimrc=:\
_vimrc=:\
a.out=:\
authorized_keys=:\
bspwmrc=:\
cmakelists.txt=:\
config=:\
config.ac=:\
config.m4=:\
config.mk=:\
config.ru=:\
configure=:\
docker-compose.yml=:\
dockerfile=:\
Dockerfile=:\
dropbox=:\
exact-match-case-sensitive-1.txt=X1:\
exact-match-case-sensitive-2=X2:\
favicon.ico=:\
gemfile=:\
gruntfile.coffee=:\
gruntfile.js=:\
gruntfile.ls=:\
gulpfile.coffee=:\
gulpfile.js=:\
gulpfile.ls=:\
ini=:\
known_hosts=:\
ledger=:\
license=:\
LICENSE=:\
LICENSE.md=:\
LICENSE.txt=:\
Makefile=:\
makefile=:\
Makefile.ac=:\
Makefile.in=:\
mimeapps.list=:\
mix.lock=:\
node_modules=:\
package-lock.json=:\
package.json=:\
playlists=:\
procfile=:\
Rakefile=:\
rakefile=:\
react.jsx=:\
README=:\
README.markdown=:\
README.md=:\
README.rst=:\
README.txt=:\
sxhkdrc=:\
user-dirs.dirs=:\
webpack.config.js=:\
*.7z=:\
*.a=:\
*.ai=:\
*.apk=:\
*.asm=:\
*.asp=:\
*.aup=:\
*.avi=:\
*.awk=:\
*.bash=:\
*.bat=:\
*.bmp=:\
*.bz2=:\
*.c=:\
*.c++=:\
*.cab=:\
*.cbr=:\
*.cbz=:\
*.cc=:\
*.class=:\
*.clj=:\
*.cljc=:\
*.cljs=:\
*.cmake=:\
*.coffee=:\
*.conf=:\
*.cp=:\
*.cpio=:\
*.cpp=:\
*.cs=:\
*.csh=:\
*.css=:\
*.cue=:\
*.cvs=:\
*.cxx=:\
*.d=:\
*.dart=:\
*.db=:\
*.deb=:\
*.diff=:\
*.dll=:\
*.doc=:\
*.docx=:\
*.dump=:\
*.edn=:\
*.eex=:\
*.efi=:\
*.ejs=:\
*.elf=:\
*.elm=:\
*.epub=:\
*.erl=:\
*.ex=:\
*.exe=:\
*.exs=:\
*.f#=:\
*.fifo=|:\
*.fish=:\
*.flac=:\
*.flv=:\
*.fs=:\
*.fsi=:\
*.fsscript=:\
*.fsx=:\
*.gem=:\
*.gemspec=:\
*.gif=:\
*.go=:\
*.gz=:\
*.gzip=:\
*.h=:\
*.haml=:\
*.hbs=:\
*.hh=:\
*.hpp=:\
*.hrl=:\
*.hs=:\
*.htaccess=:\
*.htm=:\
*.html=:\
*.htpasswd=:\
*.hxx=:\
*.ico=:\
*.img=:\
*.ini=:\
*.iso=:\
*.jar=:\
*.java=:\
*.jl=:\
*.jpeg=:\
*.jpg=:\
*.js=:\
*.json=:\
*.jsx=:\
*.key=:\
*.ksh=:\
*.leex=:\
*.less=:\
*.lha=:\
*.lhs=:\
*.log=:\
*.lua=:\
*.lzh=:\
*.lzma=:\
*.m4a=:\
*.m4v=:\
*.markdown=:\
*.md=:\
*.mdx=:\
*.mjs=:\
*.mkv=:\
*.ml=λ:\
*.mli=λ:\
*.mov=:\
*.mp3=:\
*.mp4=:\
*.mpeg=:\
*.mpg=:\
*.msi=:\
*.mustache=:\
*.nix=:\
*.o=:\
*.ogg=:\
*.opus=:\
*.pdf=:\
*.php=:\
*.pl=:\
*.pm=:\
*.png=:\
*.pp=:\
*.ppt=:\
*.pptx=:\
*.ps1=:\
*.psb=:\
*.psd=:\
*.pub=:\
*.py=:\
*.pyc=:\
*.pyd=:\
*.pyo=:\
*.r=ﳒ:\
*.rake=:\
*.rar=:\
*.rb=:\
*.rc=:\
*.rlib=:\
*.rmd=:\
*.rom=:\
*.rpm=:\
*.rproj=鉶:\
*.rs=:\
*.rss=:\
*.rtf=:\
*.s=:\
*.sass=:\
*.scala=:\
*.scss=:\
*.sh=:\
*.slim=:\
*.sln=:\
*.so=:\
*.sql=:\
*.styl=:\
*.suo=:\
*.swift=:\
*.t=:\
*.tar=:\
*.tex=ﭨ:\
*.tgz=:\
*.toml=:\
*.ts=:\
*.tsx=:\
*.twig=:\
*.vim=:\
*.vimrc=:\
*.vue=﵂:\
*.wav=:\
*.webm=:\
*.webmanifest=:\
*.webp=:\
*.xbps=:\
*.xcplayground=:\
*.xhtml=:\
*.xls=:\
*.xlsx=:\
*.xml=:\
*.xul=:\
*.xz=:\
*.yaml=:\
*.yml=:\
*.zip=:\
*.zsh=:\
"
export LF_ICONS

eval "$(atuin init zsh)"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"