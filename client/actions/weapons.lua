RegisterNUICallback('giveWeapon', function(data, cb)
  ESX.TriggerServerCallback('esx_admin:giveWeapon', function(status, message)
    SendNUIMessage({
      type = "notification",
      data = {
        message = message,
        status = status,
      }
    })
  end, data.id, data.weapon)
end)

RegisterNUICallback('giveAmmo', function(data, cb)
  ESX.TriggerServerCallback('esx_admin:giveAmmo', function(status, message)
    SendNUIMessage({
      type = "notification",
      data = {
        message = message,
        status = status,
      }
    })
  end, data.id, data.type, data.ammo)
end)

RegisterNUICallback('removeWeapon', function(data, cb)
  ESX.TriggerServerCallback('esx_admin:removeWeapon', function(status, message)
    SendNUIMessage({
      type = "notification",
      data = {
        message = message,
        status = status,
      }
    })
  end, data.id, data.weapon)
end)

RegisterNUICallback('removeAmmo', function(data, cb)
  ESX.TriggerServerCallback('esx_admin:removeAmmo', function(status, message)
    SendNUIMessage({
      type = "notification",
      data = {
        message = message,
        status = status,
      }
    })
  end, data.id, data.type, data.ammo)
end)
