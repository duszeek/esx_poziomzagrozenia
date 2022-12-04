ESX                           = nil
Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterCommand("poziomzagrozenia", function()
	openDangerCodeMenu()
end)

function openDangerCodeMenu()
	ESX.UI.Menu.Open("default", GetCurrentResourceName(), "DangerCodeMenu", {
		title 		= "Poziom zagrozenia",
		align 		= "center",
		elements	= {
			{label = "🟢​​", value = "zielony"},
			{label = "🔴​​", value = "czerwony"},
			{label = "​⚫​", value = "czarny"},
		}
	}, function(data, menu)
		TriggerServerEvent("duszek:poziomzagrozenia", data.current.value)
		-- commit?
		-- siema siema
		menu.close()
	end, 
	function(data, menu)
		menu.close()
	end)
end