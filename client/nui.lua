local display = false

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