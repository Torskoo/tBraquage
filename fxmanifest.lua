fx_version('cerulean')
game('gta5')


client_scripts {
    '@es_extended/locale.lua',
    -----------------------
	-------- Libs ---------
	-----------------------
    'src/RageUI/RMenu.lua',
    'src/RageUI/menu/RageUI.lua',
    'src/RageUI/menu/Menu.lua',
    'src/RageUI/menu/MenuController.lua',
    'src/RageUI/components/*.lua',
    'src/RageUI/menu/elements/*.lua',
    'src/RageUI/menu/items/*.lua',
    'src/RageUI/menu/panels/*.lua',
    'src/RageUI/menu/panels/*.lua',
    'src/RageUI/menu/windows/*.lua',
    -----------------------
	---- InitRessource ----
	-----------------------
    'client.lua',
    'config.lua',
    'function.lua',

}


server_scripts {

    'server.lua',
}