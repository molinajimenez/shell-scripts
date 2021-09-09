orphans=$(sudo pacman -Qdt)

num=0
total=0

echo "Welcome to Fran's orphan packages remover!"
for dependency in $(echo $orphans)
do
    num=$(($num + 1))
    res=$(($num % 2))
    if [ $res -gt 0 ];
    then 
        echo "Removing dependency:  " $dependency
        info=sudo pacman -Si $dependency | grep "Installed Size"
        echo $info
        total=$(($total + 1))
        sudo pacman -R --noconfirm $dependency

    fi
done
echo ""
if [ $total -gt 0 ];
then
    echo "Congrats! Removed" $total "dependencies";
else
    echo "No orphan packages found, according to pacman."
fi
