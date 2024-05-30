local menuData = DatabindingAddDataContainerFromPath("", "player_menu_data")
local itemsList = DatabindingAddUiItemList(DatabindingAddDataContainerFromPath("", "AnimalSightingMissions"), "listItems")
AddTextEntryByHash(-179955176, "") -- ANIMAL_SIGHTINGS_SUBH

local currentMenu = nil

Menu = {}
Menu.__index = Menu

setmetatable(Menu, {
    __call = function(cls, ...)
        return cls._construct(...)
    end
})

--- Create a new menu
---@return Menu
function Menu._construct(header)
    local self = setmetatable({}, Menu)

    self.header = header
    self.subheader = ""
    self.footer = ""
    self.footerColor = joaat("COLOR_WHITE")
    self.isOpened = false
    
    self.items = {}

    return self
end

--- Set the header text of the menu
---@param text string
---@return Menu
function Menu:SetHeader(text)
    self.header = text
    if (self.isOpened) then
        DatabindingAddDataString(menuData, "header_text", text)
    end

    return self
end

--- Set the subheader text of the menu
---@param text string
---@return Menu
function Menu:SetSubheader(text)
    self.subheader = text
    if (self.isOpened) then
        AddTextEntryByHash(-179955176, text)
    end

    return self
end

--- Set the footer text of the menu
---@param text string
---@return Menu
function Menu:SetFooter(text)
    self.footer = text
    if (self.isOpened) then
        DatabindingAddDataString(menuData, "footer_tooltip_text", text)
    end

    return self
end

--- Set the color of the footer text
---@param color hash
---@return Menu
function Menu:SetFooterColor(color)
    self.footerColor = color
    if (self.isOpened) then
        DatabindingAddDataHash(menuData, "footer_tooltip_color", color)
    end

    return self
end

