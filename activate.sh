
#!/bin/bash
set -e
function abs_path {
  (cd "$(dirname '$1')" &>/dev/null && printf "%s/%s" "$PWD" "${1##*/}")
}
alias python=python3
alias pip=pip3
# if make_venv dir is not present, then make it
if [ ! -d "venv" ]; then
  python make_venv.py
fi
# if IN_ACTIVATED_ENV is set, then we are already in the venv
if [ -n "$IN_ACTIVATED_ENV" ]; then
  return
fi
. $( dirname $(abs_path ${BASH_SOURCE[0]}))/venv/bin/activate
export PATH=$( dirname $(abs_path ${BASH_SOURCE[0]}))/:$PATH
export IN_ACTIVATED_ENV="1"
