ESX = exports['es_extended']:getSharedObject()

local display = false

local function UpdatePlayers()
  ESX.TriggerServerCallback('esx_admin:get_players', function(players)
    print("Update players, sending to NUI")
    SendNUIMessage({
      type = "players",
      data = players
    })
  end)
end

RegisterNetEvent('nui:toggle')
AddEventHandler('nui:toggle', function()
  SendNUIMessage({
    type = "ui",
    display = not display
  })

  -- Update NUI values
  UpdatePlayers()

  SetNuiFocus(true, false)
  SetNuiFocusKeepInput(true)
  display = not display
end)

RegisterNUICallback('openInTxAdmin', function(data, cb)
  ExecuteCommand('txadmin ' .. data.id)
end)

RegisterNUICallback('trapMouse', function(data, cb)
  SetNuiFocus(true, true)
  SetNuiFocusKeepInput(false)
end)

RegisterNUICallback('untrapMouse', function(data, cb)
  SetNuiFocus(true, false)
  SetNuiFocusKeepInput(true)
end)

RegisterNUICallback('close', function(data, cb)
  SendNUIMessage({
    type = "ui",
    display = false
  })

  SetNuiFocus(false, false)
  SetNuiFocusKeepInput(false)
  display = false
end)

-- Weapons Events
RegisterNUICallback('giveWeapon', function(data, cb)
  ESX.TriggerServerCallback('esx_admin:giveWeapon', function()
    SendNUIMessage({
      type = "notification",
      message = "Weapon given"
    })
  end, data.id, data.weapon)
end)

RegisterNUICallback('giveAmmo', function(data, cb)
  ESX.TriggerServerCallback('esx_admin:giveAmmo', function()
    SendNUIMessage({
      type = "notification",
      message = "All weapons given"
    })
  end, data.id, data.weapon, data.ammo)
end)

RegisterNUICallback('addMoney', function(data, cb)
  ESX.TriggerServerCallback('esx_admin:addMoney', function()
    SendNUIMessage({
      type = "notification",
      message = "All weapons given"
    })
  end, data.id, data.amount, data.method)
end)

-- Polling the server for player data
-- temporarily solution until permissions are implemented
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(60000) -- 1 minute
    if display then
      UpdatePlayers()
    end
  end
end)