--- Add an item to the menu
---@param text string
---@return Item
function Menu:AddItem(text)
    local item = Item(#self.items+1)
        :SetText(text)

    table.insert(self.items, item)

    return item
end

--- Add an image item to the menu
---@param text string
---@param imgDict hash
---@param imgTexture hash
---@return Item
function Menu:AddImageItem(text, imgDict, imgTexture)
    local item = Item(#self.items+1, "image")
        :SetText(text)
        :SetImgTextureDict(imgDict)
        :SetImgTexture(imgTexture)

    table.insert(self.items, item)

    return item
end

--- Remove an item from the menu
---@param item Item
---@return Menu
function Menu:RemoveItem(item)
    for k, v in pairs(self.items) do
        if (v.data == item.data) then
            table.remove(self.items, k)
            DatabindingRemoveBindingArrayItemByDataContextId(itemsList, v.data)
            break
        end
    end

    return self
end

--- Get an item by index
---@param index integer
---@return [Item]
function Menu:GetItem(index)
    return self.items[index]
end

--- Get an item entry id by index
---@param index integer
---@return entryId
function Menu:GetItemEntryId(index)
    return DatabindingGetItemContextByIndex(itemsList, index)
end

--- Get all items
---@return [Item]
function Menu:GetItems()
    return self.items
end

-- Get all items entry id
---@return [entryId]
function Menu:GetItemsEntryId()
    local entriesId = {}
    for i=1, #self.items do
        table.insert(entriesId, self.items[i].data)
    end

    return entriesId
end

--- Open the menu
---@return Menu
function Menu:Open()
    if (currentMenu) then
        currentMenu.isOpened = false
    end
    currentMenu = self

    self.isOpened = true
    DatabindingClearBindingArray(itemsList)

    self:SetHeader(self.header)
    self:SetSubheader(self.subheader)
    self:SetFooter(self.footer)
    self:SetFooterColor(self.footerColor)

    for _, item in ipairs(self.items) do
        item:init(itemsList)
    end

    LaunchUiappByHashWithEntry(joaat("PLAYER_MENU"), -464479041)

    Citizen.CreateThread(function()
        while IsUiappRunningByHash(joaat("PLAYER_MENU")) == 1 do
            while EventsUiIsPending(joaat("PLAYER_MENU")) do
                local msg = DataView.ArrayBuffer(8 * 4)
                msg:SetInt32(0, 0) -- Event type
                msg:SetInt32(8, 0)
                msg:SetInt32(16, 0)
                msg:SetInt32(24, 0) -- Item data container
    
                if (Citizen.InvokeNative(0x90237103F27F7937, joaat("PLAYER_MENU"), msg:Buffer()) ~= 0) then -- EVENTS_UI_PEEK_MESSAGE
                    -- Item focused
                    if msg:GetInt32(0) == `ITEM_FOCUSED` then
                        for k, v in ipairs(currentMenu.items) do
                            if (msg:GetInt32(24) == v.data) then
                                v:OnFocused()
                                break
                            end
                        end
                    end

                    -- Item selected
                    if msg:GetInt32(0) == `ITEM_SELECTED` then
                        for k, v in ipairs(currentMenu.items) do
                            if (msg:GetInt32(24) == v.data) then
                                -- Check if the item is enabled
                                if (DatabindingReadDataBool(v.data, "dynamic_list_item_enabled")) then
                                    v:OnSelected()
                                end
                                break
                            end
                        end
                    end

                    -- Menu closed
                    if (msg:GetInt32(0) == -1203660660) then
                        
                    end
                end
    
                EventsUiPopMessage(joaat("PLAYER_MENU"))
            end
            Citizen.Wait(0)
        end
    end)

    return self
end

--- Close the menu
---@return Menu
function Menu:Close()
    CloseUiapp("player_menu")

    return self
end



-------------------------------
--           DATAVIEW        --
-------------------------------
DataView = setmetatable({
    EndBig = ">",
    EndLittle = "<",
    Types = {
        Int8 = { code = "i1" },
        Uint8 = { code = "I1" },
        Int16 = { code = "i2" },
        Uint16 = { code = "I2" },
        Int32 = { code = "i4" },
        Uint32 = { code = "I4" },
        Int64 = { code = "i8" },
        Uint64 = { code = "I8" },
        Float32 = { code = "f", size = 4 }, -- a float (native size)
        Float64 = { code = "d", size = 8 }, -- a double (native size)

        LuaInt = { code = "j" }, -- a lua_Integer
        UluaInt = { code = "J" }, -- a lua_Unsigned
        LuaNum = { code = "n" }, -- a lua_Number
        String = { code = "z", size = -1, }, -- zero terminated string
    },

    FixedTypes = {
        String = { code = "c" }, -- a fixed-sized string with n bytes
        Int = { code = "i" }, -- a signed int with n bytes
        Uint = { code = "I" }, -- an unsigned int with n bytes
    },
}, {
    __call = function(_, length)
        return DataView.ArrayBuffer(length)
    end
})
DataView.__index = DataView

--[[ Create an ArrayBuffer with a size in bytes --]]
function DataView.ArrayBuffer(length)
    return setmetatable({
        blob = string.blob(length),
        length = length,
        offset = 1,
        cangrow = true,
    }, DataView)
end

--[[ Wrap a non-internalized string --]]
function DataView.Wrap(blob)
    return setmetatable({
        blob = blob,
        length = blob:len(),
        offset = 1,
        cangrow = true,
    }, DataView)
end

--[[ Return the underlying bytebuffer --]]
function DataView:Buffer() return self.blob end
function DataView:ByteLength() return self.length end
function DataView:ByteOffset() return self.offset end
function DataView:SubView(offset, length)
    return setmetatable({
        blob = self.blob,
        length = length or self.length,
        offset = 1 + offset,
        cangrow = false,
    }, DataView)
end

--[[ Return the Endianness format character --]]
local function ef(big) return (big and DataView.EndBig) or DataView.EndLittle end

--[[ Helper function for setting fixed datatypes within a buffer --]]
local function packblob(self, offset, value, code)
    -- If cangrow is false the dataview represents a subview, i.e., a subset
    -- of some other string view. Ensure the references are the same before
    -- updating the subview
    local packed = self.blob:blob_pack(offset, code, value)
    if self.cangrow or packed == self.blob then
        self.blob = packed
        self.length = packed:len()
        return true
    else
        return false
    end
end

--[[
    Create the API by using DataView.Types
--]]
for label,datatype in pairs(DataView.Types) do
    if not datatype.size then  -- cache fixed encoding size
        datatype.size = string.packsize(datatype.code)
    elseif datatype.size >= 0 and string.packsize(datatype.code) ~= datatype.size then
        local msg = "Pack size of %s (%d) does not match cached length: (%d)"
        error(msg:format(label, string.packsize(datatype.code), datatype.size))
        return nil
    end

    DataView["Get" .. label] = function(self, offset, endian)
        offset = offset or 0
        if offset >= 0 then
            local o = self.offset + offset
            local v,_ = self.blob:blob_unpack(o, ef(endian) .. datatype.code)
            return v
        end
        return nil
    end

    DataView["Set" .. label] = function(self, offset, value, endian)
        if offset >= 0 and value then
            local o = self.offset + offset
            local v_size = (datatype.size < 0 and value:len()) or datatype.size
            if self.cangrow or ((o + (v_size - 1)) <= self.length) then
                if not packblob(self, o, value, ef(endian) .. datatype.code) then
                    error("cannot grow subview")
                end
            else
                error("cannot grow dataview")
            end
        end
        return self
    end
end

for label,datatype in pairs(DataView.FixedTypes) do
    datatype.size = -1 -- Ensure cached encoding size is invalidated

    DataView["GetFixed" .. label] = function(self, offset, typelen, endian)
        if offset >= 0 then
            local o = self.offset + offset
            if (o + (typelen - 1)) <= self.length then
                local code = ef(endian) .. "c" .. tostring(typelen)
                local v,_ = self.blob:blob_unpack(o, code)
                return v
            end
        end
        return nil -- Out of bounds
    end

    DataView["SetFixed" .. label] = function(self, offset, typelen, value, endian)
        if offset >= 0 and value then
            local o = self.offset + offset
            if self.cangrow or ((o + (typelen - 1)) <= self.length) then
                local code = ef(endian) .. "c" .. tostring(typelen)
                if not packblob(self, o, value, code) then
                    error("cannot grow subview")
                end
            else
                error("cannot grow dataview")
            end
        end
        return self
    end
end