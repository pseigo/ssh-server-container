# SSH Server Container

A simple SSH server container. May not be suitable for production use. :)

```sh
# Set the root password
sed -i 's/ROOT_PASSWORD!/New-Root-Password-Example/g' Dockerfile

# Build the image
./build.sh

# Run the container
./start.sh

# Start a shell with Docker if you need to troubleshoot
./connect-docker.sh

# Start an SSH session (what we're here for)
./connect-ssh.sh

# Stop and delete the container
./stop-and-delete.sh
```

If you want to connect from another machine, make sure your firewall allows
incoming traffic on port 18542.

