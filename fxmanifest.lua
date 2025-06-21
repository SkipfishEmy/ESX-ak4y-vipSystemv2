fx_version 'cerulean'
game 'gta5'


shared_script {
	"config/settings.lua",
	"config/main.lua",

	"config/translate.lua",

	"config/mainMenu/buyCoin.lua",
	"config/mainMenu/hotDeals.lua",
	"config/mainMenu/specialOffer.lua",

	"config/categories/vehicleCategory.lua",
	"config/categories/itemCategory.lua",
	"config/categories/moneyCategory.lua",
	"config/categories/weaponCategory.lua",
	"config/categories/jobCategory.lua",
	"config/categories/houseCategory.lua",
	"config/categories/bundleCategory.lua",
	"config/categories/customizeCategory.lua",
}

client_scripts {
	-- 'config.lua',
	'utils/client.lua',
	'client/client.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	-- '@mysql-async/lib/MySQL.lua',
	'config/server_config.lua',
	'utils/server.lua',
	'config/admin_commands.lua',
	'server/server.lua',
}

ui_page {
	'html/index.html'
}

files {
	'html/index.html',
	'html/app.js',
	'html/main.css',
	'html/font/*.ttf',
	'html/img/*.png',
	'html/itemImages/*.png',
	'html/img/boughtSide/*.png',
	'html/img/bundleSide/*.png',
	'html/img/coinNeed/*.png',
	'html/img/coinSide/*.png',
	'html/img/filterSide/*.png',
	'html/img/hotDeals/*.png',
	'html/img/jobSide/*.png',
	'html/img/specialOffer/*.png',
}

escrow_ignore {
	'client/client.lua',
	'server/server.lua',


	'utils/client.lua',
	'utils/server.lua',
	
	"config/settings.lua",
	"config/main.lua",
	"config/admin_commands.lua",
	"config/server_config.lua",

	"config/translate.lua",

	"config/mainMenu/buyCoin.lua",
	"config/mainMenu/hotDeals.lua",
	"config/mainMenu/specialOffer.lua",

	"config/categories/_exampleCategory.lua",
	"config/categories/vehicleCategory.lua",
	"config/categories/itemCategory.lua",
	"config/categories/moneyCategory.lua",
	"config/categories/weaponCategory.lua",
	"config/categories/jobCategory.lua",
	"config/categories/houseCategory.lua",
	"config/categories/bundleCategory.lua",
	"config/categories/customizeCategory.lua",
}  

lua54 'on'


dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'