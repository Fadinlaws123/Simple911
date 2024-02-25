Config = {}

Config.Emergency = {

    Messages = {
        InvalidArgs = "~w~[~b~Simple911~w~]: ~r~ERROR: ~y~Please state a reason for calling!",
        CallPDSucess = "~w~[~b~Simple911~w~]: ~g~SUCESS: ~y~Your report has been sent to the police!",
        CallTowSucess = "~w~[~b~Simple911~w~]: ~g~SUCESS: ~y~Your report has been sent to a tow service nearby!",
    },

    Logs = {

        enableLogging = true, -- Enable / Disable using discord logs for each command. 

        policeLogs = "WEBHOOK",
        towLogs = "WEBHOOK"
    },

    Blips = {

        TowBlip = {
            timeout = 120, -- How long the blip will stay on the map until removed (Seconds)
            cooldown = 60, -- How long someone has to wait before using the command again. (Seconds)
            enableBlip = true, -- Enable / Disable the blip on the map.
            blipIcon = false, -- Change the map icon to be an icon or just a circle radius (true = icon | false = radius on map.)
            showInChat = true, -- Change it so you can see 311 calls in chat or not.
            blipColor = 66, -- Color of the blip / circle. (Can be changed using this: https://docs.fivem.net/docs/game-references/blips/#blip-colors)
            blip = 66, -- Icon of the blip that shows. (Can be changed used this: https://docs.fivem.net/docs/game-references/blips/#blips)
            blipSize = 0.9, -- Size of the blip that appears on the map (Does not effect circle blip.)
        },

        PoliceBlip = {
            timeout = 120, -- How long the blip will stay on the map until removed (Seconds)
            cooldown = 60, -- How long someone has to wait before using the command again. (Seconds)
            enableBlip = true, -- Enable / Disable the blip on the map.
            blipIcon = false, -- Change the map icon to be an icon or just a circle radius (true = icon | false = radius on map.)
            showInChat = true, -- Change it so you can see 911 calls in chat or not.
            blipColor = 38, -- Color of the blip / circle. (Can be changed using this: https://docs.fivem.net/docs/game-references/blips/#blip-colors)
            blip = 66, -- Icon of the blip that shows. (Can be changed used this: https://docs.fivem.net/docs/game-references/blips/#blips)
            blipSize = 0.9, -- Size of the blip that appears on the map (Does not effect circle blip.)
        }
    }
}
