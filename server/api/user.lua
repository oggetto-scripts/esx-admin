function getPlayer(id)
  local xPlayer = ESX.GetPlayerFromId(id)

  if not xPlayer then
    return {}
  end

  local u = MySQL.query.await(
    'SELECT * FROM users WHERE identifier = ?',
    { xPlayer.getIdentifier() }
  )[1]

  return {
    id = xPlayer.source,
    name = xPlayer.getName(),
    username = GetPlayerName(xPlayer.source),
    identifier = xPlayer.getIdentifier(),
    job = {
      name = xPlayer.job.name,
      grade = xPlayer.job.grade
    },
    group = xPlayer.getGroup(),
    money = xPlayer.getMoney(),
    bank = xPlayer.getAccount('bank').money,
    black_money = xPlayer.getAccount('black_money').money,
    bank_pin = u.pincode,
    pincode = u.dateofbirth,
    ped = {
      sex = u.sex,
      height = u.height,
    }
  }
end
