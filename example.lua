function OpenMenu()
	-- Create the menu
	local menu = Menu()
		:SetHeader("Player Menu")
		:SetSubheader("Manage player action")
		:SetFooter("Footer")
		:SetFooterColor(joaat("COLOR_GREEN"))
		
	local menu2 = Menu("image")
		:SetHeader("Menu 2")
		:SetSubheader("The second menu")
		:SetFooter("Footer")
		:SetFooterColor(joaat("COLOR_GREEN"))

	-- Add items
	local item1 = menu:AddItem("Item 1")
		:SetEnabled(false)
		:SetTextColor(joaat("COLOR_RED"))
		:OnFocused(function()
			
		end)
		:OnSelected(function()
			
		end)

	local item2 = menu:AddItem("Item 2")
		:SetTextColor(joaat("COLOR_GREEN"))
		:OnFocused(function()
			
		end)
		:OnSelected(function()
			
		end)
	
	local item3 = menu:AddItem("Item 3")
		:SetTextColor(joaat("COLOR_YELLOW"))
		:OnFocused(function()
			
		end)
		:OnSelected(function()
			
		end)
	
	local item4 = menu:AddItem("Item 4")
		:SetTextColor(joaat("COLOR_BLUE"))
		:SetVisible(false)
		:OnFocused(function()
			
		end)
		:OnSelected(function()
			menu2:Open()
		end)
		
	-- Add items
	local item5 = menu2:AddItem("Item 1")
		:SetTextColor(joaat("COLOR_NET_PLAYER8"))
		:SetImgTextureDict(joaat("HUD_TOASTS"))
		:SetImgTexture(1249997984) -- TOAST_MEDAL_BRONZE, TOAST_MEDAL_GOLD
		:OnFocused(function()
			
		end)
		:OnSelected(function()
			
		end)

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
			OpenMenu()
		end
	end
end)


AddEventHandler("onResourceStop", function(resource)
	if (GetCurrentResourceName() ~= resource) then return end

	CloseAllUiapps()
end)