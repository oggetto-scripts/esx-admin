ESX = exports['es_extended']:getSharedObject()

local display = false

RegisterNetEvent('nui:toggle')
AddEventHandler('nui:toggle', function()
  SendNUIMessage({
    type = "ui",
    display = not display
  })

  ESX.TriggerServerCallback('esx_admin:get_players', function(players)
  
    SendNUIMessage({
      type = "players",
      data = players
    })
  end)

  SetNuiFocus(true, false)
  SetNuiFocusKeepInput(true)
  display = not display
end)

RegisterNUICallback('close', function()
  SendNUIMessage({
    type = "ui",
    display = false
  })
  SetNuiFocus(false, false)
  SetNuiFocusKeepInput(false)
  display = false
end)
