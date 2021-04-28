local p = false
local started = false
local delay = 200

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(delay)
		for k,v in pairs(Config.KogMeth) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			while GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.x,v.y,v.z) < 1.0 do
				delay = 1
				Citizen.Wait(delay)
				DrawText3Ds(v.x,v.y,v.z, Config.KogMethTekst)
				if IsControlJustPressed(0,38) then
					if started == false then
                        started = true
                        p = true
                        TriggerEvent('kogmeth')
					else
						exports['mythic_notify']:SendAlert('inform', Config.MethAlreadyStarted)
					end
				end
			end
			delay = 200
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(delay)
		for k,v in pairs(Config.BreakMeth) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			while GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.x,v.y,v.z) < 1.2 do
				delay = 1
				Citizen.Wait(delay)
				DrawText3Ds(v.x,v.y,v.z, Config.BreakMethText)
                if IsControlJustPressed(0,Config.KeyBind) then
                    if started == false then
						TriggerServerEvent('getmethglass')
                    else
                        exports['mythic_notify']:SendAlert('inform', Config.MethAlreadyStarted)
                    end
                end
            end
            delay = 200
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(delay)
		for k,v in pairs(Config.WeightMeth) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			while GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.x,v.y,v.z) < 1.2 do
				delay = 1
				Citizen.Wait(delay)
				DrawText3Ds(v.x,v.y,v.z, Config.WeightMethText)
                if IsControlJustPressed(0,Config.KeyBind) then
                    if started == false then
						TriggerServerEvent('getrafineretmeth')
                    else
                        exports['mythic_notify']:SendAlert('inform', Config.MethAlreadyStarted)
                    end
                end
            end
            delay = 200
		end
	end
end)

