# Build graylog-docker-swarm-stack

## Setup on linux
1. Clone the repo.
2. Rename .env.example -> .env and edit hostname docker
```shell
mv .env.example .env
```
3. Build graylog docker swarm stack
```shell
export $(cat .env) > /dev/null 2>&1; docker stack deploy --compose-file gitlab.yml overlay
```
3. Init master node mongodb
```shell
chmod +x initiate-master.sh
./initiate-master.sh
```