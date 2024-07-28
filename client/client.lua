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

RegisterNUICallback('close', function(data, cb)
  SendNUIMessage({
    type = "ui",
    display = false
  })

  SetNuiFocus(false, false)
  SetNuiFocusKeepInput(false)
  display = false
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