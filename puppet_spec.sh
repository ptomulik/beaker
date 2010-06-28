#!/bin/bash

if ! [ -f local_setup.sh ] ; then
        echo "You must create a local_setup.sh so we know where to find the puppet libs."
        exit 2
fi

let FAILURES=0
let TOTAL=0

for SPEC in `find ./spec -name '*_spec.sh'` ; do
        if bash $SPEC >& /dev/null ; then
                echo -n . 
        else
                let "FAILURES+=1"
                echo -n F
        fi
        let "TOTAL+=1"
done
echo
echo "$TOTAL tests, $FAILURES failures"

[ $FAILURES -eq 0 ]
