Item = {}
Item.__index = Item

setmetatable(Item, {
    __call = function(cls, ...)
        return cls._construct(...)
    end
})

function Item._construct(list, index, type)
    local self = setmetatable({}, Item)

    self.data = DatabindingAddDataContainer(list, "listItemData" .. tostring(index))
    self.type = type
    
    if (type == "image") then
        DatabindingInsertUiItemToListFromContextStringAlias(list, index, "pm_dynamic_large_image_and_stacked_text", self.data)
    else
        DatabindingInsertUiItemToListFromContextStringAlias(list, index, "pm_dynamic_text_item", self.data)
    end

    return self
end

--- Set the item text
---@param text string
---@return Item
function Item:SetText(text)
    DatabindingAddDataString(self.data, "dynamic_list_item_raw_text_entry", text)

    return self
end

--- Set the item text color
---@param colorHash number
---@return Item
function Item:SetTextColor(colorHash)
    DatabindingAddDataHash(self.data, "dynamic_list_item_main_color", colorHash)

    return self
end

--- Set the item enabled or not
---@param bool boolean
---@return Item
function Item:SetEnabled(bool)
    DatabindingAddDataBool(self.data, "dynamic_list_item_enabled", bool)

    return self
end

--- Set the item visible or not
---@param bool boolean
---@return Item
function Item:SetVisible(bool)
    DatabindingAddDataBool(self.data, "dynamic_list_item_visible", bool)

    return self
end


-- Image Type

--- Set the item texture dictionary
---@param dict hash
---@return Item
function Item:SetImgTextureDict(dict)
    if (self.type ~= "image") then return self end
    DatabindingAddDataHash(self.data, "dynamic_list_item_main_img_texture_dic", dict)

    return self
end

--- Set the item texture
---@param texture hash
---@return Item
function Item:SetImgTexture(texture)
    if (self.type ~= "image") then return self end

    DatabindingAddDataHash(self.data, "dynamic_list_item_main_img_texture", texture)

    return self
end