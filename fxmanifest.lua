fx_version 'cerulean'
game 'gta5'

author 'fadin_laws'
description 'Simple 911 script for your fivem server!'
version '1.0.4'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua',
    'server/versionChecker.lua'
}

shared_scripts {
    'config.lua'
}
