RegisterNetEvent('dzibies:onDrinkCoffee')
AddEventHandler('dzibies:onDrinkCoffee', function(prop_name)
	if not IsAnimated then
		local prop_name = prop_name or 'p_amb_coffeecup_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2,  true,  true, true)	
			local boneIndex = GetPedBoneIndex(playerPed, 18905)			
	        AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			
			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)	
	end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.3)
    Wait(20000)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end)