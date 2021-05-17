local AdminDienst = false
local playerGroup, noclip, godmode, visible = nil, false, false, false

ESX = nil


RegisterCommand('einreise', function(source, args)
    if playerGroup ~= nil and (playerGroup == 'mod' or playerGroup == 'admin' or playerGroup == 'superadmin') then
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
        TriggerEvent('grv_notify', "#ff6161", "Einreise", "Du bist nicht für die Einreise zuständig!")
    end
end)

RegisterNetEvent('teleport')
AddEventHandler('teleport', function(x,y,z)
    local x = -1035.70
    local y = -2733.41
    local z = 13.75
    SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
    TriggerEvent('grv_notify', "#fff", "Einreise", "Willkommen in Los Santos")
end)

Citizen.CreateThread(function()
	while true do
		if ESX ~= nil then
			ESX.TriggerServerCallback('nyco_reise:Admin_getUsergroup', function(group) playerGroup = group end)

			Citizen.Wait(30 * 1000)
		else
			Citizen.Wait(100)
		end
	end
end)
