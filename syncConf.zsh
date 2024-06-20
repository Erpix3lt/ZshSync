# ~/.custom_zsh_functions

# Function to push configuration files to the repository
function pushConf() {
    local original_dir=$(pwd)
    local date=$(date +"%Y-%m-%d")
    local custom_dir="$HOME/.oh-my-zsh/custom"
    local zshrc_file="$HOME/.zshrc"
    local target_dir="$HOME/Documents/PRIVATE-Config"
    local target_custom_dir="$target_dir/custom"

    # Create target custom directory if it doesn't exist
    mkdir -p "$target_custom_dir"

    # Copy files excluding the plugins directory
    rsync -av --exclude 'plugins' "$custom_dir/" "$target_custom_dir/"
    cp "$zshrc_file" "$target_dir"

    # Navigate to the target directory
    cd "$target_dir" || { echo "Failed to navigate to target directory"; return 1; }

    # Git add, commit, and push
    git add .
    git commit -m "pushConf - $date"
    git push

    # Return to the original directory
    cd "$original_dir" || { echo "Failed to return to the original directory"; return 1; }
}

# Function to pull configuration files from the repository
function pullConf() {
    local original_dir=$(pwd)
    local target_dir="$HOME/Documents/PRIVATE-Config"
    local target_custom_dir="$target_dir/custom"
    local zshrc_file="$target_dir/.zshrc"
    local custom_dir="$HOME/.oh-my-zsh/custom"
    local home_zshrc_file="$HOME/.zshrc"

    # Navigate to the target directory
    cd "$target_dir" || { echo "Failed to navigate to target directory"; return 1; }

    # Git stash and pull
    git stash
    git pull

    # Copy/replace files
    cp "$zshrc_file" "$home_zshrc_file"
    rsync -av --exclude 'plugins' "$target_custom_dir/" "$custom_dir/"

    # Return to the original directory
    cd "$original_dir" || { echo "Failed to return to the original directory"; return 1; }
}
