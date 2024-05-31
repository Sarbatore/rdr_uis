Item = {}
Item.__index = Item

setmetatable(Item, {
    __call = function(cls, ...)
        return cls._construct(...)
    end
})

--- Create a new item
---@param index number
---@param type string
---@return Item
function Item._construct(index, type)
    local self = setmetatable({}, Item)

    self.index = index
    self.type = type
    self.text = ""
    self.textColor = joaat("COLOR_WHITE")
    self.enabled = true
    self.visible = true
    self.onFocused = nil
    self.onSelected = nil

    -- Image item
    self.subtext = nil
    self.subtextColor = joaat("COLOR_WHITE")
    
    self.textureDict = nil
    self.texture = nil
    self.textureColor = nil

    -- Small image item
    self.imgVisible = true

    return self
end

-- Init the item
---@param list hash
function Item:init(list)
    self.list = list
    self.data = DatabindingAddDataContainer(self.list, "listItemData" .. tostring(self.index))
    DatabindingAddDataHash(self.data, "dynamic_list_item_event_channel_hash", `PLAYER_MENU`)

    if (not self.type) then
        DatabindingInsertUiItemToListFromContextStringAlias(self.list, self.index, "pm_dynamic_text_item", self.data)
    elseif(self.type == "imageItem") then
        DatabindingInsertUiItemToListFromContextStringAlias(self.list, self.index, "pm_dynamic_large_image_and_stacked_text", self.data)
    elseif (self.type == "image") then
        DatabindingInsertUiItemToListFromContextStringAlias(self.list, self.index, "pm_dynamic_small_image", self.data)
    elseif (self.type == "smallImageItem") then
        DatabindingInsertUiItemToListFromContextStringAlias(self.list, self.index, "pm_dynamic_posse_entry", self.data)
    elseif (self.type == "slider") then
        --[[local container = DatabindingAddDataContainerFromPath("", "lobby_game_options")
        DatabindingAddDataString(container, "dynamic_list_item_raw_text_entry", "My text") -- 15

        local ah = DatabindingAddHashArray(container, "dynamic_list_item_option_stepper_items")
        local as = DatabindingAddStringArray(container, "dynamic_list_item_option_stepper_items")

        DatabindingAddDataBool(container, "dynamic_list_item_option_stepper_visible", true)
        DatabindingAddDataBool(container, "dynamic_list_item_option_stepper_text_enabled", true)
        --DatabindingAddDataHash(container, "dynamic_list_item_option_stepper_current_hash", 0) -- 33
        DatabindingAddDataInt(container, "dynamic_list_item_option_stepper_current_index", 1)
        DatabindingAddDataInt(container, "dynamic_list_item_option_stepper_max_index", 10) 
        DatabindingAddDataBool(container, "dynamic_list_item_left_chevron_enabled", true)
        DatabindingAddDataBool(container, "dynamic_list_item_right_chevron_enabled", true)
        

        DatabindingAddDataHash(container, "dynamic_list_item_select_hash", 0)]]
    end

    if (self.type ~= nil and self.type ~= "image") then
        DatabindingInsertUiItemToListFromContextStringAlias(self.list, self.index, self.type, self.data)
    end

    self:SetText()
    self:SetTextColor()
    self:SetEnabled()
    self:SetVisible()

    -- Image item
    self:SetSubtext()
    self:SetSubtextColor()

    self:SetImgTextureDict()
    self:SetImgTexture()
    self:SetImgColor()

    -- Small image item
    self:SetImgVisible()
end

--- Set the item focused callback
---@param callback function
---@return Item
function Item:OnFocused(callback)
    if (callback ~= nil) then self.onFocused = callback end

    if (not callback and self.onFocused) then
        self.onFocused()
    end

    return self
end

--- Set the item selected callback
---@param callback function
---@return Item
function Item:OnSelected(callback)
    if (callback ~= nil) then self.onSelected = callback end

    if (not callback and self.onSelected) then
        self.onSelected()
    end

    return self
end

--- Set the item text
---@param text string
---@return Item
function Item:SetText(text)
    if (text ~= nil) then self.text = text end

    if (self.data) then
        DatabindingAddDataString(self.data, "dynamic_list_item_raw_text_entry", self.text)
    end

    return self
end

--- Set the item subtext
---@param text string
---@return Item
function Item:SetSubtext(text)
    if (text ~= nil) then self.subtext = text end

    if (self.data) then
        DatabindingAddDataString(self.data, "dynamic_list_item_secondary_raw_text_entry", self.subtext)
    end

    return self
end

--- Set the item subtext color
---@param color hash
---@return Item
function Item:SetSubtextColor(color)
    if (color ~= nil) then self.subtextColor = color end

    if (self.data) then
        DatabindingAddDataHash(self.data, "dynamic_list_item_secondary_color", self.subtextColor)
    end

    return self
end

--- Set the item text color
---@param color hash
---@return Item
function Item:SetTextColor(color)
    if (color ~= nil) then self.textColor = color end

    if (self.data) then 
        DatabindingAddDataHash(self.data, "dynamic_list_item_main_color", self.textColor)
    end

    return self
end

--- Set the item enabled or not
---@param enabled boolean
---@return Item
function Item:SetEnabled(enabled)
    if (enabled ~= nil) then self.enabled = enabled end

    if (self.data) then 
        DatabindingAddDataBool(self.data, "dynamic_list_item_enabled", self.enabled)
    end

    return self
end

--- Set the item visible or not
---@param visible boolean
---@return Item
function Item:SetVisible(visible)
    if (visible ~= nil) then self.visible = visible end

    if (self.data) then 
        DatabindingAddDataBool(self.data, "dynamic_list_item_visible", self.visible)
    end

    return self
end

--- Set the item texture dictionary
---@param dict hash
---@return Item
function Item:SetImgTextureDict(dict)
    --if (self.type ~= "image") then return self end

    if (dict ~= nil) then self.textureDict = dict end

    if (self.data) then
        DatabindingAddDataHash(self.data, "dynamic_list_item_main_img_texture_dic", self.textureDict)
    end

    return self
end

--- Set the item texture
---@param texture hash
---@return Item
function Item:SetImgTexture(texture)
    --if (self.type ~= "image") then return self end

    if (texture ~= nil) then self.texture = texture end

    if (self.data) then
        DatabindingAddDataHash(self.data, "dynamic_list_item_main_img_texture", self.texture)
        
    end

    return self
end

--- Set the item image color
---@param color hash
---@return Item
function Item:SetImgColor(color)
    --if (self.type ~= "image") then return self end

    if (color ~= nil) then self.textureColor = color end

    if (self.data) then
        if (self.type == "image") then
            DatabindingAddDataHash(self.data, "dynamic_list_item_main_color", self.textureColor)
        else
            DatabindingAddDataHash(self.data, "dynamic_list_item_tertiary_color", self.textureColor)
        end
    end

    return self
end

--- Set the item image visible or not
---@param visible boolean
---@return Item
function Item:SetImgVisible(visible)
    --if (self.type ~= "smallImageItem") then return self end

    if (visible ~= nil) then self.imgVisible = visible end

    if (self.data) then 
        DatabindingAddDataBool(self.data, "dynamic_list_item_main_img_visible", self.imgVisible)
    end

    return self
end