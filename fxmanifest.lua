fx_version 'adamant'

game 'gta5'

description 'Pitny DżiBiEs'

version '1.0'

server_scripts {
    '@es_extended/locale.lua',
    'locales/pl.lua',
    'config.lua',
    'server.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/pl.lua',
    'config.lua',
    'client.lua'
}

dependencies {
    'es_extended',
    'esx_status'
}