ESX.RegisterCommand("esxAdmin", "admin", function(xPlayer, args, showError)
    Citizen.CreateThread(function()
        xPlayer.triggerEvent('nui:toggle', true)
    end)
end, false, { help = "Open the ESX admin menu" })

ESX.RegisterServerCallback('esx_admin:get_players', function(src, cb)
    if not IsPlayerAceAllowed(src, "command.esxAdmin") then
        return
    end

    local players = GetPlayers()
    local playerList = {}
    for i = 1, #players, 1 do
        local player = getPlayer(players[i])

        table.insert(playerList, player)
    end
    cb(playerList)
end)

ESX.RegisterServerCallback('esx_admin:get_player_vehicles', function(src, cb, id)
    if not IsPlayerAceAllowed(src, "command.esxAdmin") then
        return
    end

    local xPlayer = ESX.GetPlayerFromId(id)
    local vehicles = getPlayerVehicles(xPlayer)
    
    cb(vehicles, id)
end)