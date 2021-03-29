#!/usr/bin/env bash

# export some stuff
export OLD_PATH=$PATH
export PATH=$PWD/bin:$PATH
export ROOT_DIR=$PWD

exit_devmode() {
    export PATH=$OLD_PATH
    unset OLD_PATH
}