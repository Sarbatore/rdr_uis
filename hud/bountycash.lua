local container = DatabindingAddDataContainerFromPath("", "BountyCash")

LIB.BOUNTYCASH = {}
exports("BOUNTYCASH", function()
    return LIB.BOUNTYCASH
end)

--- Show the bounty cash HUD
---@param visible boolean
LIB.BOUNTYCASH.SetVisiblity = function(visible)
    DatabindingAddDataBool(container, "State", visible)
end
exports("SetBountyCashVisibility", LIB.BOUNTYCASH.SetVisiblity)

--- Set the bounty cash text
---@param text string
LIB.BOUNTYCASH.SetText = function(text)
    DatabindingAddDataString(container, "Text", text)
end
exports("SetBountyCashText", LIB.BOUNTYCASH.SetText)