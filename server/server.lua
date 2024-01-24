    RegisterNetEvent('Simple911:Police:Call911')
    AddEventHandler('Simple911:Police:Call911', function(location, msg, x, y, z, name, p)
        local pName = GetPlayerName(source)
        local p = GetPlayerPed(source)
        local timestamp = os.date("%c")

        if (Config.Emergency.Blips.PoliceBlip.showInChat == true) then
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^5📞Incoming Police Report:'}
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
            sendPoliceDiscord('Simple911 \n', '**→ Police called by: __' .. GetPlayerName(source) .. '__ \n ** **→ Report Location: ** *' .. location .. '*\n** → Report Details:** *' .. msg .. '*\n \n**→ Time police were called:** *' .. timestamp .. '* \n **→ Command Used: ** *' .. Config.Emergency.Basic.policeCommand .. '*')
        end
        if Config.Emergency.Blips.PoliceBlip.enableBlip then
            TriggerClientEvent('Simple911:Police:Blip', -1, name, x, y, z)
        end
    end)

    RegisterNetEvent('Simple911:Medical:Call911')
    AddEventHandler('Simple911:Medical:Call911', function(location, msg, x, y, z, name, p)
        local pName = GetPlayerName(source)
        local p = GetPlayerPed(source)
        local timestamp = os.date("%c")

        if (Config.Emergency.Blips.MedicalBlip.showInChat == true) then
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^6📞Incoming Medical Report:'}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^6🧍[Caller Name]: ^r^7' .. GetPlayerName(source)}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^6🗺️[Location]: ^r^7' .. location}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^6⚠️[Report]: ^r^7' .. msg}
            })
        end
        if Config.Emergency.Logs.enableLogging == true then
            sendMedicalDiscord('Simple911 \n', '**→ Medical Services called by: __' .. GetPlayerName(source) .. '__ \n ** **→ Report Location: ** *' .. location .. '*\n** → Report Details:** *' .. msg .. '*\n \n**→ Time Medical Services were called:** *' .. timestamp .. '* \n **→ Command Used: ** *' .. Config.Emergency.Basic.medicalCommand .. '*')
        end
        if Config.Emergency.Blips.MedicalBlip.enableBlip then
            TriggerClientEvent('Simple911:Medical:Blip', -1, name, x, y, z)
        end
    end)

    RegisterNetEvent('Simple911:Fire:Call911')
    AddEventHandler('Simple911:Fire:Call911', function(location, msg, x, y, z, name, p)
        local pName = GetPlayerName(source)
        local p = GetPlayerPed(source)
        local timestamp = os.date("%c")

        if (Config.Emergency.Blips.FireBlip.showInChat == true) then
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^1📞Incoming Fire Report:'}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^1🧍[Caller Name]: ^r^7' .. GetPlayerName(source)}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^1🗺️[Location]: ^r^7' .. location}
            })
            TriggerClientEvent('chat:addMessage', -1, {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^1⚠️[Report]: ^r^7' .. msg}
            })
        end
        if Config.Emergency.Logs.enableLogging == true then
            sendFireDiscord('Simple911 \n', '**→ Fire Department called by: __' .. GetPlayerName(source) .. '__ \n ** **→ Report Location: ** *' .. location .. '*\n** → Report Details:** *' .. msg .. '*\n \n**→ Time the Fire Department were called:** *' .. timestamp .. '* \n **→ Command Used: ** *' .. Config.Emergency.Basic.fireCommand .. '*')
        end
        if Config.Emergency.Blips.FireBlip.enableBlip then
            TriggerClientEvent('Simple911:Fire:Blip', -1, name, x, y, z)
        end
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
            sendTowDiscord('Simple911 \n', '**→ Tow Services were called by: __' .. GetPlayerName(source) .. '__ \n ** **→ Report Location: ** *' .. location .. '*\n** → Report Details:** *' .. msg .. '*\n \n**→ Time a Tow Service was called:** *' .. timestamp .. '* \n **→ Command Used: ** *' .. Config.Emergency.Basic.towCommand .. '*')
        end
        if Config.Emergency.Blips.TowBlip.enableBlip then
            TriggerClientEvent('Simple911:Tow:Blip', -1, name, x, y, z)
        end
    end)

    function sendPoliceDiscord(name, message)
	    local content = {
            {
                ["color"] =  '255',
                ["title"] = "**New Tow Services Report**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = 'Made by SimpleDevelopments'
                }
            }
        }
  	    PerformHttpRequest(Config.Emergency.Logs.policeLogs, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
    end

    function sendMedicalDiscord(name, message)
	    local content = {
            {
                ["color"] =  '7621288',
                ["title"] = "**New Medical Services Report**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = 'Made by SimpleDevelopments'
                }
            }
        }
  	    PerformHttpRequest(Config.Emergency.Logs.medicalLogs, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
    end

    function sendFireDiscord(name, message)
	    local content = {
            {
                ["color"] =  '16711680',
                ["title"] = "**New Fire Department Report**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = 'Made by SimpleDevelopments'
                }
            }
        }
  	    PerformHttpRequest(Config.Emergency.Logs.fireLogs, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
    end

    function sendTowDiscord(name, message)
	    local content = {
            {
                ["color"] =  '16776960',
                ["title"] = "**New Tow Report**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = 'Made by SimpleDevelopments'
                }
            }
        }
  	    PerformHttpRequest(Config.Emergency.Logs.towLogs, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
    end

print('^4This script was made by Fadin_laws! ^3For support join our discord @ ^1https://discord.gg/mxcu8Az8XG.^0')