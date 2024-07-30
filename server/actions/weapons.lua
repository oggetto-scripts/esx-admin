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

ESX.RegisterServerCallback('esx_admin:removeWeapon', function(src, cb, id, weapon)
  if not IsPlayerAceAllowed(src, "command.esxAdmin") then
      return
  end

  local xPlayer = ESX.GetPlayerFromId(id)
  xPlayer.removeInventoryItem(weapon, 1)

  ActionExecuted("removeWeapon", xPlayer.getName() .. " (" .. xPlayer.getIdentifier() .. ")")

  cb(0, "Weapon removed successfully")
end)

ESX.RegisterServerCallback('esx_admin:removeAmmo', function(src, cb, id, type, ammo)
  if not IsPlayerAceAllowed(src, "command.esxAdmin") then
      return
  end

  local xPlayer = ESX.GetPlayerFromId(id)
  xPlayer.removeInventoryItem(type, ammo)

  ActionExecuted("removeAmmo", xPlayer.getName() .. " (" .. xPlayer.getIdentifier() .. ")")

  cb(0, "Ammo removed successfully")
end)