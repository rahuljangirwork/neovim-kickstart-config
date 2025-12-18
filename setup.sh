#!/bin/bash

# Neovim Kickstart Config - Setup Script
# Author: Rahul
# Description: Install and configure Neovim with kickstart configuration

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored messages
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Neovim is installed
check_neovim() {
    print_info "Checking for Neovim installation..."
    if ! command -v nvim &> /dev/null; then
        print_error "Neovim is not installed!"
        echo ""
        echo "Please install Neovim first. You can install it using:"
        echo "  Ubuntu/Debian: sudo apt install neovim"
        echo "  Fedora:        sudo dnf install neovim"
        echo "  Arch:          sudo pacman -S neovim"
        echo "  macOS:         brew install neovim"
        echo ""
        echo "Or download the latest version from: https://github.com/neovim/neovim/releases"
        exit 1
    fi
    
    local nvim_version=$(nvim --version | head -n 1)
    print_success "Found Neovim: $nvim_version"
}

# Check if required dependencies are installed
check_dependencies() {
    print_info "Checking for required dependencies..."
    
    local missing_deps=()
    
    # Check for git
    if ! command -v git &> /dev/null; then
        missing_deps+=("git")
    fi
    
    # Check for curl or wget
    if ! command -v curl &> /dev/null && ! command -v wget &> /dev/null; then
        missing_deps+=("curl or wget")
    fi
    
    # Check for ripgrep (recommended for Telescope)
    if ! command -v rg &> /dev/null; then
        print_warning "ripgrep is not installed (recommended for Telescope)"
        print_info "Install with: sudo apt install ripgrep (Ubuntu/Debian)"
    fi
    
    # Check for fd (recommended for Telescope)
    if ! command -v fd &> /dev/null; then
        print_warning "fd is not installed (recommended for Telescope)"
        print_info "Install with: sudo apt install fd-find (Ubuntu/Debian)"
    fi
    
    if [ ${#missing_deps[@]} -gt 0 ]; then
        print_error "Missing required dependencies: ${missing_deps[*]}"
        exit 1
    fi
    
    print_success "All required dependencies are installed"
}

# Backup existing Neovim configuration
backup_existing_config() {
    local nvim_config="$HOME/.config/nvim"
    local nvim_data="$HOME/.local/share/nvim"
    local nvim_cache="$HOME/.cache/nvim"
    local backup_dir="$HOME/.config/nvim-backup-$(date +%Y%m%d-%H%M%S)"
    
    if [ -d "$nvim_config" ] || [ -d "$nvim_data" ] || [ -d "$nvim_cache" ]; then
        print_warning "Existing Neovim configuration detected"
        read -p "Do you want to backup the existing configuration? (y/n) " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_info "Creating backup at: $backup_dir"
            mkdir -p "$backup_dir"
            
            [ -d "$nvim_config" ] && cp -r "$nvim_config" "$backup_dir/nvim"
            [ -d "$nvim_data" ] && cp -r "$nvim_data" "$backup_dir/nvim-data"
            [ -d "$nvim_cache" ] && cp -r "$nvim_cache" "$backup_dir/nvim-cache"
            
            print_success "Backup created successfully"
        fi
        
        print_info "Removing existing configuration..."
        rm -rf "$nvim_config" "$nvim_data" "$nvim_cache"
        print_success "Existing configuration removed"
    fi
}

# Install the kickstart configuration
install_config() {
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local nvim_config="$HOME/.config/nvim"
    
    print_info "Installing Neovim kickstart configuration..."
    
    # Create config directory
    mkdir -p "$HOME/.config"
    
    # Copy configuration files
    print_info "Copying configuration files from: $script_dir"
    cp -r "$script_dir" "$nvim_config"
    
    # Remove .git directory from the copied config to avoid conflicts
    if [ -d "$nvim_config/.git" ]; then
        rm -rf "$nvim_config/.git"
    fi
    
    # Remove setup and uninstall scripts from the config directory
    rm -f "$nvim_config/setup.sh" "$nvim_config/uninstall.sh"
    
    print_success "Configuration files installed"
}

# Install plugins
install_plugins() {
    print_info "Installing plugins..."
    print_info "This may take a few minutes on first run..."
    
    # Run Neovim headless to install plugins
    nvim --headless "+Lazy! sync" +qa
    
    print_success "Plugins installed successfully"
}

# Main installation process
main() {
    echo ""
    echo "╔════════════════════════════════════════════╗"
    echo "║  Neovim Kickstart Config - Setup Script   ║"
    echo "║              by Rahul                      ║"
    echo "╚════════════════════════════════════════════╝"
    echo ""
    
    check_neovim
    check_dependencies
    backup_existing_config
    install_config
    install_plugins
    
    echo ""
    print_success "Installation completed successfully!"
    echo ""
    print_info "You can now start Neovim with: nvim"
    print_info "On first run, plugins will be loaded automatically"
    echo ""
    print_info "For more information, check the README.md"
    echo ""
}

# Run main function
main
