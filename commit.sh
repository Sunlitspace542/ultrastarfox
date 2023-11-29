echo "Enter commit description:"
read desc
echo "Enter branch:"
read branch
git add . && git commit -m "$desc" && git push -u origin $branch
