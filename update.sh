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
    npm run dev-server
else
    echo Repository exists: updating repository... 
    cd $LOCALREPO
    git pull $REPOSRC
    npm run dev-server
fi

# End
