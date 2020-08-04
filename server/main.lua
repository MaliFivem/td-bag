

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)


ESX.RegisterUsableItem('canta', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('td-bag:open', source)
	xPlayer.removeInventoryItem('canta',1)
end)

RegisterNetEvent('td-canta:givecanta')
AddEventHandler('td-canta:givecanta',function()
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.addInventoryItem('canta',1)

end)