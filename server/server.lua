ESX = exports['es_extended']:getSharedObject()

ESX.RegisterCommand("esxAdmin", "admin", function(xPlayer, args, showError)
    Citizen.CreateThread(function()
        xPlayer.triggerEvent('nui:toggle', true)
    end)
end, false, { help = "Open the ESX admin menu" })

ESX.RegisterServerCallback('esx_admin:get_players', function(src, cb)
    local players = ESX.GetPlayers()
    local playerList = {}
    for i = 1, #players, 1 do
        local xPlayer = ESX.GetPlayerFromId(players[i])
        table.insert(playerList, {
            id = xPlayer.source,
            name = xPlayer.getName(),
            username = GetPlayerName(xPlayer.source),
            identifier = xPlayer.getIdentifier(),
            job = {
                name = xPlayer.job.name,
                grade = xPlayer.job.grade
            },
            group = xPlayer.getGroup(),
            money = xPlayer.getMoney(),
            bank = xPlayer.getAccount('bank').money,
            black_money = xPlayer.getAccount('black_money').money,
        })
    end
    cb(playerList)
end)
