#!/bin/sh

REPOSRC=$GITREPO
LOCALREPO=$LOCALDEST

# We do it this way so that we can abstract if from just git later on
LOCALREPO_VC_DIR=$LOCALREPO/.git

if [ ! -d $LOCALREPO_VC_DIR ]
then
    echo "Cloning repository..." 
    git clone $REPOSRC $LOCALREPO
    cd $LOCALREPO
else
    echo "Repository exists: syncing repository..." 
    cd $LOCALREPO
    git pull $REPOSRC
fi
ln -s /$LOCALDEST/5etools.html /$LOCALDEST/index.html
chmod -R 644 /$LOCALDEST
npm run dev-server
# End
