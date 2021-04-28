local started = false
local delay = 200
local p = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(delay)
		for k,v in pairs(Config.CreditCardCoke) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			while GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.x,v.y,v.z) < 1.0 do
				delay = 1
				Citizen.Wait(delay)
				DrawText3Ds(v.x,v.y,v.z, Config.SammelCokeText)
				if IsControlJustPressed(0,38) then
					if started == false then
						if v.id == 1 then
							p = true
							TriggerServerEvent('tjekkokainblade')
						elseif v.id == 2 then
							p = true
							TriggerServerEvent('tjekkokainblade2')
						elseif v.id == 3 then
							p = true
							TriggerServerEvent('tjekkokainblade3')
						else
							exports['mythic_notify']:SendAlert('inform', Config.AlreadyBegan)
						end
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
		for k,v in pairs(Config.RawCokeCoords) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			while GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.x,v.y,v.z) < 1.0 do
				delay = 1
				Citizen.Wait(delay)
				DrawText3Ds(v.x,v.y,v.z, Config.RawCokeText)
				if IsControlJustPressed(0,38) then
					if started == false then
						if v.id == 1 then
							p = true
							TriggerServerEvent('tjekrawcoke')
						elseif v.id == 2 then
							p = true
							TriggerServerEvent('tjekrawcoke3')
						elseif v.id == 3 then
							p = true
							TriggerServerEvent('tjekrawcoke2')
						end
					else
						exports['mythic_notify']:SendAlert('inform', Config.AlreadyBegan)
					end
				end
			end
			delay = 200
		end
	end
end)

