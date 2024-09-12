#!/bin/bash

set -ue

dotfiles_dir="$(readlink --canonicalize "$1")"

if [[ -f "${HOME}/.bashrc" ]]; then
	echo ".bashrc already exists. Appending."
	echo ""                               >> "${HOME}/.bashrc"
	echo "# ----- Shared config -----"    >> "${HOME}/.bashrc"
	echo "source ${dotfiles_dir}/.bashrc" >> "${HOME}/.bashrc"
else
	echo ".bashrc does not exist yet. Creating it now."
	echo "#!/bin/bash"                     > "${HOME}/.bashrc"
	echo ""                               >> "${HOME}/.bashrc"
	echo "# ----- Shared config -----"    >> "${HOME}/.bashrc"
	echo "source ${dotfiles_dir}/.bashrc" >> "${HOME}/.bashrc"
fi
ln -s "${dotfiles_dir}/.gitconfig"            "${HOME}/.gitconfig"
ln -s "${dotfiles_dir}/.inputrc"              "${HOME}/.inputrc"
ln -s "${dotfiles_dir}/.tmux.conf"            "${HOME}/.tmux.conf"
ln -s "${dotfiles_dir}/.vim/"                 "${HOME}/.vim"
ln -s "${dotfiles_dir}/vscode-settings.json"  "${HOME}/.config/Code/User/settings.json"

# Remove note about sudo
touch ~/.sudo_as_admin_successful

# Set up Git Credential Manager
dotnet tool install -g git-credential-manager
git-credential-manager configure
