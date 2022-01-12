# Intranet Dashboard

todo

```
docker build -t intranet-dashboard . && docker run --name=intranet-dashboard --rm -it --volume=$(pwd):/var/www/html --volume=/var/run/docker.sock:/var/run/docker.sock:ro -p 80:80 intranet-dashboard
```
