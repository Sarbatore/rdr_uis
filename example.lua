local Config = {}

-- Enable or disable the examples
Config.BOUNTYCASH = false
Config.TITHING = false
Config.RANKBAR = false
Config.LEADERBOARD = false
Config.HONORLEVEL = false
Config.HELPERTEXTFIELDS = false
Config.PASSIVEICON = false

--[[
##########################################################
##                   BOUNTY CASH EXAMPLE                ##
##########################################################
]]
if (Config.BOUNTYCASH) then
    local BOUNTYCASH = exports.rdr_menu:BOUNTYCASH()
    Citizen.CreateThread(function()
        BOUNTYCASH.SetVisiblity(true)

        for i=0, 100 do
            BOUNTYCASH.SetText("Cash: $" .. i)
            
            Citizen.Wait(100)
        end

        BOUNTYCASH.SetVisiblity(false)
    end)
end

--[[
##########################################################
##                     TITHING EXAMPLE                  ##
##########################################################
]]
if (Config.TITHING) then
    local TITHING = exports.rdr_menu:TITHING()
    Citizen.CreateThread(function()
        TITHING.Show()

        for i=0, 100 do
            TITHING.SetText("Supplies")
            TITHING.SetCampFunds(i*i, i)
            TITHING.SetPlayerCash(i, 0)
            
            Citizen.Wait(100)
        end

        TITHING.Hide()
    end)
end

--[[
##########################################################
##                     RANKBAR EXAMPLE                  ##
##########################################################
]]
if (Config.RANKBAR) then
    local RANKBAR = exports.rdr_menu:RANKBAR()
    Citizen.CreateThread(function()
        RANKBAR.SetText("1")
        RANKBAR.SetHeader("Progression")
        RANKBAR.SetHeaderAlpha(100)
        RANKBAR.SetBarMinimum(0)
        RANKBAR.SetBarMaximum(100)
        RANKBAR.SetBarValue(50)
    end)
end

--[[
##########################################################
##                     LEADERBOARD EXAMPLE              ##
##########################################################
]]
if (Config.LEADERBOARD) then
    local LEADERBOARD = exports.rdr_menu:LEADERBOARD()
    Citizen.CreateThread(function()
        LEADERBOARD.Clear()

        LEADERBOARD.SetHeader("Leaderboard")
        LEADERBOARD.SetHeaderColor(`COLOR_PINK`)
        LEADERBOARD.SetStatTitle(1, "Player")
        LEADERBOARD.SetStatColor(1, `COLOR_WHITE`)
        LEADERBOARD.SetStatTitle(2, "Kills")
        LEADERBOARD.SetStatColor(2, `COLOR_GREEN`)
        LEADERBOARD.SetStatTitle(3, "Deaths")
        LEADERBOARD.SetStatColor(3, `COLOR_RED`)
        LEADERBOARD.SetRoundTitle("Rounds")
        LEADERBOARD.SetRoundColor(`COLOR_BLUE`)
        for i=0, 10 do
            LEADERBOARD.AddRow()
        end
        LEADERBOARD.Open()

        Citizen.Wait(2000)
        LEADERBOARD.Close()
    end)
end

--[[
##########################################################
##                     HONORLEVEL EXAMPLE               ##
##########################################################
]]
if (Config.HONORLEVEL) then
    local HONORLEVEL = exports.rdr_menu:HONORLEVEL()
    Citizen.CreateThread(function()
        HONORLEVEL.SetLevel(5)
        HONORLEVEL.Show()

        Citizen.Wait(2000)
        HONORLEVEL.Hide()
    end)
end

--[[
##########################################################
##                 HELPERTEXTFIELDS EXAMPLE             ##
##########################################################
]]
if (Config.HELPERTEXTFIELDS) then
    local HELPERTEXTFIELDS = exports.rdr_menu:HELPERTEXTFIELDS()
    Citizen.CreateThread(function()
        HELPERTEXTFIELDS.Show()

        for count=1, 50 do
            for i=0, 1 do
                HELPERTEXTFIELDS.SetRawText(i, "Raw " .. i)
                HELPERTEXTFIELDS.SetRawValue(i, "Value " .. count)
            end
            Citizen.Wait(100)
        end

        HELPERTEXTFIELDS.Hide()
    end)
end

if (Config.PASSIVEICON) then
    local PASSIVEICON = exports.rdr_menu:PASSIVEICON()
    Citizen.CreateThread(function()
        PASSIVEICON.SetState(0)
        PASSIVEICON.SetVisiblity(true)

        Citizen.Wait(2000)
        PASSIVEICON.SetState(1)

        Citizen.Wait(2000)
        PASSIVEICON.SetVisiblity(false)
    end)
end