LIB.HONORLEVEL = {}
exports("HONORLEVEL", function()
    return LIB.HONORLEVEL
end)

--- Show the honor level HUD
LIB.HONORLEVEL.Show = function()
    EnableHudContext(121713391)
end
exports("ShowHonorLevel", LIB.HONORLEVEL.Show)

--- Hide the honor level HUD
LIB.HONORLEVEL.Hide = function()
    DisableHudContext(121713391)
end
exports("HideHonorLevel", LIB.HONORLEVEL.Hide)

--- Set the honor level icon on the HUD
---@param level number from 1 to 16
LIB.HONORLEVEL.SetLevel = function(level)
    local RPGStatusIconsContainer = DatabindingAddDataContainerFromPath("", "RPGStatusIcons")
    local honorIconData = DatabindingAddDataContainer(RPGStatusIconsContainer, "HonorIcon")
    DatabindingAddDataInt(honorIconData, "State", level)
end
exports("SetHonorLevel", LIB.HONORLEVEL.SetLevel)