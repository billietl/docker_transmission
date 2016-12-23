![Travis CI](https://travis-ci.org/billietl/docker_transmission.svg)

# louisbilliet/transmission
`Dockerfile` to create a [Docker](http://www.docker.com) container image for [transmission](https://transmissionbt.com/) bittorrent client.

## Contributing
Pull requests are welcome.
Make sure to bundle proper integration tests with your feature or I won't accept them.

# Getting started
## Installation
Automated build are soon to be published. Stay tuned.
Meanwhile, you can build this image on your own :
```bash
docker build -t transmission .
```
## Quickstart
Start the container using :
```bash
docker run -d \
--name transmission \
--publish 9091/tcp \
--publish 51413 \
-v /home/user/Downloads:/transmission/finished \
transmission
```
You now have a running transmission client listening on port 51413 with a web frontend listening on 9091.

All downloads are stored in `/transmission/download` and copied to `/transmission/finished` when download is completed.
This is particularly usefull when storing your data on a remote storageor if you want to have the files you're sending sitting womewhere else.
Encryption is forced. The blocklist found at `http://list.iblocklist.com/?list=bt_level1&fileformat=p2p&archiveformat=gz` is enabled.
You can override settings by mounting a volume at /transmission/config/settings.json.
