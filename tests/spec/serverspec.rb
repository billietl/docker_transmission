require 'serverspec'
require 'rspec'

set :os, family: :debian
set :backend, :docker
set :docker_image, 'louisbilliet/transmission:testing'

describe process('transmission-daemon') do
  it { should be_running }
end

describe file('/transmission/scripts/copy_finished.sh') do
  [
    'cp -r "${TR_TORRENT_DIR}/${TR_TORRENT_NAME}" "/transmission/finished/${TR_TORRENT_NAME}"',
    'chmod -R 777 "/transmission/finished/${TR_TORRENT_NAME}"',
  ].each do |line|
    its(:content) { should match /^\s*#{Regexp.escape(line)}/ }
  end
end

describe file('/transmission/config/settings.json') do
  [
    '"alt-speed-down": 50,',
    '"alt-speed-up": 50,',
    '"alt-speed-enabled": false,',
    '"alt-speed-time-begin": 1020,',
    '"alt-speed-time-end": 540,',
    '"alt-speed-time-day": 127,',
    '"alt-speed-time-enabled": true,',
    '"bind-address-ipv4": "0.0.0.0",',
    '"blocklist-enabled": true,',
    '"blocklist-url": "http://list.iblocklist.com/?list=bt_level1&fileformat=p2p&archiveformat=gz",',
    '"cache-size-mb": 16,',
    '"dht-enabled": false,',
    '"download-dir": "/transmission/download",',
    '"download-limit": 100,',
    '"download-limit-enabled": 0,',
    '"download-queue-enabled": true,',
    '"download-queue-size": 5,',
    '"encryption": 2,',
    '"idle-seeding-limit": 30,',
    '"idle-seeding-limit-enabled": false,',
    '"lpd-enabled": true,',
    '"max-peers-global": 200,',
    '"message-level": 1,',
    '"peer-congestion-algorithm": "",',
    '"peer-limit-global": 240,',
    '"peer-limit-per-torrent": 60,',
    '"peer-port": 51413,',
    '"peer-port-random-high": 65535,',
    '"peer-port-random-low": 49152,',
    '"peer-port-random-on-start": false,',
    '"peer-socket-tos": "default",',
    '"pex-enabled": false,',
    '"port-forwarding-enabled": true,',
    '"preallocation": 1,',
    '"prefetch-enabled": 1,',
    '"queue-stalled-enabled": false,',
    '"queue-stalled-minutes": 30,',
    '"ratio-limit": 2,',
    '"ratio-limit-enabled": true,',
    '"rename-partial-files": true,',
    '"rpc-authentication-required": false,',
    '"rpc-bind-address": "0.0.0.0",',
    '"rpc-enabled": true,',
    '"rpc-port": 9091,',
    '"rpc-url": "/transmission/",',
    '"rpc-username": "",',
    '"rpc-whitelist-enabled": true,',
    '"scrape-paused-torrents-enabled": true,',
    '"script-torrent-done-enabled": true,',
    '"script-torrent-done-filename": "/transmission/scripts/copy_finished.sh",',
    '"seed-queue-enabled": false,',
    '"seed-queue-size": 10,',
    '"speed-limit-down": 100,',
    '"speed-limit-down-enabled": false,',
    '"speed-limit-up": 100,',
    '"speed-limit-up-enabled": false,',
    '"start-added-torrents": true,',
    '"trash-original-torrent-files": false,',
    '"umask": 18,',
    '"upload-limit": 100,',
    '"upload-limit-enabled": 0,',
    '"upload-slots-per-torrent": 14,',
    '"utp-enabled": true',
  ].each do |line|
    its(:content) { should match /^\s*#{Regexp.escape(line)}/ }
  end
end
