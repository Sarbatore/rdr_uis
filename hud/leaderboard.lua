--@todo: Finish this file

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