RegisterNetEvent('kogmeth')
AddEventHandler('kogmeth', function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			FreezeEntityPosition(GetPlayerPed(-1), true)
			local ped = PlayerPedId() 
            local  targetRotation = vec3(180.0, 180.0, 180.0)
            local x,y,z = table.unpack(vec3(1005.8336791992,-3200.4072265625,-38.519317626953))

			local animDict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@"
    
            RequestAnimDict(animDict)
            RequestModel("bkr_prop_meth_ammonia")
            RequestModel("bkr_prop_meth_sacid")
            RequestModel("bkr_prop_fakeid_clipboard_01a")
            RequestModel("bkr_prop_fakeid_penclipboard")
    
            while not HasAnimDictLoaded(animDict) and
                not HasModelLoaded("bkr_prop_meth_ammonia") and 
                not HasModelLoaded("bkr_prop_meth_sacid") and 
                not HasModelLoaded("bkr_prop_fakeid_clipboard_01a") and
                not HasModelLoaded("bkr_prop_fakeid_penclipboard") do 
                Citizen.Wait(100)
            end

            ammonia = CreateObject(GetHashKey('bkr_prop_meth_ammonia'), x, y, z, 1, 0, 1)
            acido = CreateObject(GetHashKey('bkr_prop_meth_sacid'), x, y, z, 1, 0, 1)
            caderneta = CreateObject(GetHashKey('bkr_prop_fakeid_clipboard_01a'), x, y, z, 1, 0, 1)
            caneta = CreateObject(GetHashKey('bkr_prop_fakeid_penclipboard'), x, y, z, 1, 0, 1)   


            local netScene = NetworkCreateSynchronisedScene(x + 5.0 ,y + 2.0, z - 0.4, targetRotation, 2, false, false, 1148846080, 0, 1.3)
            local netScene2 = NetworkCreateSynchronisedScene(x + 5.0 ,y + 2.0, z - 0.4, targetRotation, 2, false, false, 1148846080, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "chemical_pour_long_cooker", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(ammonia, netScene, animDict, "chemical_pour_long_ammonia", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(acido, netScene, animDict, "chemical_pour_long_sacid", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(caderneta, netScene, animDict, "chemical_pour_long_clipboard", 4.0, -8.0, 1)
            NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "chemical_pour_long_cooker", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(caneta, netScene2, animDict, "chemical_pour_long_pencil", 4.0, -8.0, 1)
			
			Citizen.Wait(150)
            NetworkStartSynchronisedScene(netScene)
            NetworkStartSynchronisedScene(netScene2)

			Citizen.Wait(GetAnimDuration(animDict, "chemical_pour_long_cooker") * 770)
            DeleteObject(ammonia)
            DeleteObject(acido)
            DeleteObject(caderneta)
			DeleteObject(caneta)
			FreezeEntityPosition(GetPlayerPed(-1), false)
            started = false
			p = false
			TriggerServerEvent('urafineretmeth')
			break    
		end
	end)
end)


RegisterNetEvent('harnokraffineretmeth')
AddEventHandler('harnokraffineretmeth', function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			started = true
			FreezeEntityPosition(GetPlayerPed(-1),true)
			local ped = PlayerPedId() 
			local  targetRotation = vec3(180.0, 180.0, 168.0)
			local x,y,z = table.unpack(vec3(1009.8844604492,-3195.1354980469,-38.993125915527))    

			local animDict = "anim@amb@business@meth@meth_smash_weight_check@"
    
			RequestAnimDict(animDict)
			RequestModel("bkr_prop_meth_scoop_01a")
			RequestModel("bkr_prop_meth_bigbag_03a")
			RequestModel("bkr_prop_meth_bigbag_04a")
			RequestModel("bkr_prop_fakeid_penclipboard")
			RequestModel("bkr_prop_fakeid_clipboard_01a")
			RequestModel("bkr_prop_meth_openbag_02")
			RequestModel("bkr_prop_coke_scale_01")
			RequestModel("bkr_prop_meth_smallbag_01a")
			RequestModel("bkr_prop_meth_openbag_01a")
			RequestModel("bkr_prop_fakeid_penclipboard")

			while not HasAnimDictLoaded(animDict) and
				not HasModelLoaded("bkr_prop_meth_scoop_01a") and 
				not HasModelLoaded("bkr_prop_meth_bigbag_03a") and 
				not HasModelLoaded("bkr_prop_meth_bigbag_04a") and
				not HasModelLoaded("bkr_prop_meth_openbag_02") and 
				not HasModelLoaded("bkr_prop_coke_scale_01") and 
				not HasModelLoaded("bkr_prop_meth_smallbag_01a") and 
				not HasModelLoaded("bkr_prop_meth_openbag_01a") and 
				not HasModelLoaded("bkr_prop_fakeid_clipboard_01a") and
				not HasModelLoaded("bkr_prop_fakeid_penclipboard") do 
				Citizen.Wait(100)
			end

			pazinha = CreateObject(GetHashKey('bkr_prop_meth_scoop_01a'), x, y, z, 1, 0, 1)
			caixa_grande = CreateObject(GetHashKey('bkr_prop_meth_bigbag_03a'), x, y, z, 1, 0, 1)
			caixa_grande_2 = CreateObject(GetHashKey('bkr_prop_meth_bigbag_04a'), x, y, z, 1, 0, 1)
			bolsa = CreateObject(GetHashKey('bkr_prop_meth_openbag_02'), x, y, z, 1, 0, 1)
			bolsa_fechada = CreateObject(GetHashKey('bkr_prop_meth_smallbag_01a'), x, y, z, 1, 0, 1)
			bolsa_aberta = CreateObject(GetHashKey('bkr_prop_meth_openbag_01a'), x, y, z, 1, 0, 1)
			balanca = CreateObject(GetHashKey('bkr_prop_coke_scale_01'), x, y, z, 1, 0, 1)
			caderneta = CreateObject(GetHashKey('bkr_prop_fakeid_clipboard_01a'), x, y, z, 1, 0, 1)
			caneta = CreateObject(GetHashKey('bkr_prop_fakeid_penclipboard'), x, y, z, 1, 0, 1)


			local netScene = NetworkCreateSynchronisedScene(x - 5.3,y - 0.4, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			local netScene2 = NetworkCreateSynchronisedScene(x - 5.3 ,y - 0.4, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			local netScene3 = NetworkCreateSynchronisedScene(x - 5.3 ,y - 0.4, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "break_weigh_char01", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(pazinha, netScene, animDict, "break_weigh_scoop", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caixa_grande_2, netScene, animDict, "break_weigh_box01", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(bolsa, netScene, animDict, "break_weigh_methbag01^3", 4.0, -8.0, 1)

			NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "break_weigh_char01", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(balanca, netScene2, animDict, "break_weigh_scale", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caixa_grande, netScene2, animDict, "break_weigh_box01^1", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(bolsa_fechada, netScene2, animDict, "break_weigh_methbag01^2", 4.0, -8.0, 1)

			NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "break_weigh_char01", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(bolsa_aberta, netScene3, animDict, "break_weigh_methbag01^1", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caderneta, netScene3, animDict, "break_weigh_clipboard", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caneta, netScene3, animDict, "break_weigh_pen", 4.0, -8.0, 1)
			
			NetworkStartSynchronisedScene(netScene)
			NetworkStartSynchronisedScene(netScene2)
			NetworkStartSynchronisedScene(netScene3)


			
			Citizen.Wait(GetAnimDuration(animDict, "break_weigh_char01") * 770)


			DeleteObject(pazinha)
			DeleteObject(caixa_grande)
			DeleteObject(caixa_grande_2)
			DeleteObject(bolsa)
			DeleteObject(bolsa_fechada)
			DeleteObject(bolsa_aberta)
			DeleteObject(balanca)
			DeleteObject(caderneta)
			DeleteObject(caneta)
			FreezeEntityPosition(GetPlayerPed(-1), false)
            started = false
			p = false
			TriggerServerEvent('givpose')
			break
		end
	end)
end)

RegisterNetEvent('harmeth')
AddEventHandler('harmeth', function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			local ped = PlayerPedId() 
			local  targetRotation = vec3(180.0, 180.0, 168.0)
			local x,y,z = table.unpack(vec3(1009.8942260742,-3194.8874511719,-38.993125915527))

			local animDict = "anim@amb@business@meth@meth_smash_weight_check@"
    
			RequestAnimDict(animDict)
			RequestModel("bkr_prop_meth_tray_02a")
			RequestModel("w_me_hammer")
			RequestModel("bkr_prop_meth_tray_01a")
			RequestModel("bkr_prop_meth_smashedtray_01")
			RequestModel("bkr_prop_meth_smashedtray_01_frag_")
			RequestModel("bkr_prop_meth_bigbag_02a")

			while not HasAnimDictLoaded(animDict) and
				not HasModelLoaded("bkr_prop_meth_tray_02a") and 
				not HasModelLoaded("bkr_prop_fakeid_penclipboard") and 
				not HasModelLoaded("w_me_hammer") and 
				not HasModelLoaded("bkr_prop_meth_tray_01a") and 
				not HasModelLoaded("bkr_prop_meth_smashedtray_01") and 
				not HasModelLoaded("bkr_prop_meth_smashedtray_01_frag_") and 
				not HasModelLoaded("bkr_prop_meth_bigbag_02a") do 
				Citizen.Wait(100)
			end

			forma = CreateObject(GetHashKey('bkr_prop_meth_tray_02a'), x, y, z, 1, 0, 1)
			forma_2 = CreateObject(GetHashKey('bkr_prop_meth_tray_01a'), x, y, z, 1, 0, 1)
			--forma_quebrada = CreateObject(GetHashKey('bkr_prop_meth_smashedtray_01'), x, y, z, 1, 0, 1)
			forma_quebrada_2 = CreateObject(GetHashKey('bkr_prop_meth_smashedtray_01_frag_'), x, y, z, 1, 0, 1)
			martelo = CreateObject(GetHashKey('w_me_hammer'), x, y, z, 1, 0, 1)
			caixa = CreateObject(GetHashKey('bkr_prop_meth_bigbag_02a'), x, y, z, 1, 0, 1)




			local netScene = NetworkCreateSynchronisedScene(x - 3.6,y - 1.0, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			local netScene2 = NetworkCreateSynchronisedScene(x - 3.6,y - 1.0, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			
			NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "break_weigh_char02", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(forma_quebrada, netScene, animDict, "break_weigh_tray01", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(forma_2, netScene, animDict, "break_weigh_tray01^1", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(martelo, netScene, animDict, "break_weigh_hammer", 4.0, -8.0, 1)

			NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "break_weigh_char02", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(forma, netScene2, animDict, "break_weigh_tray01^2", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(forma_quebrada_2, netScene2, animDict, "break_weigh_tray01", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caixa, netScene2, animDict, "break_weigh_box01^1", 4.0, -8.0, 1)
			
			Citizen.Wait(150)
			NetworkStartSynchronisedScene(netScene)
			NetworkStartSynchronisedScene(netScene2)


			
			Citizen.Wait(GetAnimDuration(animDict, "break_weigh_char02") * 770)
			DeleteObject(forma)
			DeleteObject(forma_2)
			DeleteObject(forma_quebrada)
			DeleteObject(forma_quebrada_2)
			DeleteObject(martelo)
			DeleteObject(caixa)
			FreezeEntityPosition(GetPlayerPed(-1), false)
            started = false
			p = false
			TriggerServerEvent('givmeth')
			break
		end
	end)
end)