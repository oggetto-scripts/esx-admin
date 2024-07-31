function getPlayerVehicles(xPlayer)
  local identifier = xPlayer.getIdentifier()
  local veh = {}

  local vehicles = MySQL.query.await(
    'SELECT * FROM owned_vehicles WHERE owner = ?',
    { identifier }
  )

  for v = 1, #vehicles, 1 do
    local vehicle = vehicles[v]
    local vehicleProps = json.decode(vehicle.vehicle)
    
    table.insert(veh, {
      plate = vehicle.plate,
      mileage = vehicle.mileage,
      type = vehicle.type,
      model = vehicleProps.model,
      owner = ESX.GetPlayerFromIdentifier(vehicle.owner),
      stored = vehicle.stored == 0,
    })
  end

  return veh
end