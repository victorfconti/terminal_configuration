#Run with source
sudo apt-get install zsh curl wget git dconf-cli zip -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh  
cd ..
rm -rf gnome-terminal

sudo mkdir /usr/share/fonts/truetype/FiraCode

for type in Bold Light Medium Regular Retina; 
do 
sudo wget -O /usr/share/fonts/truetype/FiraCode/FiraCode-$type.ttf "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-$type.ttf?raw=true"; 
done

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

TODO update line content
sed -i '/^ZSH_THEME/d' ~/.zshrc
echo ZSH_THEME="spaceship" >> ~/.zshrc

echo "SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL=\"❯\"
SPACESHIP_CHAR_SUFFIX=\" \"" >> ~/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

echo zinit light zsh-users/zsh-autosuggestions >> ~/.zshrc
echo zinit light zdharma/fast-syntax-highlighting >> ~/.zshrc
echo zinit light zdharma/zsh-completions >> ~/.zshrc

source ~/.zshrc
