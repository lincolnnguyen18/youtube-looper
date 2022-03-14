if screen -list | grep -q "d7"; then
  echo "d7 already started"
  exit 1
else
  echo "starting d7"
fi

. /media/sda1/deployment/ports.sh

# Start node server
screen -dmS 'd7'
screen -S 'd7' -X stuff "node .\n"

echo "Checking if node started..."
lsof -i:$d7

# Build vue client
yarn build