local display = false

RegisterCommand("esxAdmin", function()
  Citizen.CreateThread(function()
    TriggerEvent('nui:toggle', true)
  end)
end, false)


RegisterNetEvent('nui:toggle')
AddEventHandler('nui:toggle', function()
  SendNUIMessage({
    type = "ui",
    display = not display
  })
  display = not display
end)