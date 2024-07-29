ESX = exports['es_extended']:getSharedObject()

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
        local xPlayer = ESX.GetPlayerFromId(players[i])
        local ped = GetPlayerPed(players[i])

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
            ped = {
                model = GetEntityModel(ped),
                health = GetEntityHealth(ped),
                armor = GetPedArmour(ped),
                coords = GetEntityCoords(ped)
            }
        })
    end
    cb(playerList)
end)

ESX.RegisterServerCallback('esx_admin:giveWeapon', function(src, cb, id, weapon)
    if not IsPlayerAceAllowed(src, "command.esxAdmin") then
        return
    end

    local xPlayer = ESX.GetPlayerFromId(id)
    xPlayer.addWeapon(weapon, 0)

    ActionExecuted("giveWeapon", xPlayer.getName() .. " (" .. xPlayer.getIdentifier() .. ")")

    cb()
end)

ESX.RegisterServerCallback('esx_admin:giveAmmo', function(src, cb, id, weapon, ammo)
    if not IsPlayerAceAllowed(src, "command.esxAdmin") then
        return
    end

    local xPlayer = ESX.GetPlayerFromId(id)
    xPlayer.addWeaponAmmo(weapon, ammo)

    ActionExecuted("giveAmmo", xPlayer.getName() .. " (" .. xPlayer.getIdentifier() .. ")")

    cb()
end)

ESX.RegisterServerCallback('esx_admin:addMoney', function(src, cb, id, amount, method)
    if not IsPlayerAceAllowed(src, "command.esxAdmin") then
        return
    end

    print(id, amount, method)

    local xPlayer = ESX.GetPlayerFromId(id)
    if method == "cash" then
        xPlayer.addMoney(amount)
    elseif method == "bank" then
        xPlayer.addAccountMoney('bank', amount)
    elseif method == "black" then
        xPlayer.addAccountMoney('black_money', amount)
    end

    ActionExecuted("addMoney", xPlayer.getName() .. " (" .. xPlayer.getIdentifier() .. ")")

    cb()
end)