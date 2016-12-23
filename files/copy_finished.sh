#!/bin/bash

cp -r "${TR_TORRENT_DIR}/${TR_TORRENT_NAME}" "/transmission/finished/${TR_TORRENT_NAME}"
chmod -R 777 "/transmission/finished/${TR_TORRENT_NAME}"
