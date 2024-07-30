fx_version 'cerulean'
game 'gta5'

description 'Manage your ESX server with this menu'
version '1.0.0'

ui_page 'html/dist/index.html'

shared_script '@es_extended/imports.lua'

client_scripts {
    'client/**/*.lua'
}

server_scripts {
    'server/**/*.lua'
}

files {
    'html/dist/**/*',
}

dependencies {
    'es_extended'
}
