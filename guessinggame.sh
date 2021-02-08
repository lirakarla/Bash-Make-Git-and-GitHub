subdir() {
while read -r -p "Include subdir? [y/n] " subdirs; do
if [[ "$subdirs" =~ ^([yY][eE][sS]|[yY])$ ]]; then
numfiles=$(find . ! -type d | grep -v '.git' -c)
subdirsv="current directory and subdir:"
printf "\033[32m%s \n\n\033[0m" " subdir included!"
break;
elif [[ "$subdirs" =~ ^([nN][oO]|[nN])$ ]]; then
numfiles=$(find . -maxdepth 1 ! -type d | wc -l)
subdirsv="current directory only:"
printf "\033[32m%s \n\n\033[0m" "subdir excluded!"
break;
else
printf "\033[31m%s \n\033[0m" "Respuesta incorrecta..."
fi
done
}

g() {
attempts=1
while read -r -p "Attempt $attempts → Type a number: " answer; do
if [[ "$answer" =~ ^[0-9]+$ ]]; then
if [[ "$answer" -lt "$numfiles" ]] 2>/dev/null; then
printf "\033[33m%s \n\n\033[0m" "Resupesta demasiado baja"
attempts=$((attempts + 1))
elif [[ "$answer" -gt "$numfiles" ]] 2>/dev/null; then
printf "\033[33m%s \n\n\033[0m" "Respuesta demasiada alta "
attempts=$((attempts + 1))
elif [ "$answer" -eq "$numfiles" ] 2>/dev/null; then
printf "\033[32m%s \n\n\033[0m" "!!!!!!!!!!!!!!!!!Felicidades haz ganado!!!!!!!!!!!!!!!!!!!!!!!!!"
exit 0
fi
else
printf "\033[31m%s \n\n\033[0m" "Respuesta incorrecta"
attempts=$((attempts + 1))
fi
done
}
subdir
g
