alias gohome='poweroff'

LOCATION_FILE="/tmp/whereami"
export PROMPT_COMMAND="pwd > $LOCATION_FILE"
if [ -f $LOCATION_FILE ] ; then
   cd $(cat $LOCATION_FILE)
fi
