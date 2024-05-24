--[[
    THESE HAVE BEEN IMPLEMENTED

    DatabindingAddDataBool(self.data, "dynamic_list_item_enabled", true) -- 0
    DatabindingAddDataBool(self.data, "dynamic_list_item_visible", true) -- 1
    DatabindingAddDataHash(self.data, "dynamic_list_item_main_color", joaat("COLOR_RED")) -- 2

    DatabindingAddDataString(self.data, "dynamic_list_item_raw_text_entry", "My text") -- 15
]]

    
--[[
    THESE HAVE NOT BEEN IMPLEMENTED, need to search how it works

    DatabindingAddDataHash(self.data, "dynamic_list_item_secondary_color", hash) -- 3
    DatabindingAddDataHash(self.data, "dynamic_list_item_tertiary_color", hash) -- 4
    DatabindingAddDataHash(self.data, "dynamic_list_item_event_channel_hash", hash) -- 5
    DatabindingAddDataHash(self.data, "dynamic_list_item_main_img_texture_dic", hash) -- 6
    DatabindingAddDataHash(self.data, "dynamic_list_item_main_img_texture", hash) -- 7
    DatabindingAddDataBool(self.data, "dynamic_list_item_main_img_visible", true) -- 8
    DatabindingAddDataBool(self.data, "dynamic_list_item_main_img_enabled", true) -- 9
    DatabindingAddDataHash(self.data, "dynamic_list_item_status_icon_texture_dic", hash) -- 10
    DatabindingAddDataHash(self.data, "dynamic_list_item_status_icon_texture", hash) -- 11
    DatabindingAddDataBool(self.data, "dynamic_list_item_status_icon_visible", true) -- 12
    DatabindingAddDataHash(self.data, "dynamic_list_item_deco_texture_dic", hash) -- 13
    DatabindingAddDataHash(self.data, "dynamic_list_item_deco__texture", hash) -- 14
    DatabindingAddDataString(self.data, "dynamic_list_item_text_label_entry", "") -- 16
    DatabindingAddDataString(self.data, "dynamic_list_item_secondary_raw_text_entry", text) -- 17
    DatabindingAddDataString(self.data, "dynamic_list_item_secondary_text_label_entry", "") -- 18
    DatabindingAddDataBool(self.data, "dynamic_list_item_secondary_text_visible", true) -- 19
    DatabindingAddDataBool(self.data, "dynamic_list_item_secondary_text_enabled", true) -- 20
    DatabindingAddDataHash(self.data, "dynamic_list_item_end_img_texture_dic", hash) -- 21
    DatabindingAddDataHash(self.data, "dynamic_list_item_end_img_texture", hash) -- 22
    DatabindingAddDataBool(self.data, "dynamic_list_item_end_img_visible", true) -- 23
    DatabindingAddDataHash(self.data, "dynamic_list_item_corner_end_img_texture_dic", hash) -- 24
    DatabindingAddDataHash(self.data, "dynamic_list_item_corner_end_img_texture", hash) -- 25
    DatabindingAddDataBool(self.data, "dynamic_list_item_corner_end_img_visible", true) -- 26
    DatabindingAddDataInt(self.data, "dynamic_list_item_entry_player_index", 0) -- 27
    DatabindingAddDataInt(self.data, "dynamic_list_item_entry_friend_index", 0) -- 28

    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_player_gamer_handle", VALUETYPETOFIND) -- 29
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_option_stepper_visible", VALUETYPETOFIND) -- 30
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_option_stepper_text_enabled", VALUETYPETOFIND) -- 31
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_option_stepper_items", VALUETYPETOFIND) -- 32
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_option_stepper_current_hash", VALUETYPETOFIND) -- 33
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_option_stepper_current_index", VALUETYPETOFIND) -- 34
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_option_stepper_max_index", VALUETYPETOFIND) -- 35
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_left_chevron_enabled", VALUETYPETOFIND) -- 36
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_right_chevron_enabled", VALUETYPETOFIND) -- 37
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_option_stepper_index_change_ui_event_hash", VALUETYPETOFIND) -- 38
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_main_fill_maximum", VALUETYPETOFIND) -- 39
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_main_fill_value", VALUETYPETOFIND) -- 40
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_text_field_entry_one_raw_text", VALUETYPETOFIND) -- 41
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_text_field_entry_two_raw_text", VALUETYPETOFIND) -- 42
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_text_field_entry_three_raw_text", VALUETYPETOFIND) -- 43
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_text_field_entry_one_visibility", VALUETYPETOFIND) -- 44
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_text_field_entry_two_visibility", VALUETYPETOFIND) -- 45
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_text_field_entry_three_visibility", VALUETYPETOFIND) -- 46
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_img_texture_one_dic", VALUETYPETOFIND) -- 47
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_img_one_texture", VALUETYPETOFIND) -- 48
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_img_one_visible", VALUETYPETOFIND) -- 49
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_int_field_one_value", VALUETYPETOFIND) -- 50
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_int_field_two_value", VALUETYPETOFIND) -- 51
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_vector_field_one_value", VALUETYPETOFIND) -- 52
    DatabindingAddDataXXXXX(self.data, "dynamic_list_item_extra_bool_field_one_value", VALUETYPETOFIND) -- 53

    DatabindingAddDataHash(self.data, "dynamic_list_item_link", hash) -- 54
    DatabindingAddDataHash(self.data, "dynamic_list_item_event_channel_hash", hash) -- 55
    DatabindingAddDataHash(self.data, "dynamic_list_item_focus_hash", hash) -- 56
    DatabindingAddDataHash(self.data, "dynamic_list_item_select_hash", hash) -- 57
    DatabindingAddDataHash(self.data, "dynamic_list_item_prompt_text", hash) -- 58
    DatabindingAddDataBool(self.data, "dynamic_list_item_prompt_enabled", true) -- 59
    DatabindingAddDataBool(self.data, "dynamic_list_item_prompt_visible", true) -- 60
    DatabindingAddDataHash(self.data, "dynamic_list_item_prompt_option_text", hash) -- 64
    DatabindingAddDataBool(self.data, "dynamic_list_item_prompt_option_enabled", true) -- 65
    DatabindingAddDataBool(self.data, "dynamic_list_item_prompt_option_visible", true) -- 66
    DatabindingAddDataHash(self.data, "dynamic_list_item_prompt_option_select_hash", hash) -- 67
]]

Item = {}
Item.__index = Item

setmetatable(Item, {
    __call = function(cls, ...)
        return cls._construct(...)
    end
})

function Item._construct(list, index)
    local self = setmetatable({}, Item)

    self.data = DatabindingAddDataContainer(list, "listItemData" .. tostring(index))
    
    DatabindingInsertUiItemToListFromContextStringAlias(list, index, "pm_dynamic_text_item", self.data)

    return self
end

--- Set the item text
---@param text string
---@return Item
function Item:SetText(text)
    DatabindingAddDataString(self.data, "dynamic_list_item_raw_text_entry", text)

    return self
end

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

--- Set the item text color
---@param colorHash number
---@return Item
function Item:SetTextColor(colorHash)
    DatabindingAddDataHash(self.data, "dynamic_list_item_main_color", colorHash)

    return self
end