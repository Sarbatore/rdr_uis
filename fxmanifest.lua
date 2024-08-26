game "rdr3"
fx_version "adamant"
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."
lua54 "yes"
author "Sarbatore"
version "1.0"

client_scripts {
  "loader.lua",
  "example.lua",
  "huds/*.lua",
  "menus/basic/*.lua",
}

escrow_ignore {
  "loader.lua",
  "example.lua",
  "huds/*.lua",
  "menus/*.lua",
  "menus/basic/*.lua",
}