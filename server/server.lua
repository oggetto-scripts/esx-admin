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

    print("Giving weapon " .. weapon .. " to " .. id)

    local xPlayer = ESX.GetPlayerFromId(id)
    xPlayer.addInventoryItem(weapon, 1)

    ActionExecuted("giveWeapon", xPlayer.getName() .. " (" .. xPlayer.getIdentifier() .. ")")

    cb(0, "Weapon given successfully")
end)

ESX.RegisterServerCallback('esx_admin:giveAmmo', function(src, cb, id, type, ammo)
    if not IsPlayerAceAllowed(src, "command.esxAdmin") then
        return
    end

    local xPlayer = ESX.GetPlayerFromId(id)
    xPlayer.addInventoryItem(type, ammo)

    ActionExecuted("giveAmmo", xPlayer.getName() .. " (" .. xPlayer.getIdentifier() .. ")")

    cb(0, "Ammo given successfully")
end)

ESX.RegisterServerCallback('esx_admin:addMoney', function(src, cb, id, amount, method)
    if not IsPlayerAceAllowed(src, "command.esxAdmin") then
        return
    end

    local xPlayer = ESX.GetPlayerFromId(id)

    xPlayer.addAccountMoney(method, amount)

    ActionExecuted("addMoney", xPlayer.getName() .. " (" .. xPlayer.getIdentifier() .. ")")

    cb(0, "Money added via " .. method .. " successfully")
end)

ESX.RegisterServerCallback('esx_admin:removeMoney', function(src, cb, id, amount, method)
    if not IsPlayerAceAllowed(src, "command.esxAdmin") then
        return
    end

    local xPlayer = ESX.GetPlayerFromId(id)

    xPlayer.removeAccountMoney(method, amount)

    ActionExecuted("removeMoney", xPlayer.getName() .. " (" .. xPlayer.getIdentifier() .. ")")

    cb(0, "Money removed via " .. method .. " successfully")
end)

ESX.RegisterServerCallback('esx_admin:setMoney', function(src, cb, id, amount, method)
    if not IsPlayerAceAllowed(src, "command.esxAdmin") then
        return
    end

    local xPlayer = ESX.GetPlayerFromId(id)

    xPlayer.setAccountMoney(method, amount)

    ActionExecuted("setMoney", xPlayer.getName() .. " (" .. xPlayer.getIdentifier() .. ")")

    cb(0, "Money set via " .. method .. " successfully")
end)
