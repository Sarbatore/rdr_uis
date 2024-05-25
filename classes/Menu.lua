Menu = {}
Menu.__index = Menu

setmetatable(Menu, {
    __call = function(cls, ...)
        return cls._construct(...)
    end
})

--- Create a new menu
---@param headerText
---@return self
function Menu._construct(type)
    local self = setmetatable({}, Menu)

    self.type = type
    self.root = DatabindingAddDataContainerFromPath("", "player_menu_data")

    self.itemList = DatabindingAddDataContainerFromPath("", "AnimalSightingMissions")
    self.listItems = DatabindingAddUiItemList(self.itemList, "listItems")
    
    self.items = {}

    return self
end

--- Set the header text of the menu
---@param text
---@return self
function Menu:SetHeader(text)
    self.header = DatabindingAddDataString(self.root, "header_text", text)

    return self
end

--- Set the subheader text of the menu
---@param text
---@return self
function Menu:SetSubheaderText(text)
    self.subheader = DatabindingAddDataString(self.root, "sub_header_text", text) -- THIS DOESNT WORK NEED TO FIND THE CORRECT

    return self
end

--- Set the footer text of the menu
---@param text
---@return self
function Menu:SetFooter(text)
    self.footer = DatabindingAddDataString(self.root, "footer_tooltip_text", text)

    return self
end

--- Set the color of the footer text
---@param colorHash
---@return self
function Menu:SetFooterColor(colorHash)
    self.footerColor = DatabindingAddDataHash(self.root, "footer_tooltip_color", colorHash)

    return self
end

--- Add an item to the menu
---@param text
---@return Item
function Menu:AddItem(text)
    table.insert(self.items, text)

    DatabindingClearBindingArray(self.listItems)

    local newItem = nil
    for i=1, #self.items do
        local item = nil

        if (self.type == "image") then
            item = ImageItem(self.listItems, i)
        else
            item = Item(self.listItems, i)
        end
        
        item:SetText(self.items[i])

        if (i == #self.items) then
            newItem = item
        end
    end

    return newItem
end

--- Add an image item to the menu
---@param text
---@return ImageItem
function Menu:AddImageItem(text)
    table.insert(self.items, text)

    DatabindingClearBindingArray(self.listItems)

    local newItem = nil
    for i=1, #self.items do
        local item = ImageItem(self.listItems, i)
            :SetText(self.items[i])

        if (i == #self.items) then
            newItem = item
        end
    end

    return newItem
end

--- Remove an item from the menu
---@param entryId
---@return self
function Menu:RemoveItem(entryId)
    table.remove(self.items, index)

    DatabindingRemoveBindingArrayItemByDataContextId(self.listItems, entryId)

    return self
end

--- Get an item by index
---@param index
---@return entryId
function Menu:GetItem(index)
    return DatabindingGetItemContextByIndex(self.listItems, index)
end

--- Get all items
---@return entriesId
function Menu:GetItems()
    local entriesId = {}
    for i=1, #self.items do
        table.insert(entriesId, DatabindingGetItemContextByIndex(self.listItems, i))
    end

    return entriesId
end

--- Open the menu
---@return self
function Menu:Open()
    CloseAllUiapps()
    LaunchUiappByHashWithEntry(joaat("PLAYER_MENU"), -464479041)

    return self
end

--- Close the menu
---@return self
function Menu:Close()
    CloseUiapp("player_menu")

    return self
end