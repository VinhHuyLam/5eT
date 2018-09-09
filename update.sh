#!/bin/sh
set -ux

REPOSRC=$GITREPO
LOCALREPO=$LOCALDEST

# We do it this way so that we can abstract if from just git later on
LOCALREPO_VC_DIR=$LOCALREPO/.git

if [ ! -d $LOCALREPO_VC_DIR ]
then
    echo Cloning repository... 
    git clone $REPOSRC $LOCALREPO
else
    echo Repository exists: updating repository... 
    cd $LOCALREPO
    git pull $REPOSRC
fi

# End
exec "$@"
