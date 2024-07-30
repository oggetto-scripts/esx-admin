RegisterNUICallback('openInTxAdmin', function(data, cb)
  ExecuteCommand('txadmin ' .. data.id)
end)