# Kafei Jenkins

### The secret of the socks.

This image extends the official Jenkins latest master, installs docker and
docker-compose, and runs as root.

Future version should drop back into user jenkins, and assign jenkins user to
be in docker group.

### Run

`docker run -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v ~/katli:/katli --name=jenkins kafei/jenkins`

### Build

docker build -t 'kafei/jenkins' .
