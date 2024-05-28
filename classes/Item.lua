Item = {}
Item.__index = Item

setmetatable(Item, {
    __call = function(cls, ...)
        return cls._construct(...)
    end
})

function Item._construct(list, index, type)
    local self = setmetatable({}, Item)

    self.list = list
    self.index = index
    self.type = type
    self.text = ""
    self.textColor = joaat("COLOR_WHITE")
    self.enabled = true
    self.visible = true
    self.onFocused = nil
    self.onSelected = nil

    return self
end

function Item:init()
    self.data = DatabindingAddDataContainer(self.list, "listItemData" .. tostring(self.index))
    DatabindingAddDataHash(self.data, "dynamic_list_item_event_channel_hash", `PLAYER_MENU`)

    if (self.type == "image") then
        DatabindingInsertUiItemToListFromContextStringAlias(self.list, self.index, "pm_dynamic_large_image_and_stacked_text", self.data)
    else
        DatabindingInsertUiItemToListFromContextStringAlias(self.list, self.index, "pm_dynamic_text_item", self.data)
    end

    self:SetText(self.text)
    self:SetTextColor(self.textColor)
    self:SetEnabled(self.enabled)
    self:SetVisible(self.visible)
    self:SetImgTextureDict(self.textureDict)
    self:SetImgTexture(self.texture)
end

--- Set the item focused callback
---@param cb function
---@return Item
function Item:OnFocused(cb)
    if (cb) then
        self.onFocused = cb
    end

    if (not cb and self.onFocused) then
        self.onFocused()
    end

    return self
end

--- Set the item selected callback
---@param callback function
---@return Item
function Item:OnSelected(cb)
    if (cb) then
        self.onSelected = cb
    end

    if (not cb and self.onSelected) then
        self.onSelected()
    end

    return self
end

--- Set the item text
---@param text string
---@return Item
function Item:SetText(text)
    self.text = text
    if (self.data) then
        DatabindingAddDataString(self.data, "dynamic_list_item_raw_text_entry", self.text)
    end

    return self
end

--- Set the item text color
---@param colorHash number
---@return Item
function Item:SetTextColor(colorHash)
    self.textColor = colorHash
    if (self.data) then 
        DatabindingAddDataHash(self.data, "dynamic_list_item_main_color", self.textColor)
    end

    return self
end

--- Set the item enabled or not
---@param bool boolean
---@return Item
function Item:SetEnabled(bool)
    self.enabled = bool
    if (self.data) then 
        DatabindingAddDataBool(self.data, "dynamic_list_item_enabled", self.enabled)
    end

    return self
end

--- Set the item visible or not
---@param bool boolean
---@return Item
function Item:SetVisible(bool)
    self.visible = bool
    if (self.data) then 
        DatabindingAddDataBool(self.data, "dynamic_list_item_visible", self.visible)
    end

    return self
end

--- Set the item texture dictionary
---@param dict hash
---@return Item
function Item:SetImgTextureDict(dict)
    if (self.type ~= "image") then return self end

    self.textureDict = dict
    if (self.data) then
        DatabindingAddDataHash(self.data, "dynamic_list_item_main_img_texture_dic", self.textureDict)
    end

    return self
end

--- Set the item texture
---@param texture hash
---@return Item
function Item:SetImgTexture(texture)
    if (self.type ~= "image") then return self end

    self.texture = texture
    if (self.data) then
        DatabindingAddDataHash(self.data, "dynamic_list_item_main_img_texture", self.texture)
    end

    return self
end