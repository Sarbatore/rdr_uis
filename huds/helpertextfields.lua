local helperTextfieldsContainer = DatabindingAddDataContainerFromPath("", "helperTextfields")

LIB.HELPERTEXTFIELDS = {}
exports("HELPERTEXTFIELDS", function()
    return LIB.HELPERTEXTFIELDS
end)

--- Show the helper text fields HUD
LIB.HELPERTEXTFIELDS.Show = function()
    EnableHudContext(-66088566)
end
exports("ShowHelperTextFields", LIB.HELPERTEXTFIELDS.Show)

--- Hide the helper text fields HUD
LIB.HELPERTEXTFIELDS.Hide = function()
    DisableHudContext(-66088566)
end
exports("HideHelperTextFields", LIB.HELPERTEXTFIELDS.Hide)

--- Set the text for the raw
---@param raw number from 0 to 1
---@param text string
LIB.HELPERTEXTFIELDS.SetRawText = function(raw, text)
    DatabindingAddDataString(helperTextfieldsContainer, "rawLabel" .. raw, text)
end
exports("SetRawText", LIB.HELPERTEXTFIELDS.SetRawText)

--- Set the value for the raw
---@param raw number from 0 to 1
---@param value string
LIB.HELPERTEXTFIELDS.SetRawValue = function(raw, value)
    DatabindingAddDataString(helperTextfieldsContainer, "rawValue" .. raw, value)
end
exports("SetRawValue", LIB.HELPERTEXTFIELDS.SetRawValue)