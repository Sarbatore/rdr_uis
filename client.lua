function OpenMenu()
	local menu = Menu()
		:SetHeader("Title")
		:SetFooter("Footer")
		:SetFooterColor(joaat("COLOR_GREEN"))
		
	local item1 = menu:AddItem("Item 1")
		:SetTextColor(joaat("COLOR_RED"))
		:SetEnabled(false)

	local item2 = menu:AddItem("Item 2")
		:SetTextColor(joaat("COLOR_BLUE"))
	
	local item3 = menu:AddItem("Item 3")
		:SetTextColor(joaat("COLOR_YELLOW"))
		:SetVisible(false)
	
	menu:Open()

	-- Wait a second
	Wait(1000)
	
	-- Remove the second item
	menu:RemoveItem(menu:GetItem(1))
	
	-- Set the third item visible
	item3:SetVisible(true)
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(25)

		if (IsControlJustPressed(0, 0x760A9C6F)) then
			OpenMenu()
		end
	end
end)


AddEventHandler("onResourceStop", function(resource)
	if (GetCurrentResourceName() ~= resource) then return end

	CloseAllUiapps()
end)