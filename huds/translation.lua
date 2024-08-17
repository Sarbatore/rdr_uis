local TRANSLATE = {}
TRANSLATE.__index = TRANSLATE

setmetatable(TRANSLATE, {
    __call = function (cls, ...)
        return cls._construct(...)
    end,
})

function TRANSLATE._construct()
    local self = setmetatable({}, TRANSLATE)

    self.content = {}

    return self
end

--- Add a first field to the translation overlay
---@param style number 0: Title, 1: Subtitle, 2: Description
---@param content string
function TRANSLATE:AddFirstField(style, content)
    table.insert(self.content, {field = 0, style = style, content = content})

    return self
end

--- Add a second field to the translation overlay
---@param style number 0: Title, 1: Subtitle, 2: Description
---@param content string
function TRANSLATE:AddSecondField(style, content)
    table.insert(self.content, {field = 2, style = style, content = content})

    return self
end

--- Add a divider to the translation overlay
function TRANSLATE:AddDivider()
    table.insert(self.content, "divider")

    return self
end

function TRANSLATE:Open()
    local translateContainer = DatabindingGetDataContainerFromPath("Translate")
    local catalogueContainer = DatabindingGetDataContainerFromPath("Catalogue")
    DatabindingRemoveDataEntry(translateContainer)
    DatabindingRemoveDataEntry(catalogueContainer)
    translateContainer = DatabindingAddDataContainerFromPath("", "Translate")
    catalogueContainer = DatabindingAddDataContainer(translateContainer, "Catalogue")

    for k, v in pairs(self.content) do
        if (v == "divider") then
            local divider = DatabindingAddDataContainer(catalogueContainer, "divider"..k-1)
            DatabindingAddDataBool(divider, "isVisible", true)
        else
            local textField = DatabindingAddDataContainer(catalogueContainer, "textField"..v.field) -- Workable textFields are 0 and 2
            DatabindingAddDataString(textField, "text", v.content)
            DatabindingAddDataInt(textField, "style", v.style)
        end
    end

    LaunchAppByHashWithEntry(joaat("TRANSLATION_OVERLAY"), joaat("CATALOGUE"))
end

function TRANSLATE:Close()
    CloseAppByHash(joaat("TRANSLATION_OVERLAY"))
end

--[[

local TRANSLATE = TRANSLATE()
    :AddFirstField(0, "My title")
    :AddSecondField(2, "Some text here")
    :AddDivider()
TRANSLATE:Open()

]]