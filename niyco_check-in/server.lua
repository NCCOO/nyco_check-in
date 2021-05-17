local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

ESX.RegisterServerCallback('nyco_reise:Admin_getUsergroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer ~= nil then
		local playerGroup = xPlayer.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb(nil)
        end
	else
		cb(nil)
	end
end)

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

RegisterServerEvent('reise')
AddEventHandler('reise', function(target,x,y,z)
    TriggerClientEvent('teleport', target, x, y, z)
end)

