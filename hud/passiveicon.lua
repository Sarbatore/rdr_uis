local container = DatabindingAddDataContainerFromPath("", "PassiveIcon")

LIB.PASSIVEICON = {}
exports("PASSIVEICON", function()
    return LIB.PASSIVEICON
end)

--- Set the visibility of the passive icon
---@param visible boolean
LIB.PASSIVEICON.SetVisiblity = function(visible)
    DatabindingAddDataBool(container, "isVisible", visible)
end
exports("SetVisiblity", LIB.PASSIVEICON.SetVisiblity)

--- Set the state of the passive icon
---@param state number
LIB.PASSIVEICON.SetState = function(state)
    DatabindingAddDataInt(passiveIcon, "setState", state)
end
exports("SetState", LIB.PASSIVEICON.SetState)