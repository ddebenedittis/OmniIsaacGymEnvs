# Opens a new container with no name.

xhost +
docker run -it -e "ACCEPT_EULA=Y" --rm --network=host \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --volume="/dev/dri:/dev/dri" \
    --gpus all \
    `# Use GUI and NVIDIA.` \
    -e "PRIVACY_CONSENT=Y" \
    `# Preserve bash history for autocomplete).` \
    --env="HISTFILE=/home/.bash_history" \
    --env="HISTFILESIZE=$HISTFILESIZE" \
    -v ~/.bash_history:/home/.bash_history \
    `# Mount essential volumes.` \
    -v ${PWD}:/workspace/omniisaacgymenvs \
    -v ~/docker/isaac-sim/cache/kit:/isaac-sim/kit/cache:rw \
    -v ~/docker/isaac-sim/cache/ov:/root/.cache/ov:rw \
    -v ~/docker/isaac-sim/cache/pip:/root/.cache/pip:rw \
    -v ~/docker/isaac-sim/cache/glcache:/root/.cache/nvidia/GLCache:rw \
    -v ~/docker/isaac-sim/cache/computecache:/root/.nv/ComputeCache:rw \
    -v ~/docker/isaac-sim/logs:/root/.nvidia-omniverse/logs:rw \
    -v ~/docker/isaac-sim/data:/root/.local/share/ov/data:rw \
    -v ~/docker/isaac-sim/documents:/root/Documents:rw \
    `# Mount folders useful for VS Code.` \
    -v /home/$USER/.vscode:/home/$USER/.vscode \
    -v /home/$USER/.vscode-server:/home/$USER/.vscode-server \
    -v /home/$USER/.config/Code:/home/$USER/.config/Code \
    isaac-sim-oige
