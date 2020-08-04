

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

local cantatrue = false


RegisterNetEvent('td-bag:open')
AddEventHandler('td-bag:open',function(skin)
	if not cantatrue then
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
		tdanim()
            TriggerEvent('skinchanger:change', "bags_1", 45)
            TriggerEvent('skinchanger:change', "bags_2", 0)
            TriggerEvent('skinchanger:getSkin', function(skin)
			TriggerServerEvent('esx_skin:save', skin)
			cantatrue = true
            end)
	end)
else
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Zaten çantan var!' } )
end
end)

function anim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 1.0, -1, 49, 0, 0, 0, 0)
	end)
end

function tdanim()
    anim("anim@heists@ornate_bank@grab_cash", "intro")
    Citizen.Wait(1000)
	ClearPedTasks(PlayerPedId())
end

RegisterNetEvent('td-baganim')
AddEventHandler('td-baganim',function()
end)

RegisterCommand('çantaçıkar',function(skin)
	if cantatrue then
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
		tdanim()
            TriggerEvent('skinchanger:change', "bags_1", 0)
            TriggerEvent('skinchanger:change', "bags_2", 0)
            TriggerEvent('skinchanger:getSkin', function(skin)
			TriggerServerEvent('esx_skin:save', skin)
			TriggerServerEvent('td-canta:givecanta')
			cantatrue = false
            end)
	end)
else
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Çantan yok!' } )
end
end)























