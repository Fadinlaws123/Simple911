RegisterNetEvent('Simple911:Police:Call911')
    AddEventHandler('Simple911:Police:Call911', function(location, msg, x, y, z, name, p)
        local pName = GetPlayerName(source)
        local p = GetPlayerPed(source)
        local timestamp = os.date("%c")

        if (Config.Emergency.Blips.PoliceBlip.showInChat == true) then
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^5📞Incoming Emergency Report:'}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^5🧍[Caller Name]: ^r^7' .. GetPlayerName(source)}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^5🗺️[Location]: ^r^7' .. location}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^5⚠️[Report]: ^r^7' .. msg}
            })
        end
        if Config.Emergency.Logs.enableLogging == true then
            sendPoliceDiscord('Simple911 \n', '**→ 911 Called by: __' .. GetPlayerName(source) .. '__ \n ** **→ Report Location: ** *' .. location .. '*\n** → Report Details:** *' .. msg .. '*\n \n**→ Time 911 was called:** *' .. timestamp .. '* \n **→ Command Used: ** */911*')
        end
        if Config.Emergency.Blips.PoliceBlip.enableBlip then
            TriggerClientEvent('Simple911:Police:Blip', -1, name, x, y, z)
        end
    end)

    RegisterNetEvent('Simple911:911:Message')
    AddEventHandler('Simple911:911:Message', function()
        TriggerClientEvent('chat:addMessage', -1, {
            color = {0, 204, 204},
            args = {'[~b~Simple911~w~] ', '~r~ERROR: ~y~911 System is on cooldown! Please wait ' .. Config.Emergency.Blips.PoliceBlip.cooldown .. ' second(s) before calling again!'}
        })
    end)

    RegisterNetEvent('Simple911:311:Message')
    AddEventHandler('Simple911:311:Message', function()
        TriggerClientEvent('chat:addMessage', -1, {
            color = {0, 204, 204},
            args = {'[~b~Simple911~w~] ', '~r~ERROR: ~y~311 System is on cooldown! Please wait ' .. Config.Emergency.Blips.TowBlip.cooldown .. ' second(s) before calling again!'}
        })
    end)

    RegisterNetEvent('Simple911:Tow:Call911')
    AddEventHandler('Simple911:Tow:Call911', function(location, msg, x, y, z, name, p)
        local pName = GetPlayerName(source)
        local p = GetPlayerPed(source)
        local timestamp = os.date("%c")

        if (Config.Emergency.Blips.TowBlip.showInChat == true) then
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^3📞Incoming Tow Report:'}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^3🧍[Caller Name]: ^r^7' .. GetPlayerName(source)}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^3🗺️[Location]: ^r^7' .. location}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^3⚠️[Report]: ^r^7' .. msg}
            })
        end
        if Config.Emergency.Logs.enableLogging == true then
            sendTowDiscord('Simple911 \n', '**→ Tow Services were called by: __' .. GetPlayerName(source) .. '__ \n ** **→ Report Location: ** *' .. location .. '*\n** → Report Details:** *' .. msg .. '*\n \n**→ Time a Tow Service was called:** *' .. timestamp .. '* \n **→ Command Used: ** */tow*')
        end
        if Config.Emergency.Blips.TowBlip.enableBlip then
            TriggerClientEvent('Simple911:Tow:Blip', -1, name, x, y, z)
        end
    end)

    function sendPoliceDiscord(name, message)
	    local content = {
            {
                ["color"] =  '255',
                ["title"] = "**New Emergency Call Incoming**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = 'Made by SimpleDevelopments'
                }
            }
        }
  	    PerformHttpRequest(Config.Emergency.Logs.policeLogs, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
    end

    function sendTowDiscord(name, message)
	    local content = {
            {
                ["color"] =  '16776960',
                ["title"] = "**New Tow Report Incoming**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = 'Made by SimpleDevelopments'
                }
            }
        }
  	    PerformHttpRequest(Config.Emergency.Logs.towLogs, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
    end

print('^4This script was made by Fadin_laws! ^3For support join our discord @ ^1https://discord.gg/mxcu8Az8XG.^0')
