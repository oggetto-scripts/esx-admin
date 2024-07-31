RegisterNUICallback('r:getPlayerVehicles', function(data)

  ESX.TriggerServerCallback('esx_admin:get_player_vehicles', function(v, id)
    local vehicles = {}

    for i = 1, #v, 1 do
      local vehicle = v[i]

      table.insert(vehicles, {
        plate = vehicle.plate,
        mileage = vehicle.mileage,
        type = vehicle.type,
        model = {
          name = GetDisplayNameFromVehicleModel(vehicle.model),
          model = vehicle.model
        },
        owner = vehicle.owner,
        stored = vehicle.stored
      })
    end

    SendNUIMessage({
      type = "r:vehicles",
      data = {
        vehicles = vehicles,
        player = id
      }
    })

  end, data.id)
end)