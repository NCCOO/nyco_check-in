ESX = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand('departure', function(source, args)
    ESX.TriggerServerCallback('nyco:getGroup', function(group)
        if group == "superadmin" or group == "admin" or group == "mod" or group == "support" then
            table.unpack(args)
            local players = GetActivePlayers()
		    for i = 1, #players do

			    local currentplayer = players[i]
                local ped = GetPlayerPed(currentpslayer)
                if GetPlayerServerId(currentplayer) == tonumber(table.unpack(args)) then
                    TriggerServerEvent('reise', GetPlayerServerId(currentplayer), GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z)
                end
            end
        else
            ESX.ShowNotification("Immigration office: You are not responsible for it", false, true, nil)
        end
    end)
end)

RegisterNetEvent('reisetp')
AddEventHandler('reisetp', function(x,y,z)
    local x = -1044.67
    local y = -2749.51
    local z = 21.36
    SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
    ESX.ShowNotification("Welcome to Los Santos", false, true, nil)
end)