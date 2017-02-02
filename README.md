#Build from docker file
docker build -t luxknight007/node:latest .

# Command
docker run -it --rm --name node -v "$PWD":/usr/src/app -w /usr/src/app luxknight007/node:latest <node command>

# Command for root user
docker run -it --rm --name node -u root -v "$PWD":/usr/src/app -w /usr/src/app luxknight007/node:latest <node command>
