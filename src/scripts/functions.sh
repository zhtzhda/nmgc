#!/bin/bash

RED="\033[0;31m"
CYAN="\033[0;36m"
GREEN="\033[0;32m"
RESET="\033[0m"

function printWithColor() {
    TEXT="$1"
    COLOR="$2"
    COLOR_CODE=""

    case $COLOR in
    red) COLOR_CODE=$RED ;;
    cyan) COLOR_CODE=$CYAN ;;
    green) COLOR_CODE=$GREEN ;;
    *) COLOR_CODE=$RESET ;;
    esac

    printf "$COLOR_CODE$TEXT"
}

function checkError() {
    if [[ $ERROR == true ]]; then
        printf "\033[0;31m[Error]: Script couldn't run successfully 💥\033[0m\n"
        exit 1
    fi

    if [ $NPM_ERROR == true ]; then
        printf "\033[0;31m[npm Error]: We cannot install NPM dependencies 💥\033[0m\n"
        exit 1
    fi
}

function removeNpmModules() {
    printWithColor "$(date +"%Y-%m-%d %T") Init NPM dependencies removing...⏳\n" "cyan" && sleep 0.5
    printWithColor "$(date +"%Y-%m-%d %T") Moving to $PWD... 🚀\n" "green" && sleep 0.5
    cd $PWD || ERROR=true
    checkError

    if [[ -f $PACKAGE_LOCK ]]; then
        ACTION_FLAG=true
        printWithColor "$(date +"%Y-%m-%d %T") Removing '$PACKAGE_LOCK' file...⚙️n" "green" && sleep 0.5
        rm $PACKAGE_LOCK || ERROR=true
        checkError

        printWithColor "$(date +"%Y-%m-%d %T") '$PACKAGE_LOCK' file removed! ✅\n" "green" && sleep 0.5
    fi

    if [[ -d $NODE_MODULES ]]; then
        ACTION_FLAG=true
        printWithColor "$(date +"%Y-%m-%d %T") Removing '$NODE_MODULES' directory...⚙️\n" "green" && sleep 0.5
        rm -rf $NODE_MODULES || ERROR=true
        checkError

        printWithColor "$(date +"%Y-%m-%d %T") '$NODE_MODULES' directory removed! ✅\n" "green" && sleep 0.5
    fi

    if [[ $ACTION_FLAG == false ]]; then
        printWithColor "$(date +"%Y-%m-%d %T") There's nothing to remove! 🗑\n\n" "cyan" && sleep 0.5
    else
        printWithColor "$(date +"%Y-%m-%d %T") NPM dependencies were removed! ✅\n\n" "cyan" && sleep 0.5
    fi

}

function installNpmModules() {
    printWithColor "$(date +"%Y-%m-%d %T") Init NPM dependencies installing...⏳\n" "cyan" && sleep 0.5
    if [[ -f $PACKAGE ]]; then
        printWithColor "$(date +"%Y-%m-%d %T") Installing NPM dependencies...⚙️\n" "green" && sleep 0.5

        if [[ $IS_INSTALL_OPTIONAL == true ]]; then
            npm i $ENTRY_OPTIONAL_COMMAND --save 2>&1 >printf || NPM_ERROR=true
        else
            npm i --save 2>&1 >printf || NPM_ERROR=true
        fi

        checkError

        printWithColor "$(date +"%Y-%m-%d %T") NPM dependencies installed! ✅\n" "cyan" && sleep 0.5
    else
        printWithColor "$(date +"%Y-%m-%d %T") This directory doesn't have '$PACKAGE' file\n" "cyan" && sleep 0.5
    fi
}
