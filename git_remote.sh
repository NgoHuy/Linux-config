cd $(pwd)
echo "you want to add or remove ? (a/r)"
read ans
echo "please enter your file you will commit"
read file_name
shift
echo "you describe you file: "
read -e describe
if [ "$ans" = 'a' ]
then
 git add $file_name
elif [ "$ans" = "r" ]
then
 git rm $file_name
fi
git commit -m "$describe"
git push
