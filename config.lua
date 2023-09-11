Config = {}

Config.MainFunctions = {
    emergency911 = true, -- Enable / Disable the /911 command.
    emergency311 = true -- Enable / Disable the /311 command.
}

Config.Emergency911 = {
    timeout = 120, -- How long the blip will stay on the map until removed (Seconds)
    cooldown = 120, -- How long someone has to wait before using the command again. (Seconds)
    enableBlip = true, -- Enable / Disable the blip on the map.
    blipIcon = true, -- Change the map icon to be an icon or just a circle radius (true = icon | false = radius on map.)
    showInChat = true, -- Change it so you can see 911 calls in chat or not.
    blipColor = 3, -- Color of the blip / circle. (Can be changed using this: https://docs.fivem.net/docs/game-references/blips/#blip-colors)
    blip = 66, -- Icon of the blip that shows. (Can be changed used this: https://docs.fivem.net/docs/game-references/blips/#blips)
    blipSize = 0.9, -- Size of the blip that appears on the map (Does not effect circle blip.)
}

Config.Emergency311 = {
    timeout = 120, -- How long the blip will stay on the map until removed (Seconds)
    cooldown = 120, -- How long someone has to wait before using the command again. (Seconds)
    enableBlip = true, -- Enable / Disable the blip on the map.
    blipIcon = true, -- Change the map icon to be an icon or just a circle radius (true = icon | false = radius on map.)
    showInChat = true, -- Change it so you can see 311 calls in chat or not.
    blipColor = 66, -- Color of the blip / circle. (Can be changed using this: https://docs.fivem.net/docs/game-references/blips/#blip-colors)
    blip = 66, -- Icon of the blip that shows. (Can be changed used this: https://docs.fivem.net/docs/game-references/blips/#blips)
    blipSize = 0.9, -- Size of the blip that appears on the map (Does not effect circle blip.)
}