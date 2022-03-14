if ! screen -list | grep -q 'd7'; then
  echo 'd7 already killed'
  exit 1
else
  echo "killing d7"
fi
. /media/sda1/deployment/ports.sh
screen -S 'd7' -X quit
echo "Checking if d7 still alive..."
lsof -i:$d7