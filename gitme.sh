# Script committing and pushing recent changes after running tree, cloc & PHPUnit and updating README.md
if [ $# -eq 0 ]
  then
    echo "Please add a commit message as agument (\$1)!"
    exit 23
fi
cat tmp/README.tpl.md > README.md
# Add current project file structure (filtered) to README.md

echo "### Files" >> README.md 
echo "<pre><code>" >> README.md
tree -I "tmp|phpunit|vendor|ext"  >> README.md
# Counting lines of code (filtered by .cloc contents) and add to README.md

echo "</code></pre>" >> README.md
echo "### Lines of code" >> README.md 
echo "<pre><code>" >> README.md

cloc . --exclude-dir=tmp,vendor,non-php >> README.md
echo "</code></pre>" >> README.md
echo "### Unit testing" >> README.md 
echo "<pre><code>" >> README.md


# Processing unit tests and add results to README.md
./phpunit.phar >> README.md

# Sanitizing markup in README.md
echo "</code>" >> README.md
echo "</pre>" >> README.md

# Adding, committing & pushing with message from STDIN
git add .
git commit -m "$1"
git push origin
echo "... done!"
