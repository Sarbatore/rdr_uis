local postMatchAndLeaderboardContainer = DatabindingAddDataContainerFromPath("", "PostMatchAndLeaderboard")
local titleContainer = DatabindingAddDataContainer(postMatchAndLeaderboardContainer, "Title")
local leaderboardList = DatabindingAddUiItemList(postMatchAndLeaderboardContainer, "LeaderboardList")

LIB.LEADERBOARD = {}
exports("LEADERBOARD", function()
	return LIB.LEADERBOARD
end)

--- Open the leaderboard
LIB.LEADERBOARD.Open = function()
    LaunchUiappByHashWithEntry(joaat("LEADERBOARDS"), joaat("LEADERBOARDS"))
end
exports("OpenLeaderboard", LIB.LEADERBOARD.Open)

--- Close the leaderboard
LIB.LEADERBOARD.Close = function()
    CloseUiappByHash(joaat("LEADERBOARDS"))
end
exports("CloseLeaderboard", LIB.LEADERBOARD.Close)

--- Set the leaderboard header
---@param text string
LIB.LEADERBOARD.SetHeader = function(text)
    DatabindingAddDataString(titleContainer, "Heading", text)
end
exports("SetLeaderboardHeader", LIB.LEADERBOARD.SetHeader)

--- Set the leaderboard header color
---@param color number
LIB.LEADERBOARD.SetHeaderColor = function(color)
    DatabindingAddDataInt(titleContainer, "HeadingColor", color)
end
exports("SetLeaderboardHeaderColor", LIB.LEADERBOARD.SetHeaderColor)

--- Set the leaderboard stat title
---@param index number 1-3
---@param text string
LIB.LEADERBOARD.SetStatTitle = function(index, text)
    DatabindingAddDataString(titleContainer, "Stat" ..index, text)
end
exports("SetLeaderboardStatTitle", LIB.LEADERBOARD.SetStatTitle)

--- Set the leaderboard stat color
---@param index number 1-3
---@param color number
LIB.LEADERBOARD.SetStatColor = function(index, color)
    DatabindingAddDataInt(titleContainer, "Stat" ..index.. "Color", color)
end
exports("SetLeaderboardStatColor", LIB.LEADERBOARD.SetStatColor)

--- Set the leaderboard round title
---@param rounds string
LIB.LEADERBOARD.SetRoundTitle = function(rounds)
    DatabindingAddDataString(titleContainer, "StatRounds", rounds)
end
exports("SetLeaderboardRoundTitle", LIB.LEADERBOARD.SetRoundTitle)

--- Set the leaderboard round color
---@param color number
LIB.LEADERBOARD.SetRoundColor = function(color)
    DatabindingAddDataInt(titleContainer, "StatRoundsColor", color)
end
exports("SetLeaderboardRoundColor", LIB.LEADERBOARD.SetRoundColor)

--- Clear the leaderboard raws
LIB.LEADERBOARD.Clear = function()
    DatabindingClearBindingArray(leaderboardList)
end
exports("ClearLeaderboard", LIB.LEADERBOARD.Clear)

LIB.LEADERBOARD.AddRow = function(position, gamertag, gamertagColor, statPriority)
    local leaderboardListItem = DatabindingInsertUiItemToListFromContextStringAlias(leaderboardList, -1, "LeaderboardListItem")

end
exports("AddLeaderboardRow", LIB.LEADERBOARD.AddRow)

--[[

    local playerItem = DatabindingAddDataContainer(l, "MiniListItem_00")
    DatabindingAddDataString(playerItem, "Position", position)
    DatabindingAddDataString(playerItem, "Gamertag", gamertag)
    DatabindingAddDataInt(playerItem, "GamertagColor", gamertagColor)
    DatabindingAddDataString(playerItem, "StatPriority", statPriority)

    local leaderboardRow = DatabindingAddDataContainer(l, "LeaderboardListItem_00")
	DatabindingAddDataInt(leaderboardRow, "Position", 0)
	DatabindingAddDataBool(leaderboardRow, "ShowCross", false)
	DatabindingAddDataHash(leaderboardRow, "CrossColor", joaat("COLOR_RED"))
	DatabindingAddDataString(leaderboardRow, "Gamertag", "")
	DatabindingAddDataInt(leaderboardRow, "GamertagColor", 0)
	DatabindingAddDataBool(leaderboardRow, "ShowCrewTag", true)
	DatabindingAddDataString(leaderboardRow, "CrewTag", "")
	DatabindingAddDataBool(leaderboardRow, "ShowRank", true)
	DatabindingAddDataString(leaderboardRow, "Rank", "0")
	DatabindingAddDataBool(leaderboardRow, "Spectating", false)
	DatabindingAddDataString(leaderboardRow, "Stat0", "")
	DatabindingAddDataString(leaderboardRow, "Stat1", "")
	DatabindingAddDataString(leaderboardRow, "Stat2", "")
	DatabindingAddDataString(leaderboardRow, "Stat3", "")
	DatabindingAddDataBool(leaderboardRow, "ShowBlip", true)
	DatabindingAddDataInt(leaderboardRow, "BlipColor", 0)
	DatabindingAddDataString(leaderboardRow, "Blip", "BLIP_AMBIENT_PED_MEDIUM")
	DatabindingAddDataBool(leaderboardRow, "isHighlighted", false)
	DatabindingAddDataBool(leaderboardRow, "HeadsetIconVisible", false)
	DatabindingAddDataHash(leaderboardRow, "HeadsetIconColor", joaat("COLOR_PURE_WHITE"))
	DatabindingAddDataBool(leaderboardRow, "ShowBlip", true)

	DatabindingAddDataBool(postMatchAndLeaderboardContainer, "info_visible_06", true)
	DatabindingAddDataBool(postMatchAndLeaderboardContainer, "info_visible_07", true)
	DatabindingAddDataBool(postMatchAndLeaderboardContainer, "info_visible_08", true)
	DatabindingAddDataString(postMatchAndLeaderboardContainer, "info_value_06", "aaa")
	DatabindingAddDataString(postMatchAndLeaderboardContainer, "info_value_07", "bbb")
	DatabindingAddDataString(postMatchAndLeaderboardContainer, "info_value_08", "cccc")

	DatabindingAddDataInt(leaderboardRow, "SetOverlayImg", 1)
	DatabindingAddDataBool(leaderboardRow, "ShowOverlay", false)

]]