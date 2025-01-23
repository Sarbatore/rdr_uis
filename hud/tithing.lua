local tithingContainer = DatabindingAddDataContainerFromPath("", "Tithing")

LIB.TITHING = {}
exports("TITHING", function()
    return LIB.TITHING
end)

--- Show the tithing HUD
LIB.TITHING.Show = function()
    EnableHudContext(1670279562)
end
exports("ShowTithing", LIB.TITHING.Show)

--- Hide the tithing HUD
LIB.TITHING.Hide = function()
    DisableHudContext(1670279562)
end
exports("HideTithing", LIB.TITHING.Hide)

--- Set the tithing text
---@param text string
LIB.TITHING.SetText = function(text)
    DatabindingAddDataString(tithingContainer, "Supplies", text)
end
exports("SetTithingText", LIB.SetText)

--- Set the tithing camp funds
---@param dollars number
---@param cents number
LIB.TITHING.SetCampFunds = function(dollars, cents)
    local campCashContainer = DatabindingAddDataContainer(tithingContainer, "CampFunds")
    DatabindingAddDataInt(campCashContainer, "dollars", dollars)
    DatabindingAddDataInt(campCashContainer, "cents", cents)
end
exports("SetTithingCampFunds", LIB.SetCampFunds)

--- Set the tithing player cash
---@param dollars number
---@param cents number
LIB.TITHING.SetPlayerCash = function(dollars, cents)
    local cashContainer = DatabindingAddDataContainer(tithingContainer, "PlayerCash")
    DatabindingAddDataInt(cashContainer, "dollars", dollars)
    DatabindingAddDataInt(cashContainer, "cents", cents)
end
exports("SetTithingPlayerCash", LIB.SetPlayerCash)