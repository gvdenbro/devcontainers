#!/bin/sh

set -e

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"
PYTHON="/usr/local/python/current/bin/python3"
RSCRIPT="/usr/bin/Rscript"
JUPYTER="/home/${USERNAME}/.local/bin/jupyter"
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

sudo_if() {
    COMMAND="$*"
    if [ "$(id -u)" -eq 0 ] && [ "$USERNAME" != "root" ]; then
        su - "$USERNAME" -c "$COMMAND"
    else
        $COMMAND
    fi
}

install_py_user_packages() {

    INSTALL_UNDER_ROOT=true
    if [ "$(id -u)" -eq 0 ] && [ "$USERNAME" != "root" ]; then
        INSTALL_UNDER_ROOT=false
    fi

    if [ "$INSTALL_UNDER_ROOT" = true ]; then
        sudo_if "${PYTHON}" -m pip install --upgrade --no-cache-dir "$@"
    else
        sudo_if "${PYTHON}" -m pip install --user --upgrade --no-cache-dir "$@"
    fi
}

install_py_user_packages ipykernel ipywidgets pandas numpy matplotlib seaborn scikit-learn notebook
sudo_if "${RSCRIPT}" "${SCRIPT_DIR}/install.r"
sudo_if "${JUPYTER}" labextension disable "@jupyterlab/apputils-extension:announcements"
