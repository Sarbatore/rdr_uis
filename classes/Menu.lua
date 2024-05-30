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

    self:SetHeader("")
    self:SetSubheader("")
    self:SetFooter("")
    
    self.items = {}

    Citizen.CreateThread(function()
        while IsUiappRunningByHash(joaat("PLAYER_MENU")) == 1 do
            while EventsUiIsPending(joaat("PLAYER_MENU")) do
                local msg = DataView.ArrayBuffer(8 * 4)
                msg:SetInt32(0, 0)
                msg:SetInt32(8, 0)
                msg:SetInt32(16, 0)
                msg:SetInt32(24, 0) -- item data container
    
                if (Citizen.InvokeNative(0x90237103F27F7937, joaat("PLAYER_MENU"), msg:Buffer()) ~= 0) then -- EVENTS_UI_PEEK_MESSAGE
                    -- Item focused
                    if msg:GetInt32(0) == `ITEM_FOCUSED` then
                        for k, v in ipairs(self.items) do
                            if (msg:GetInt32(24) == v.data) then
                                v:OnFocused()
                                break
                            end
                        end
                    end

                    -- Item selected
                    if msg:GetInt32(0) == `ITEM_SELECTED` then
                        for k, v in ipairs(self.items) do
                            if (msg:GetInt32(24) == v.data) then
                                -- Check if the item is enabled
                                if (DatabindingReadDataBool(v.data, "dynamic_list_item_enabled")) then
                                    v:OnSelected()
                                end
                                break
                            end
                        end
                    end
                end
    
                EventsUiPopMessage(joaat("PLAYER_MENU"))
            end
            Citizen.Wait(0)
        end
    end)

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
function Menu:SetSubheader(text)
    AddTextEntryByHash(joaat("ANIMAL_SIGHTINGS_SUBH"), text)

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
    local item = Item(self.listItems, #self.items+1, self.type)
        :SetText(text)

    table.insert(self.items, item)

    return item
end

--- Remove an item from the menu
---@param entryId
---@return self
function Menu:RemoveItem(item)
    for k, v in pairs(self.items) do
        if (v.data == item.data) then
            table.remove(self.items, k)
            DatabindingRemoveBindingArrayItemByDataContextId(self.listItems, v.data)
            break
        end
    end

    return self
end

--- Get an item by index
---@param index
---@return Item
function Menu:GetItem(index)
    return self.items[index]
end

--- Get an item entry id by index
---@param index
---@return entryId
function Menu:GetItemEntryId(index)
    return DatabindingGetItemContextByIndex(self.listItems, index)
end

--- Get all items
---@return Items
function Menu:GetItems()
    return self.items
end

-- Get all items entry id
---@return entriesId
function Menu:GetItemsEntryId()
    local entriesId = {}
    for i=1, #self.items do
        table.insert(entriesId, self.items[i].data)
    end

    return entriesId
end

--- Open the menu
---@return self
function Menu:Open()
    DatabindingClearBindingArray(self.listItems)

    for _, item in ipairs(self.items) do
        item:init()
    end

    LaunchUiappByHashWithEntry(joaat("PLAYER_MENU"), -464479041)

    return self
end

--- Close the menu
---@return self
function Menu:Close()
    CloseUiapp("player_menu")

    return self
end