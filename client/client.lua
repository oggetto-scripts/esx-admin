RegisterKeyMapping('esxAdmin', 'Open ESXAdmin Menu', 'keyboard', '')

-- Polling the server for player data
-- temporarily solution until permissions are implemented
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(60000) -- 1 minute
    UpdatePlayers()
  end
end)
