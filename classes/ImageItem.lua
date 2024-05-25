ImageItem = {}
ImageItem.__index = ImageItem

setmetatable(ImageItem, {
    __call = function(cls, ...)
        return cls._construct(...)
    end
})

function ImageItem._construct(list, index)
    local self = setmetatable({}, ImageItem)

    self.data = DatabindingAddDataContainer(list, "listItemData" .. tostring(index))
    
    DatabindingInsertUiItemToListFromContextStringAlias(list, index, "pm_dynamic_large_image_and_stacked_text", self.data)

    return self
end

--- Set the item texture dictionary
---@param dict hash
---@return ImageItem
function ImageItem:SetImgTextureDict(dict)
    DatabindingAddDataHash(self.data, "dynamic_list_item_main_img_texture_dic", dict)

    return self
end

--- Set the item texture
---@param texture hash
---@return ImageItem
function ImageItem:SetImgTexture(texture)
    DatabindingAddDataHash(self.data, "dynamic_list_item_main_img_texture", texture)

    return self
end

--- Set the item text
---@param text string
---@return ImageItem
function ImageItem:SetText(text)
    DatabindingAddDataString(self.data, "dynamic_list_item_raw_text_entry", text)

    return self
end

--- Set the item text color
---@param colorHash number
---@return ImageItem
function ImageItem:SetTextColor(colorHash)
    DatabindingAddDataHash(self.data, "dynamic_list_item_main_color", colorHash)

    return self
end

--- Set the item enabled or not
---@param bool boolean
---@return ImageItem
function ImageItem:SetEnabled(bool)
    DatabindingAddDataBool(self.data, "dynamic_list_item_enabled", bool)

    return self
end

--- Set the item visible or not
---@param bool boolean
---@return ImageItem
function ImageItem:SetVisible(bool)
    DatabindingAddDataBool(self.data, "dynamic_list_item_visible", bool)

    return self
end