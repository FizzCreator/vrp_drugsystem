local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_drugsystem")

RegisterServerEvent('tjekweed')
AddEventHandler('tjekweed', function()
	local source = source
	local user_id = vRP.getUserId({source})
	if vRP.tryGetInventoryItem({user_id,"hampblad",Config.CheckWeedAmount,false}) then
		TriggerClientEvent('harweed', source)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = Config.NoWeedMSG, length = 2500, style = { ['background-color'] = '#1e5d76', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('tjekkokainblade')
AddEventHandler('tjekkokainblade', function()
	local source = source
	local user_id = vRP.getUserId({source})
	if vRP.tryGetInventoryItem({user_id,"kokainblade",Config.CokeAmount,false}) then
		TriggerClientEvent('harkokainblade', source)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = Config.NoCokeMSG, length = 2500, style = { ['background-color'] = '#1e5d76', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('tjekkokainblade2')
AddEventHandler('tjekkokainblade2', function()
	local source = source
	local user_id = vRP.getUserId({source})
	if vRP.tryGetInventoryItem({user_id,"kokainblade",Config.CokeAmount,false}) then
		TriggerClientEvent('harkokainblade2', source)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = Config.NoCokeMSG, length = 2500, style = { ['background-color'] = '#1e5d76', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('tjekrawcoke')
AddEventHandler('tjekrawcoke', function()
	local source = source
	local user_id = vRP.getUserId({source})
	if vRP.tryGetInventoryItem({user_id,"rawcoke",Config.RawCokeAmount,false}) then
		TriggerClientEvent('harrawcoke', source)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = Config.NoRawCokeMSG, length = 2500, style = { ['background-color'] = '#1e5d76', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('tjekrawcoke2')
AddEventHandler('tjekrawcoke2', function()
	local source = source
	local user_id = vRP.getUserId({source})
	if vRP.tryGetInventoryItem({user_id,"rawcoke",Config.RawCokeAmount,false}) then
		TriggerClientEvent('harrawcoke2', source)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = Config.NoRawCokeMSG, length = 2500, style = { ['background-color'] = '#1e5d76', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('tjekrawcoke3')
AddEventHandler('tjekrawcoke3', function()
	local source = source
	local user_id = vRP.getUserId({source})
	if vRP.tryGetInventoryItem({user_id,"rawcoke",Config.RawCokeAmount,false}) then
		TriggerClientEvent('harrawcoke3', source)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = Config.NoRawCokeMSG, length = 2500, style = { ['background-color'] = '#1e5d76', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('tjekkokainblade3')
AddEventHandler('tjekkokainblade3', function()
	local source = source
	local user_id = vRP.getUserId({source})
	if vRP.tryGetInventoryItem({user_id,"kokainblade",Config.CokeAmount,false}) then
		TriggerClientEvent('harkokainblade3', source)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = Config.NoCokeMSG, length = 2500, style = { ['background-color'] = '#1e5d76', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('getmethglass')
AddEventHandler('getmethglass', function()
	local source = source
	local user_id = vRP.getUserId({source})
	if vRP.tryGetInventoryItem({user_id,"urafineretmeth",Config.CheckMethAmount,false}) then
		TriggerClientEvent('harmeth', source)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = Config.NoMethMSG, length = 2500, style = { ['background-color'] = '#1e5d76', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('getrafineretmeth')
AddEventHandler('getrafineretmeth', function()
	local source = source
	local user_id = vRP.getUserId({source})
	if vRP.tryGetInventoryItem({user_id,"rafineretmeth",Config.RafineretMethAmount,false}) then
		TriggerClientEvent('harnokraffineretmeth', source)
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = Config.NoMethMSG1, length = 2500, style = { ['background-color'] = '#1e5d76', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('samletkokain')
AddEventHandler('samletkokain', function()
	local source = source
	local user_id = vRP.getUserId({source})
	vRP.giveInventoryItem({user_id, "rawcoke", Config.RawCokeAmount, true})
end)

RegisterServerEvent('ucelbarkokain')
AddEventHandler('ucelbarkokain', function()
	local source = source
	local user_id = vRP.getUserId({source})
	vRP.giveInventoryItem({user_id, "ucelbarkokain", Config.GiveCokeAmount, true})
end)

RegisterServerEvent('urafineretmeth')
AddEventHandler('urafineretmeth', function()
	local source = source
	local user_id = vRP.getUserId({source})
	vRP.giveInventoryItem({user_id, "urafineretmeth", Config.KogetMethAmount, true})
end)

RegisterServerEvent('givpose')
AddEventHandler('givpose', function()
	local source = source
	local user_id = vRP.getUserId({source})
	vRP.giveInventoryItem({user_id, "methpose", Config.PoseAmount, true})
end)

RegisterServerEvent('givmeth')
AddEventHandler('givmeth', function()
	local source = source
	local user_id = vRP.getUserId({source})
	vRP.giveInventoryItem({user_id, "rafineretmeth", Config.RafineretMethAmount, true})
end)

RegisterServerEvent('methpose')
AddEventHandler('methpose', function()
	local source = source
	local user_id = vRP.getUserId({source})
	if vRP.hasInventoryItem({user_id, "rafineretmeth", 3, false}) then
		vRP.tryGetInventoryItem({user_id, "rafineretmeth", 3, true})
		vRP.giveInventoryItem({user_id, "methpose", 1, true})
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du har ikke nok rafineret meth!', length = 2500, style = { ['background-color'] = '#1e5d76', ['color'] = '#ffffff' } })
	end
end)

RegisterServerEvent('hash')
AddEventHandler('hash', function()
	local source = source
	local user_id = vRP.getUserId({source})
	vRP.giveInventoryItem({user_id, "hash", Config.WeedAmount, false})
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Du modtog ' ..Config.WeedAmount.. ' stykker hash', length = 2500, style = { ['background-color'] = '#1e5d76', ['color'] = '#ffffff' } })
end)

RegisterServerEvent('hampblade')
AddEventHandler('hampblade', function()
	local source = source
	local user_id = vRP.getUserId({source})
	vRP.giveInventoryItem({user_id, "hampblad", Config.HarvestAmount, true})
end)
		