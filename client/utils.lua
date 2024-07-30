function UpdatePlayers()
  ESX.TriggerServerCallback('esx_admin:get_players', function(players)
    print("Update players, sending to NUI")
    SendNUIMessage({
      type = "players",
      data = players
    })
  end)
end
