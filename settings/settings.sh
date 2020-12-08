#!/bin/bash

CMD="jupyter lab --allow-root --ip=0.0.0.0 --no-browser"

if [[ -v PASSWORD ]]; then
  PASSWORD=$(python -c "import IPython; print(IPython.lib.security.passwd('$PASSWORD'))")
  CMD="$CMD --NotebookApp.token='' --NotebookApp.password='${PASSWORD}'"
fi

if [[ -v GIT_URL ]]; then
  git clone $GIT_URL /notebook
fi

if [ -f /notebook/packages.txt ]; then
  echo "[INFO] - Packages Activated. File packages.txt found in /notebook. - Command:  \"apt install <packages>\""
  apt update
  cat packages.txt | xargs apt install -y
else
  echo "[INFO] - Packages Unavailable. File packages.txt not found in /notebook - No installation required."
fi


if [ -f /notebook/requirements.txt ]; then
  echo "[INFO] - Requirements Activated. File requirements.txt found in /notebook. - Command: \"pip install -r requirements.txt\""
  pip install -r requirements.txt
else
  echo "[INFO] - Requirements Unavailable. File requirements.txt not found in /notebook - No installation required."
fi

if [ -f /notebook/extensions.txt ]; then
  echo "[INFO] - Extensions Activated. File extensions.txt found in /notebook. - Command: \"jupyter extension install --user\""
  cat extensions.txt | xargs -I {} jupyter {} install --user
else
  echo "[INFO] - Extensions Unavailable. File extensions.txt not found in /notebook - No installation required."
fi

echo
echo "Status:"
python --version
pip --version
jupyter --version
echo "Node $(node --version)"
echo "NPM $(npm -v)"

echo
echo "Packages:"
pip list -l

echo
echo "Juypter Extensions"
jupyter labextension list

echo
exec $CMD "$@"