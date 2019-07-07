current_branch=`git branch | grep \* | cut -d ' ' -f2`
echo "main     : $current_branch"

cd php
current_branch=`git branch | grep \* | cut -d ' ' -f2`
echo "php      : $current_branch"

cd ../frontend
current_branch=`git branch | grep \* | cut -d ' ' -f2`
echo "frontend : $current_branch"

cd ../sql
current_branch=`git branch | grep \* | cut -d ' ' -f2`
echo "sql      : $current_branch"
cd ..

