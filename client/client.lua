local onCooldown = false
local onCooldown2 = false

    TriggerEvent('chat:addSuggestion', '/911', 'Call the police!', {
        {name = 'Report crime!', help = 'Call for police officers to your current location!'}
    })
    TriggerEvent('chat:addSuggestion', '/311', 'Call for tow services!', {
        {name = 'Call a tow truck!', help = 'Call for a tow truck / mobile mechanic to your location!'}
    })
    
    RegisterCommand('911', function(source, args)
        local player = source

        if onCooldown == true then
            if Config.Emergency.MessagesSystem.MessageStyle == '1' then 
                Notify('[~b~Simple911~w~]: ~y~You need to wait ~r~' .. Config.Emergency.Blips.PoliceBlip.cooldown .. ' second(s) ~y~before calling 911!')
                return
            elseif Config.Emergency.MessagesSystem.MessageStyle == '2' then
                TriggerServerEvent('Simple911:911:Message', -1)
                return
            else
                print('ERROR: Please make sure to select a valid message style via the config!')
            end
        end

        local name = GetPlayerName(PlayerId())
        local ped = GetPlayerPed(PlayerId())
        local x, y, z = table.unpack(GetEntityCoords(ped, true))
        local street = GetStreetNameAtCoord(x, y, z)
        local location = GetStreetNameFromHashKey(street)
        local msg = table.concat(args, ' ')
        

        if msg == '' then 
            Notify(Config.Emergency.Messages.InvalidArgs)
        else
            TriggerServerEvent('Simple911:Police:Call911', location, msg, x, y, z, name)
        end

        onCooldown = true
        SetTimeout(Config.Emergency.Blips.PoliceBlip.cooldown * 1000, function()
            onCooldown = false
        end)
    end)

    RegisterNetEvent('Simple911:Police:Blip')
    AddEventHandler('Simple911:Police:Blip', function(name, x, y, z)
        if (Config.Emergency.Blips.PoliceBlip.enableBlip == true) then
            if (Config.Emergency.Blips.PoliceBlip.blipIcon == false) then
                blip = nil
                blips = {}
                local blipRadius = 175.0
                
                local blip = AddBlipForRadius(x, y, z, blipRadius)
                
                SetBlipHighDetail(blip, true)
                SetBlipColour(blip, Config.Emergency.Blips.PoliceBlip.blipColor)
                SetBlipAlpha(blip, 128)
                
                local PDBlip1 = AddBlipForCoord(x, y, z)
                local PDBlip2 = AddBlipForCoord(x, y, z)
                
                SetBlipSprite(PDBlip1, sprite)
                SetBlipSprite(PDBlip2, Config.Emergency.Blips.PoliceBlip.blip)
                SetBlipDisplay(PDBlip1, true)
                SetBlipScale(PDBlip1, Config.Emergency.Blips.PoliceBlip.blipSize)
                SetBlipScale(PDBlip2, 0.0)
                SetBlipColour(PDBlip1, Config.Emergency.Blips.PoliceBlip.blipColor)
                SetBlipColour(PDBlip2, Config.Emergency.Blips.PoliceBlip.blipColor)
                SetBlipAsShortRange(PDBlip1, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active Emergency Call by: " .. name)
                EndTextCommandSetBlipName(PDBlip2)
                table.insert(blips, PDBlip1)
                Wait(Config.Emergency.Blips.PoliceBlip.timeout * 1000)
                for i, PDBlip1 in pairs(blips) do
                    RemoveBlip(blip)
                    RemoveBlip(PDBlip1)
                end
            else
                local PDBlip3 = AddBlipForCoord(x, y, z)
                SetBlipSprite(PDBlip3, Config.Emergency.Blips.PoliceBlip.blip)
                SetBlipDisplay(PDBlip3, 4)
                SetBlipScale(PDBlip3, Config.Emergency.Blips.PoliceBlip.blipSize)
                SetBlipColour(PDBlip3, Config.Emergency.Blips.PoliceBlip.blipColor)
                SetBlipAsShortRange(PDBlip3, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active Emergency Call by: " .. name)
                EndTextCommandSetBlipName(PDBlip3)
                SetTimeout(Config.Emergency.Blips.PoliceBlip.timeout * 1000, function()
                    RemoveBlip(PDBlip3)
                end)
            end
        end
    end)

    RegisterCommand('311', function(source, args)

        if onCooldown2 == true then
            if Config.Emergency.MessagesSystem.MessageStyle == '1' then 
                Notify('[~b~Simple911~w~]: ~y~You need to wait ~r~' .. Config.Emergency.Blips.TowBlip.cooldown .. ' second(s) ~y~before calling 911!')
                return
            elseif Config.Emergency.MessagesSystem.MessageStyle == '2' then
                TriggerServerEvent('Simple911:311:Message', -1)
                return
            else
                print('ERROR: Please make sure to select a valid message style via the config!')
            end
        end

        local name = GetPlayerName(PlayerId())
        local ped = GetPlayerPed(PlayerId())
        local x, y, z = table.unpack(GetEntityCoords(ped, true))
        local street = GetStreetNameAtCoord(x, y, z)
        local location = GetStreetNameFromHashKey(street)
        local msg = table.concat(args, ' ')

        if msg == '' then 
            Notify(Config.Emergency.Messages.InvalidArgs)
        else
            TriggerServerEvent('Simple911:Tow:Call911', location, msg, x, y, z, name)
        end

        onCooldown2 = true
        SetTimeout(Config.Emergency.Blips.TowBlip.cooldown * 1000, function()
            onCooldown2 = false
        end)
    end)

    RegisterNetEvent('Simple911:Tow:Blip')
    AddEventHandler('Simple911:Tow:Blip', function(name, x, y, z)
        if (Config.Emergency.Blips.TowBlip.enableBlip == true) then
            if (Config.Emergency.Blips.TowBlip.blipIcon == false) then
                blip = nil
                blips = {}
                local blipRadius = 175.0
                
                local blip = AddBlipForRadius(x, y, z, blipRadius)
                
                SetBlipHighDetail(blip, true)
                SetBlipColour(blip, Config.Emergency.Blips.TowBlip.blipColor)
                SetBlipAlpha(blip, 128)
                
                local TowBlip1 = AddBlipForCoord(x, y, z)
                local TowBlip2 = AddBlipForCoord(x, y, z)
                
                SetBlipSprite(TowBlip1, sprite)
                SetBlipSprite(TowBlip2, Config.Emergency.Blips.TowBlip.blip)
                SetBlipDisplay(TowBlip1, true)
                SetBlipScale(TowBlip1, Config.Emergency.Blips.TowBlip.blipSize)
                SetBlipScale(TowBlip2, 0.0)
                SetBlipColour(TowBlip1, Config.Emergency.Blips.TowBlip.blipColor)
                SetBlipColour(TowBlip2, Config.Emergency.Blips.TowBlip.blipColor)
                SetBlipAsShortRange(TowBlip1, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active Tow Call by: " .. name)
                EndTextCommandSetBlipName(TowBlip2)
                table.insert(blips, TowBlip1)
                Wait(Config.Emergency.Blips.TowBlip.timeout * 1000)
                for i, TowBlip1 in pairs(blips) do
                    RemoveBlip(blip)
                    RemoveBlip(TowBlip1)
                end
            else
                local TowBlip3 = AddBlipForCoord(x, y, z)
                SetBlipSprite(TowBlip3, Config.Emergency.Blips.TowBlip.blip)
                SetBlipDisplay(TowBlip3, 4)
                SetBlipScale(TowBlip3, Config.Emergency.Blips.TowBlip.blipSize)
                SetBlipColour(TowBlip3, Config.Emergency.Blips.TowBlip.blipColor)
                SetBlipAsShortRange(TowBlip3, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active Tow Call by: " .. name)
                EndTextCommandSetBlipName(TowBlip3)
                SetTimeout(Config.Emergency.Blips.TowBlip.timeout * 1000, function()
                    RemoveBlip(TowBlip3)
                end)
            end
        end
    end)
    

    function Notify( text )
        SetNotificationTextEntry( "STRING" )
        AddTextComponentString( text )
        DrawNotification( true, true )
      end
