function OpenMenu(type)
	-- Create the menu
	local menu = Menu(type)
		:SetHeader("Main Menu")
		:SetSubheader("The first menu")
		:SetFooter("Footer")
		:SetFooterColor(joaat("COLOR_GREEN"))
		
	-- Add items
	local item1 = menu:AddItem("Item 1")
		:SetEnabled(false)
		:SetTextColor(joaat("COLOR_RED"))
		:OnFocused(function()
			menu:SetFooter("Item 1 focused")
		end)
		:OnSelected(function()
			menu:SetHeader("Item 1 selected")
		end)

	local item2 = menu:AddItem("Item 2")
		:SetTextColor(joaat("COLOR_GREEN"))
		:OnFocused(function()
			menu:SetFooter("Item 2 focused")
		end)
		:OnSelected(function()
			menu:SetHeader("Item 2 selected")
		end)
	
	local item3 = menu:AddItem("Item 3")
		:SetTextColor(joaat("COLOR_YELLOW"))
		:OnFocused(function()
			menu:SetFooter("Item 3 focused")
		end)
		:OnSelected(function()
			menu:SetHeader("Item 3 selected")
		end)
	
	local item4 = menu:AddItem("Item 4")
		:SetTextColor(joaat("COLOR_BLUE"))
		:SetVisible(false)
		:OnFocused(function()
			menu:SetFooter("Item 4 focused")
		end)
		:OnSelected(function()
			menu:SetHeader("Item 4 selected")
		end)

	if type == "image" then
		-- Textures must be called after the items are created for some reasons
		item1:SetImgTextureDict(joaat("HUD_TOASTS"))
		item1:SetImgTexture(joaat("TOAST_MEDAL_BRONZE"))
	
		item2:SetImgTextureDict(joaat("HUD_TOASTS"))
		item2:SetImgTexture(joaat("TOAST_MEDAL_BRONZE"))
	
		item3:SetImgTextureDict(joaat("HUD_TOASTS"))
		item3:SetImgTexture(joaat("TOAST_MEDAL_GOLD"))
	
		item4:SetImgTextureDict(joaat("HUD_TOASTS"))
		item4:SetImgTexture(1249997984)
	end

	-- Open the menu
	menu:Open()

	-- Wait 4 seconds
	Wait(4000)
	
	-- Remove item 2
	menu:RemoveItem(item2)
	
	-- Set item 4 visible
	item4:SetVisible(true)
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if (IsControlJustPressed(0, 0x760A9C6F)) then
			OpenMenu("image")
		end
	end
end)


AddEventHandler("onResourceStop", function(resource)
	if (GetCurrentResourceName() ~= resource) then return end

	CloseAllUiapps()
end)