function embalando_brinquedo()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			FreezeEntityPosition(GetPlayerPed(-1),true)
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local animDict = "anim@amb@business@coc@coc_packing_hi@"
            RequestAnimDict(animDict)
            RequestModel("bkr_prop_coke_fullscoop_01a")
            RequestModel("bkr_prop_coke_fullmetalbowl_02")
            RequestModel("bkr_prop_coke_dollboxfolded")
            RequestModel("bkr_prop_coke_dollmould")
            RequestModel("bkr_prop_coke_press_01b")
            RequestModel("bkr_prop_coke_dollcast")
            RequestModel("bkr_prop_coke_doll")
            RequestModel("bkr_prop_coke_dollbox")
            RequestModel("bkr_prop_coke_doll_bigbox")
    
            while not HasAnimDictLoaded(animDict) and
                not HasModelLoaded("bkr_prop_coke_fullscoop_01a") and 
                not HasModelLoaded("bkr_prop_coke_fullmetalbowl_02") and 
                not HasModelLoaded("bkr_prop_coke_dollboxfolded") and 
                not HasModelLoaded("bkr_prop_coke_dollmould") and 
                not HasModelLoaded("bkr_prop_coke_press_01b") and 
                not HasModelLoaded("bkr_prop_coke_dollcast") and 
                not HasModelLoaded("bkr_prop_coke_doll") and 
                not HasModelLoaded("bkr_prop_coke_dollbox") and
                not HasModelLoaded("bkr_prop_coke_doll_bigbox") do
                Citizen.Wait(100)
            end

            pazinha = CreateObject(GetHashKey('bkr_prop_coke_fullscoop_01a'), x, y, z, 1, 0, 1)
            vasilha = CreateObject(GetHashKey('bkr_prop_coke_fullmetalbowl_02'), x, y, z, 1, 0, 1)
            caixa_aberta = CreateObject(GetHashKey('bkr_prop_coke_dollboxfolded'), x, y, z, 1, 0, 1)
            boneco_molde = CreateObject(GetHashKey('bkr_prop_coke_dollmould'), x, y, z, 1, 0, 1)
            prensa = CreateObject(GetHashKey('bkr_prop_coke_press_01b'), x, y, z, 1, 0, 1)
            boneco_vazio = CreateObject(GetHashKey('bkr_prop_coke_dollcast'), x, y, z, 1, 0, 1)
            boneco_pronto = CreateObject(GetHashKey('bkr_prop_coke_doll'), x, y, z, 1, 0, 1)
            caixa_fechada = CreateObject(GetHashKey('bkr_prop_coke_dollbox'), x, y, z, 1, 0, 1)

			local  targetRotation = vec3(0.0, 0.0, 130.0)
            local x,y,z = table.unpack(vec3(316.94856567383,2872.257578125,46.586605072021))  

            local animPos = GetAnimInitialOffsetPosition(animDict, "full_cycle_v1_pressoperator",x ,y ,z ,targetRotation, 0, 2) 
			local netScene = NetworkCreateSynchronisedScene(x + 5.3 ,y + 4.6, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)

            NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "full_cycle_v1_pressoperator", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(pazinha, netScene, animDict, "full_cycle_v1_scoop", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(vasilha, netScene, animDict, "full_cycle_v1_cocbowl", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caixa_aberta, netScene, animDict, "full_cycle_v1_foldedbox", 4.0, 0, 1)

            local netScene2 = NetworkCreateSynchronisedScene(x + 5.3 ,y + 4.6, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)
            NetworkAddEntityToSynchronisedScene(boneco_molde, netScene2, animDict, "full_cycle_v1_dollmould", 4.0, 0, 1) --
            NetworkAddEntityToSynchronisedScene(prensa, netScene2, animDict, "full_cycle_v1_cokepress", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(boneco_vazio, netScene2, animDict, "full_cycle_v1_dollcast^3", 4.0, -8.0, 1)
			local netScene3 = NetworkCreateSynchronisedScene(x + 5.3 ,y + 4.6, z - 1.0, targetRotation, 2, false, false, 1148846080, 0, 1.3)

            NetworkAddEntityToSynchronisedScene(boneco_pronto, netScene3, animDict, "full_cycle_v1_cocdoll", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caixa_fechada, netScene3, animDict, "full_cycle_v1_boxeddoll", 4.0, -8.0, 1)
			
			Citizen.Wait(150)
			NetworkStartSynchronisedScene(netScene)
			Citizen.Wait(100)
			NetworkStartSynchronisedScene(netScene2)
			Citizen.Wait(100)
            NetworkStartSynchronisedScene(netScene3)

			Citizen.Wait(GetAnimDuration(animDict, "full_cycle_v1_pressoperator") * 780) 

			NetworkStopSynchronisedScene(netScene)
			NetworkStopSynchronisedScene(netScene2)
			NetworkStopSynchronisedScene(netScene3)

			TriggerEvent('Notify', 'sucesso', 'Você embalou a cocaína.')

			DeleteObject(prensa)
            DeleteObject(caixa_aberta)
            DeleteObject(boneco_molde)
            DeleteObject(boneco_vazio)
            DeleteObject(boneco_pronto)
			DeleteObject(caixa_fechada)
			FreezeEntityPosition(GetPlayerPed(-1),false)
			started = false
			p = false
			TriggerServerEvent('dukke')
			break
		end
	end)
end

RegisterNetEvent('harrawcoke')
AddEventHandler('harrawcoke', function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			started = true
			FreezeEntityPosition(GetPlayerPed(-1),true)
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local animDict = "anim@amb@business@coc@coc_unpack_cut@"
    
			RequestAnimDict(animDict)
			RequestModel("bkr_prop_coke_box_01a")
			RequestModel("bkr_prop_coke_fullmetalbowl_02")
			RequestModel("bkr_prop_coke_fullscoop_01a")


			while not HasAnimDictLoaded(animDict) and
				not HasModelLoaded("bkr_prop_coke_box_01a") and 
				not HasModelLoaded("bkr_prop_coke_fullmetalbowl_02") and 
				not HasModelLoaded("bkr_prop_coke_fullscoop_01a") do
				Citizen.Wait(100)
			end

			vasilha = CreateObject(GetHashKey('bkr_prop_coke_fullmetalbowl_02'), x, y, z, 1, 0, 1)
			pazinha = CreateObject(GetHashKey('bkr_prop_coke_fullscoop_01a'), x, y, z, 1, 0, 1) 
			caixa = CreateObject(GetHashKey('bkr_prop_coke_box_01a'), x, y, z, 1, 0, 1)

			local  targetRotation = vec3(0.0, 0.0, 270.5)
			local x,y,z = table.unpack(vec3(1095.5063476563,-3194.8972167969,-38.993434906006))  


			local netScene = NetworkCreateSynchronisedScene(x + 0.5 ,y - 0.2, z - 0.65, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "fullcut_cycle_v1_cokepacker", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(vasilha, netScene, animDict, "fullcut_cycle_v1_cokebowl", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caixa, netScene, animDict, 'fullcut_cycle_v1_cokebox', 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(pazinha, netScene, animDict, 'fullcut_cycle_v1_cokescoop', 4.0, -8.0, 1)
			
			Citizen.Wait(150)
			NetworkStartSynchronisedScene(netScene)

			SetEntityVisible(pazinha, false, 0)
			Citizen.Wait(GetAnimDuration(animDict, "fullcut_cycle_v1_cokepacker") * 450)
			SetEntityVisible(pazinha, true, 0)

			Citizen.Wait(GetAnimDuration(animDict, "fullcut_cycle_v1_cokepacker") * 65)
			SetEntityVisible(caixa, false, 0)
			
			Citizen.Wait(GetAnimDuration(animDict, "fullcut_cycle_v1_cokepacker") * 245)


			DeleteObject(caixa)
			DeleteObject(pazinha)
			FreezeEntityPosition(GetPlayerPed(-1),false)
			started = false
			p = false
			TriggerServerEvent('ucelbarkokain')
			break
		end
	end)
end)

RegisterNetEvent('harrawcoke3')
AddEventHandler('harrawcoke3', function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			started = true
			FreezeEntityPosition(GetPlayerPed(-1),true)
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local animDict = "anim@amb@business@coc@coc_unpack_cut@"
    
			RequestAnimDict(animDict)
			RequestModel("bkr_prop_coke_box_01a")
			RequestModel("bkr_prop_coke_fullmetalbowl_02")
			RequestModel("bkr_prop_coke_fullscoop_01a")


			while not HasAnimDictLoaded(animDict) and
				not HasModelLoaded("bkr_prop_coke_box_01a") and 
				not HasModelLoaded("bkr_prop_coke_fullmetalbowl_02") and 
				not HasModelLoaded("bkr_prop_coke_fullscoop_01a") do
				Citizen.Wait(100)
			end

			vasilha = CreateObject(GetHashKey('bkr_prop_coke_fullmetalbowl_02'), x, y, z, 1, 0, 1)
			pazinha = CreateObject(GetHashKey('bkr_prop_coke_fullscoop_01a'), x, y, z, 1, 0, 1) 
			caixa = CreateObject(GetHashKey('bkr_prop_coke_box_01a'), x, y, z, 1, 0, 1)

			local  targetRotation = vec3(0.0, 0.0, 270.5)
			local x,y,z = table.unpack(vec3(1093.0062255859,-3194.880859375,-38.993461608887))  


			local netScene = NetworkCreateSynchronisedScene(x + 0.5 ,y - 0.2, z - 0.65, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "fullcut_cycle_v1_cokepacker", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(vasilha, netScene, animDict, "fullcut_cycle_v1_cokebowl", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caixa, netScene, animDict, 'fullcut_cycle_v1_cokebox', 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(pazinha, netScene, animDict, 'fullcut_cycle_v1_cokescoop', 4.0, -8.0, 1)
			
			Citizen.Wait(150)
			NetworkStartSynchronisedScene(netScene)

			SetEntityVisible(pazinha, false, 0)
			Citizen.Wait(GetAnimDuration(animDict, "fullcut_cycle_v1_cokepacker") * 450)
			SetEntityVisible(pazinha, true, 0)

			Citizen.Wait(GetAnimDuration(animDict, "fullcut_cycle_v1_cokepacker") * 65)
			SetEntityVisible(caixa, false, 0)
			
			Citizen.Wait(GetAnimDuration(animDict, "fullcut_cycle_v1_cokepacker") * 245)

			DeleteObject(caixa)
			DeleteObject(pazinha)
			FreezeEntityPosition(GetPlayerPed(-1),false)
			started = false
			p = false
			TriggerServerEvent('ucelbarkokain')
			break
		end
	end)
end)

RegisterNetEvent('harrawcoke2')
AddEventHandler('harrawcoke2', function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			started = true
			FreezeEntityPosition(GetPlayerPed(-1),true)
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local animDict = "anim@amb@business@coc@coc_unpack_cut@"
    
			RequestAnimDict(animDict)
			RequestModel("bkr_prop_coke_box_01a")
			RequestModel("bkr_prop_coke_fullmetalbowl_02")
			RequestModel("bkr_prop_coke_fullscoop_01a")


			while not HasAnimDictLoaded(animDict) and
				not HasModelLoaded("bkr_prop_coke_box_01a") and 
				not HasModelLoaded("bkr_prop_coke_fullmetalbowl_02") and 
				not HasModelLoaded("bkr_prop_coke_fullscoop_01a") do
				Citizen.Wait(100)
			end

			vasilha = CreateObject(GetHashKey('bkr_prop_coke_fullmetalbowl_02'), x, y, z, 1, 0, 1)
			pazinha = CreateObject(GetHashKey('bkr_prop_coke_fullscoop_01a'), x, y, z, 1, 0, 1) 
			caixa = CreateObject(GetHashKey('bkr_prop_coke_box_01a'), x, y, z, 1, 0, 1)

			local  targetRotation = vec3(0.0, 0.0, 270.5)
			local x,y,z = table.unpack(vec3(1090.3159179688,-3194.92578125,-38.993438720703))  


			local netScene = NetworkCreateSynchronisedScene(x + 0.5 ,y - 0.2, z - 0.65, targetRotation, 2, false, false, 1148846080, 0, 1.3)
			NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "fullcut_cycle_v1_cokepacker", 1.5, -4.0, 1, 16, 1148846080, 0)
			NetworkAddEntityToSynchronisedScene(vasilha, netScene, animDict, "fullcut_cycle_v1_cokebowl", 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(caixa, netScene, animDict, 'fullcut_cycle_v1_cokebox', 4.0, -8.0, 1)
			NetworkAddEntityToSynchronisedScene(pazinha, netScene, animDict, 'fullcut_cycle_v1_cokescoop', 4.0, -8.0, 1)
			
			Citizen.Wait(150)
			NetworkStartSynchronisedScene(netScene)

			SetEntityVisible(pazinha, false, 0)
			Citizen.Wait(GetAnimDuration(animDict, "fullcut_cycle_v1_cokepacker") * 450)
			SetEntityVisible(pazinha, true, 0)

			Citizen.Wait(GetAnimDuration(animDict, "fullcut_cycle_v1_cokepacker") * 65)
			SetEntityVisible(caixa, false, 0)
			
			Citizen.Wait(GetAnimDuration(animDict, "fullcut_cycle_v1_cokepacker") * 245)

			DeleteObject(caixa)
			DeleteObject(pazinha)
			FreezeEntityPosition(GetPlayerPed(-1),false)
			started = false
			p = false
			TriggerServerEvent('ucelbarkokain')
			break
		end
	end)
end)

RegisterNetEvent('harkokainblade')
AddEventHandler('harkokainblade', function()
	Citizen.CreateThread(function() 
		while true do
			Citizen.Wait(10) 
			started = true
			FreezeEntityPosition(GetPlayerPed(-1),true)
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local animDict = "anim@amb@business@coc@coc_unpack_cut_left@"
    
            RequestAnimDict(animDict)
            RequestModel("bkr_prop_coke_box_01a")
            RequestModel("prop_cs_credit_card")
            RequestModel("bkr_prop_coke_bakingsoda_o")
    
            while not HasAnimDictLoaded(animDict) and
                not HasModelLoaded("bkr_prop_coke_bakingsoda_o") and 
                not HasModelLoaded("prop_cs_credit_card") do 
                Citizen.Wait(100)
            end

            cartao = CreateObject(GetHashKey('prop_cs_credit_card'), x, y, z, 1, 0, 1)
            cartao_2 = CreateObject(GetHashKey('prop_cs_credit_card'), x, y, z, 1, 0, 1)
            soda = CreateObject(GetHashKey('bkr_prop_coke_bakingsoda_o'), x, y, z, 1, 0, 1)

            local  targetRotation = vec3(180.0, 180.0, 0.0)
            local x,y,z = table.unpack(vec3(1095.591796875,-3194.3454589844,-38.993465423584))  


            local netScene = NetworkCreateSynchronisedScene(x - 0.7 ,y - 1.8, z - 0.65, targetRotation, 2, false, false, 1148846080, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "coke_cut_coccutter", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(cartao, netScene, animDict, "coke_cut_creditcard", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(cartao_2, netScene, animDict, "coke_cut_creditcard^1", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(soda, netScene, animDict, "cut_cough_v1_bakingsoda", 4.0, -8.0, 1) 

            NetworkStartSynchronisedScene(netScene)


			Citizen.Wait(GetAnimDuration(animDict, "coke_cut_coccutter") * 770)
			
            DeleteObject(cartao)
            DeleteObject(cartao2)
			DeleteObject(soda)
			FreezeEntityPosition(GetPlayerPed(-1), false)
			started = false
			TriggerServerEvent('samletkokain')
			procpesso = false
			break
		end
	end)
end)

RegisterNetEvent('harkokainblade3')
AddEventHandler('harkokainblade3', function()
	Citizen.CreateThread(function() 
		while true do
			Citizen.Wait(10) 
			started = true
			FreezeEntityPosition(GetPlayerPed(-1), true)
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local animDict = "anim@amb@business@coc@coc_unpack_cut_left@"
    
            RequestAnimDict(animDict)
            RequestModel("bkr_prop_coke_box_01a")
            RequestModel("prop_cs_credit_card")
            RequestModel("bkr_prop_coke_bakingsoda_o")
    
            while not HasAnimDictLoaded(animDict) and
                not HasModelLoaded("bkr_prop_coke_bakingsoda_o") and 
                not HasModelLoaded("prop_cs_credit_card") do 
                Citizen.Wait(100)
            end

            cartao = CreateObject(GetHashKey('prop_cs_credit_card'), x, y, z, 1, 0, 1)
            cartao_2 = CreateObject(GetHashKey('prop_cs_credit_card'), x, y, z, 1, 0, 1)
            soda = CreateObject(GetHashKey('bkr_prop_coke_bakingsoda_o'), x, y, z, 1, 0, 1)

            local  targetRotation = vec3(180.0, 180.0, 0.0)
            local x,y,z = table.unpack(vec3(1092.8692626953,-3194.361328125,-38.99348449707))  


            local netScene = NetworkCreateSynchronisedScene(x - 0.7 ,y - 1.8, z - 0.65, targetRotation, 2, false, false, 1148846080, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "coke_cut_coccutter", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(cartao, netScene, animDict, "coke_cut_creditcard", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(cartao_2, netScene, animDict, "coke_cut_creditcard^1", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(soda, netScene, animDict, "cut_cough_v1_bakingsoda", 4.0, -8.0, 1) 

            NetworkStartSynchronisedScene(netScene)


			Citizen.Wait(GetAnimDuration(animDict, "coke_cut_coccutter") * 770)
			
            DeleteObject(cartao)
            DeleteObject(cartao2)
			DeleteObject(soda)
			FreezeEntityPosition(GetPlayerPed(-1), false)
			started = false
			TriggerServerEvent('samletkokain')
			p = false
			break
		end
	end)
end)

RegisterNetEvent('harkokainblade2')
AddEventHandler('harkokainblade2', function()
	Citizen.CreateThread(function() 
		while true do
			Citizen.Wait(10) 
			started = true
			FreezeEntityPosition(GetPlayerPed(-1), true)
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local animDict = "anim@amb@business@coc@coc_unpack_cut_left@"
    
            RequestAnimDict(animDict)
            RequestModel("bkr_prop_coke_box_01a")
            RequestModel("prop_cs_credit_card")
            RequestModel("bkr_prop_coke_bakingsoda_o")
    
            while not HasAnimDictLoaded(animDict) and
                not HasModelLoaded("bkr_prop_coke_bakingsoda_o") and 
                not HasModelLoaded("prop_cs_credit_card") do 
                Citizen.Wait(100)
            end

            cartao = CreateObject(GetHashKey('prop_cs_credit_card'), x, y, z, 1, 0, 1)
            cartao_2 = CreateObject(GetHashKey('prop_cs_credit_card'), x, y, z, 1, 0, 1)
            soda = CreateObject(GetHashKey('bkr_prop_coke_bakingsoda_o'), x, y, z, 1, 0, 1)

            local  targetRotation = vec3(180.0, 180.0, 0.0)
            local x,y,z = table.unpack(vec3(1098.3427734375,-3194.6076660156,-38.990512237549))  


            local netScene = NetworkCreateSynchronisedScene(x - 0.7 ,y - 1.8, z - 0.65, targetRotation, 2, false, false, 1148846080, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "coke_cut_coccutter", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(cartao, netScene, animDict, "coke_cut_creditcard", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(cartao_2, netScene, animDict, "coke_cut_creditcard^1", 4.0, -8.0, 1)
            NetworkAddEntityToSynchronisedScene(soda, netScene, animDict, "cut_cough_v1_bakingsoda", 4.0, -8.0, 1) 

            NetworkStartSynchronisedScene(netScene)


			Citizen.Wait(GetAnimDuration(animDict, "coke_cut_coccutter") * 770)
			
            DeleteObject(cartao)
            DeleteObject(cartao2)
			DeleteObject(soda)
			FreezeEntityPosition(GetPlayerPed(-1), false)
			started = false
			TriggerServerEvent('samletkokain')
			p = false
			break
		end
	end)
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