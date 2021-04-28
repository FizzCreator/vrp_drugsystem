local p = false
local started = false
local delay = 200

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(delay)
		for k,v in pairs(Config.WeedSitChair) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			while GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.x,v.y,v.z) < 1.2 do
				delay = 1
				Citizen.Wait(delay)
				DrawText3Ds(v.x,v.y,v.z, Config.OmdanWeedText)
                if IsControlJustPressed(0,Config.KeyBind) then
                    if started == false then
                        p = true
						TriggerServerEvent('tjekweed')
                    else
                        exports['mythic_notify']:SendAlert('inform', Config.WeedNotifyStarted)
                    end
                end
            end
            delay = 200
		end
	end
end)

RegisterNetEvent('harweed')
AddEventHandler('harweed', function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			FreezeEntityPosition(GetPlayerPed(-1), true)
			started = true
			local ped = PlayerPedId() 
			local  targetRotation = vec3(0.0, 0.0, 270.0)
			local x,y,z = table.unpack(vec3(1028.241796875,-3209.3239746094,-38.164856719971)) 

			local animDict = "anim@amb@business@weed@weed_sorting_seated@"
    
			RequestAnimDict(animDict)
			RequestModel("bkr_prop_weed_bag_01a")
			RequestModel("bkr_prop_weed_bag_pile_01a")
			RequestModel("bkr_prop_weed_bud_02b")
			RequestModel("bkr_prop_weed_leaf_01a")
			RequestModel("bkr_prop_weed_dry_01a")
			RequestModel("bkr_prop_weed_bucket_open_01a")

			while not HasAnimDictLoaded(animDict) and
				not HasModelLoaded("bkr_prop_weed_bag_01a") and 
				not HasModelLoaded("bkr_prop_weed_bag_pile_01a") and 
				not HasModelLoaded("bkr_prop_weed_bud_02b") and 
				not HasModelLoaded("bkr_prop_weed_leaf_01a") and
				not HasModelLoaded("bkr_prop_weed_dry_01a") and 
				not HasModeLoaded("bkr_prop_weed_bucket_open_01a") do 
				Citizen.Wait(100)
			end

			plastico_vazio = CreateObject(GetHashKey('bkr_prop_weed_bag_01a'), x, y, z, 1, 0, 1)
			pilha_plasticos = CreateObject(GetHashKey('bkr_prop_weed_bag_pile_01a'), x, y, z, 1, 0, 1)
			bud = CreateObject(GetHashKey('bkr_prop_weed_bud_02b'), x, y, z, 1, 0, 1)
			folha = CreateObject(GetHashKey('bkr_prop_weed_leaf_01a'), x, y, z, 1, 0, 1)
			maconha_seca = CreateObject(GetHashKey('bkr_prop_weed_dry_01a'), x, y, z, 1, 0, 1)
			balde = CreateObject(GetHashKey('bkr_prop_weed_bucket_open_01a'), x, y, z, 1, 0, 1)


			local netScene = NetworkCreateSynchronisedScene(x + 5.5,y + 3.1, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			local netScene2 = NetworkCreateSynchronisedScene(x + 5.5 ,y + 3.1, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "sorter_left_sort_v1_sorter01", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(plastico_vazio, netScene, animDict, "sorter_left_sort_v1_weedbag01a", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(pilha_plasticos, netScene, animDict, "sorter_left_sort_v1_weedbagpile01a", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(bud, netScene, animDict, "sorter_left_sort_v1_weedbud02b^3", 4.0, -8.0, 1)


			NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "sorter_left_sort_v1_sorter01", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(maconha_seca, netScene2, animDict, "sorter_left_sort_v1_weeddry01a", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(folha, netScene2, animDict, "sorter_left_sort_v1_weedleaf01a^1", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(balde, netScene2, animDict, "sorter_left_sort_v1_bucket01a", 4.0, -8.0, 1)

			Citizen.Wait(150)
			NetworkStartSynchronisedScene(netScene)
			Citizen.Wait(150)
			NetworkStartSynchronisedScene(netScene2)


			
			Citizen.Wait(GetAnimDuration(animDict, "sorter_left_sort_v1_sorter01") * 770)
			DeleteObject(plastico_vazio)
			DeleteObject(pilha_plasticos)
			DeleteObject(bud)
			DeleteObject(folha)
			DeleteObject(maconha_seca)
			DeleteObject(balde)
			FreezeEntityPosition(GetPlayerPed(-1), false)
            started = false
			p = false
			TriggerServerEvent('hash')
			break
		end
	end)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(delay)
		for k,v in pairs(Config.WeedHarvest) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			while GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.x,v.y,v.z) < 1.2 do
				delay = 1
				Citizen.Wait(delay)
				DrawText3Ds(v.x,v.y,v.z, Config.HarvestWeedText)
                if IsControlJustPressed(0,Config.KeyBind) then
                    if started == false then
							started = true
							FreezeEntityPosition(GetPlayerPed(-1), true)
							TaskStartScenarioInPlace(PlayerPedId(), Config.Scenario, 0, true) -- "PROP_HUMAN_PARKING_METER"
							Citizen.Wait(10000)
							FreezeEntityPosition(GetPlayerPed(-1), false)
							ClearPedTasksImmediately(PlayerPedId())
							TriggerServerEvent('hampblade')
							started = false
                    else
                        exports['mythic_notify']:SendAlert('inform', Config.WeedNotifyStarted)
                    end
                end
            end
            delay = 200
		end
	end
end)

function DrawText3Ds(x,y,z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
		local factor = (string.len(text)) / 370
		DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
	end
