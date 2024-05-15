MYUID="$(id -u $USER)"
MYGID="$(id -g $USER)"

docker build \
    --build-arg MYUID=${MYUID} \
    --build-arg MYGID=${MYGID} \
    --build-arg USER=${USER} \
    -t isaac-sim-oige \
    -f docker/dockerfile .
