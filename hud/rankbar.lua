local rankbarContainer = DatabindingAddDataContainerFromPath("", "mp_rank_bar")

LIB.RANKBAR = {}
exports("RANKBAR", function() 
    return LIB.RANKBAR
end)

--- Set the rank bar text
---@param text string
LIB.RANKBAR.SetText = function(text)
    DatabindingAddDataString(rankbarContainer, "rank_text", text)
end
exports("SetRankBarText", LIB.RANKBAR.SetText)

--- Set the rank bar header text
---@param text string
LIB.RANKBAR.SetHeader = function(text)
    DatabindingAddDataString(rankbarContainer, "rank_header_text", text)
end
exports("SetRankBarHeader", LIB.RANKBAR.SetHeader)

--- Set the rank bar header alpha
---@param alpha number 0-100
LIB.RANKBAR.SetHeaderAlpha = function(alpha)
    DatabindingAddDataInt(rankbarContainer, "rank_header_text_alpha", alpha)
end
exports("SetRankBarHeaderAlpha", LIB.RANKBAR.SetHeaderAlpha)

--- Set the rank bar minimum value
---@param min number
LIB.RANKBAR.SetBarMinimum = function(min)
    DatabindingAddDataInt(rankbarContainer, "xp_bar_minimum", min)
end
exports("SetRankBarMinimum", LIB.RANKBAR.SetBarMinimum)

--- Set the rank bar maximum value
---@param max number
LIB.RANKBAR.SetBarMaximum = function(max)
    DatabindingAddDataInt(rankbarContainer, "xp_bar_maximum", max)
end
exports("SetRankBarMaximum", LIB.RANKBAR.SetBarMaximum)

--- Set the rank bar value
---@param value number
LIB.RANKBAR.SetBarValue = function(value)
    DatabindingAddDataInt(rankbarContainer, "xp_bar_value", value)
end
exports("SetRankBarValue", LIB.RANKBAR.SetBarValue)