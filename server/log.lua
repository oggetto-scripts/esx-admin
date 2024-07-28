function ActionExecuted(action, player)
  print(
    "^1[ACTION]^7 Admin " .. player .. " executed action " .. action .. " at " .. os.date("%c")
  )
end