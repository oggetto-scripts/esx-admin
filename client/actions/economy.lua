RegisterNUICallback('addMoney', function(data, cb)
  ESX.TriggerServerCallback('esx_admin:addMoney', function(status, message)
    SendNUIMessage({
      type = "notification",
      data = {
        message = message,
        status = status,
      }
    })
  end, data.id, data.amount, data.method)
end)

RegisterNUICallback('removeMoney', function(data, cb)
  ESX.TriggerServerCallback('esx_admin:removeMoney', function(status, message)
    SendNUIMessage({
      type = "notification",
      data = {
        message = message,
        status = status,
      }
    })
  end, data.id, data.amount, data.method)
end)

RegisterNUICallback('setMoney', function(data, cb)
  ESX.TriggerServerCallback('esx_admin:setMoney', function(status, message)
    SendNUIMessage({
      type = "notification",
      data = {
        message = message,
        status = status,
      }
    })
  end, data.id, data.amount, data.method)
end)