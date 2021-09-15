#!/bin/bash
# Errors variables
ERROR=false
NPM_ERROR=false

# Node files and directories
PACKAGE_LOCK="package-lock.json"
PACKAGE="package.json"
NODE_MODULES="node_modules"

# Commands
ENTRY_COMMAND="$1"
ENTRY_OPTIONAL_COMMAND="$2"
REMOVE_COMMAND="remove"
REMOVE_SHORT_COMMAND="r"
INSTALL_COMMAND="install"
INSTALL_SHORT_COMMAND="i"

COMMAND_MAN="
Usage: handleModules <command>

Commands:
remove, r    
    remove package-lock and node_modules 
install, i   [options]   
    clean dependencies and install them from package.json"

# Flags
ACTION_FLAG=false
IS_INSTALL_OPTIONAL=false

source "./src/scripts/functions.sh"

if [[ -z $@ ]] || [[ $# -eq 0 ]]; then
    printf "\033[0;31mEmpty arguments\033[0m\n"
    printf "\033[0;36m$COMMAND_MAN\033[0m\n"
    exit 1
fi

if [[ -n $ENTRY_OPTIONAL_COMMAND ]]; then
    IS_INSTALL_OPTIONAL=true
fi

if [[ $ENTRY_COMMAND == $REMOVE_COMMAND ]] || [[ $ENTRY_COMMAND == $REMOVE_SHORT_COMMAND ]]; then
    removeNpmModules
elif
    [[ $ENTRY_COMMAND == $INSTALL_COMMAND ]] || [[ $ENTRY_COMMAND == $INSTALL_SHORT_COMMAND ]]
then
    removeNpmModules
    installNpmModules
else
    printf "\033[0;31mThe command '$ENTRY_COMMAND' isn't correct ❌\033[0m\n"
    printf "\033[0;36m$COMMAND_MAN\033[0m\n"
fi

exit 1
