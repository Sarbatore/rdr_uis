game "rdr3"
fx_version "adamant"
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."
lua54 "yes"
author "Sarbatore"
version "1.1"

client_scripts {
  "functions.lua",
  
  "classes/*.lua",

  "example.lua",
}

escrow_ignore {
  "example.lua",
}