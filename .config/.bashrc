alias gohome='poweroff'

mkdir -p ~/tmp
__LOCATION_FILE=~/tmp/.whereami
(umask 0077; touch "$__LOCATION_FILE")
export PROMPT_COMMAND='pwd > "$__LOCATION_FILE"'
if [ -f "$__LOCATION_FILE" ] ; then
   cd -- "$(<"$__LOCATION_FILE")"
fi
