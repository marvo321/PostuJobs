fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Marvo'
description 'postulacion Trabajos'

shared_scripts {
    "@ox_lib/init.lua",
    "config.lua",
}

client_scripts {
    'client/cl_main.lua',
}

server_scripts {
    'server/sv_main.lua',
}

lua54 "yes"