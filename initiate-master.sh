#!/bin/bash
echo "Intializing replica set on master"
replicate="rs.initiate(); sleep(1000); cfg = rs.conf(); cfg.members[0].host = \"mongodb1:27017\"; rs.reconfig(cfg); rs.add({ host: \"mongodb2:27017\", priority: 0.5 }); rs.add({ host: \"mongodb3:27017\", priority: 0.5 }); rs.status();"
docker exec -it $(docker ps -qf label=com.docker.swarm.service.name=overlay_mongodb1) bash -c "echo '${replicate}' | mongo"