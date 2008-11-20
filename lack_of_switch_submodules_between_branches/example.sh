#!/bin/bash

# setup
mkdir no_switching_trees
cd no_switching_trees
mkdir foo
touch foo/some_text.txt
git init
git add .
git commit -a -m "* Add a blank file"

# add a submodule, commit it, init it:
git submodule add git://github.com/smtlaissezfaire/git_submodule_bugs.git git_submodule_bugs
git add .
git commit -a -m "* Add submodule"
git submodule init
git submodule update

# note: current commit:

cd git_submodule_bugs
echo "current commit: $(git rev-list HEAD | head -n 1)"
cd -

# checkout branch two:
git checkout -b branch_two
cd git_submodule_bugs
git checkout 27e6de0ed01190779caf550b9e8f7524bbfe358d
cd -
git commit -a -m "* Move submodule in branch 2 to a different commit"


# checkout master branch, again:
git checkout master

# Still on commit from branch_two:
cd git_submodule_bugs
echo "current commit: $(git rev-list HEAD | head -n 1)"
cd -
