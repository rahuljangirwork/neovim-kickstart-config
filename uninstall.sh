#!/bin/bash

# Neovim Kickstart Config - Uninstall Script
# Author: Rahul
# Description: Remove Neovim kickstart configuration and clean up

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

# Confirm uninstallation
confirm_uninstall() {
    echo ""
    print_warning "This will remove the following directories:"
    echo "  - $HOME/.config/nvim (configuration files)"
    echo "  - $HOME/.local/share/nvim (plugins and data)"
    echo "  - $HOME/.cache/nvim (cache files)"
    echo ""
    
    read -p "Are you sure you want to uninstall? (y/n) " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Uninstallation cancelled"
        exit 0
    fi
}

# Create backup before uninstalling
create_backup() {
    local nvim_config="$HOME/.config/nvim"
    local nvim_data="$HOME/.local/share/nvim"
    local nvim_cache="$HOME/.cache/nvim"
    local backup_dir="$HOME/.config/nvim-backup-$(date +%Y%m%d-%H%M%S)"
    
    if [ -d "$nvim_config" ] || [ -d "$nvim_data" ] || [ -d "$nvim_cache" ]; then
        read -p "Do you want to create a backup before uninstalling? (y/n) " -n 1 -r
        echo
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            print_info "Creating backup at: $backup_dir"
            mkdir -p "$backup_dir"
            
            [ -d "$nvim_config" ] && cp -r "$nvim_config" "$backup_dir/nvim"
            [ -d "$nvim_data" ] && cp -r "$nvim_data" "$backup_dir/nvim-data"
            [ -d "$nvim_cache" ] && cp -r "$nvim_cache" "$backup_dir/nvim-cache"
            
            print_success "Backup created at: $backup_dir"
        fi
    fi
}

# Remove Neovim configuration and data
remove_config() {
    local nvim_config="$HOME/.config/nvim"
    local nvim_data="$HOME/.local/share/nvim"
    local nvim_cache="$HOME/.cache/nvim"
    local nvim_state="$HOME/.local/state/nvim"
    
    print_info "Removing Neovim configuration and data..."
    
    # Remove configuration
    if [ -d "$nvim_config" ]; then
        print_info "Removing: $nvim_config"
        rm -rf "$nvim_config"
        print_success "Configuration removed"
    else
        print_warning "Configuration directory not found: $nvim_config"
    fi
    
    # Remove data (plugins, etc.)
    if [ -d "$nvim_data" ]; then
        print_info "Removing: $nvim_data"
        rm -rf "$nvim_data"
        print_success "Data directory removed"
    else
        print_warning "Data directory not found: $nvim_data"
    fi
    
    # Remove cache
    if [ -d "$nvim_cache" ]; then
        print_info "Removing: $nvim_cache"
        rm -rf "$nvim_cache"
        print_success "Cache directory removed"
    else
        print_warning "Cache directory not found: $nvim_cache"
    fi
    
    # Remove state (if exists)
    if [ -d "$nvim_state" ]; then
        print_info "Removing: $nvim_state"
        rm -rf "$nvim_state"
        print_success "State directory removed"
    fi
}

# Check if there are any Neovim processes running
check_running_processes() {
    if pgrep -x "nvim" > /dev/null; then
        print_warning "Neovim is currently running!"
        print_info "Please close all Neovim instances before uninstalling"
        
        read -p "Do you want to continue anyway? (y/n) " -n 1 -r
        echo
        
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            print_info "Uninstallation cancelled"
            exit 0
        fi
    fi
}

# Main uninstallation process
main() {
    echo ""
    echo "╔════════════════════════════════════════════╗"
    echo "║ Neovim Kickstart Config - Uninstall Script║"
    echo "║              by Rahul                      ║"
    echo "╚════════════════════════════════════════════╝"
    echo ""
    
    check_running_processes
    confirm_uninstall
    create_backup
    remove_config
    
    echo ""
    print_success "Uninstallation completed successfully!"
    echo ""
    print_info "Neovim itself is still installed on your system"
    print_info "To reinstall the configuration, run: ./setup.sh"
    echo ""
}

# Run main function
main
