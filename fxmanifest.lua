version '1.1'

fx_version 'adamant'
game 'gta5'

ui_page "html/ui.html"

client_scripts {
	'client.lua',
	'config.lua'
}
server_scripts {
	'server.lua',
	'config.lua'
}
files {
    "html/ui.html",
    "html/*.css",
    "html/*.js",
    "html/*.mp3",
}