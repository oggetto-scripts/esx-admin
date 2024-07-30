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
