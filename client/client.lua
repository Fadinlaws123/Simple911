    
    TriggerEvent('chat:addSuggestion', Config.Emergency.Basic.policeCommand, 'Call the police!', {
        {name = 'Report crime!', help = 'Call for police officers to your current location!'}
    })
    TriggerEvent('chat:addSuggestion', Config.Emergency.Basic.medicalCommand, 'Call Medical Services!', {
        {name = 'Call Medical', help = 'Call for medical services to your location!'}
    })
    TriggerEvent('chat:addSuggestion', Config.Emergency.Basic.fireCommand, 'Call the Fire Department!', {
        {name = 'Report a fire!!', help = 'Call for the fire department to your location!'}
    })
    TriggerEvent('chat:addSuggestion', Config.Emergency.Basic.towCommand, 'Call for tow services!', {
        {name = 'Call a tow truck!', help = 'Call for a tow truck / mobile mechanic to your location!'}
    })
    
    RegisterCommand(Config.Emergency.Basic.policeCommand, function(source, args)

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
                AddTextComponentString("Active Law Enforcement Call by: " .. name)
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
                AddTextComponentString("Active Law Enforcement Call by: " .. name)
                EndTextCommandSetBlipName(PDBlip3)
                SetTimeout(Config.Emergency.Blips.PoliceBlip.timeout * 1000, function()
                    RemoveBlip(PDBlip3)
                end)
            end
        end
    end)

    RegisterCommand(Config.Emergency.Basic.medicalCommand, function(source, args)

        local name = GetPlayerName(PlayerId())
        local ped = GetPlayerPed(PlayerId())
        local x, y, z = table.unpack(GetEntityCoords(ped, true))
        local street = GetStreetNameAtCoord(x, y, z)
        local location = GetStreetNameFromHashKey(street)
        local msg = table.concat(args, ' ')

        if msg == '' then 
            Notify(Config.Emergency.Messages.InvalidArgs)
        else
            TriggerServerEvent('Simple911:Medical:Call911', location, msg, x, y, z, name)
        end
    end)

    RegisterNetEvent('Simple911:Medical:Blip')
    AddEventHandler('Simple911:Medical:Blip', function(name, x, y, z)
        if (Config.Emergency.Blips.MedicalBlip.enableBlip == true) then
            if (Config.Emergency.Blips.MedicalBlip.blipIcon == false) then
                blip = nil
                blips = {}
                local blipRadius = 175.0
                
                local blip = AddBlipForRadius(x, y, z, blipRadius)
                
                SetBlipHighDetail(blip, true)
                SetBlipColour(blip, Config.Emergency.Blips.MedicalBlip.blipColor)
                SetBlipAlpha(blip, 128)
                
                local MedicalBlip1 = AddBlipForCoord(x, y, z)
                local MedicalBlip2 = AddBlipForCoord(x, y, z)
                
                SetBlipSprite(MedicalBlip1, sprite)
                SetBlipSprite(MedicalBlip2, Config.Emergency.Blips.MedicalBlip.blip)
                SetBlipDisplay(MedicalBlip1, true)
                SetBlipScale(MedicalBlip1, Config.Emergency.Blips.MedicalBlip.blipSize)
                SetBlipScale(MedicalBlip2, 0.0)
                SetBlipColour(MedicalBlip1, Config.Emergency.Blips.MedicalBlip.blipColor)
                SetBlipColour(MedicalBlip2, Config.Emergency.Blips.MedicalBlip.blipColor)
                SetBlipAsShortRange(MedicalBlip1, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active Medical Call by: " .. name)
                EndTextCommandSetBlipName(MedicalBlip2)
                table.insert(blips, MedicalBlip1)
                Wait(Config.Emergency.Blips.MedicalBlip.timeout * 1000)
                for i, MedicalBlip1 in pairs(blips) do
                    RemoveBlip(blip)
                    RemoveBlip(MedicalBlip1)
                end
            else
                local MedicalBlip3 = AddBlipForCoord(x, y, z)
                SetBlipSprite(MedicalBlip3, Config.Emergency.Blips.MedicalBlip.blip)
                SetBlipDisplay(MedicalBlip3, 4)
                SetBlipScale(MedicalBlip3, Config.Emergency.Blips.MedicalBlip.blipSize)
                SetBlipColour(MedicalBlip3, Config.Emergency.Blips.MedicalBlip.blipColor)
                SetBlipAsShortRange(MedicalBlip3, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active Medical Call by: " .. name)
                EndTextCommandSetBlipName(MedicalBlip3)
                SetTimeout(Config.Emergency.Blips.MedicalBlip.timeout * 1000, function()
                    RemoveBlip(MedicalBlip3)
                end)
            end
        end
    end)

    RegisterCommand(Config.Emergency.Basic.fireCommand, function(source, args)

        local name = GetPlayerName(PlayerId())
        local ped = GetPlayerPed(PlayerId())
        local x, y, z = table.unpack(GetEntityCoords(ped, true))
        local street = GetStreetNameAtCoord(x, y, z)
        local location = GetStreetNameFromHashKey(street)
        local msg = table.concat(args, ' ')

        if msg == '' then 
            Notify(Config.Emergency.Messages.InvalidArgs)
        else
            TriggerServerEvent('Simple911:Fire:Call911', location, msg, x, y, z, name)
        end
    end)

    RegisterNetEvent('Simple911:Fire:Blip')
    AddEventHandler('Simple911:Fire:Blip', function(name, x, y, z)
        if (Config.Emergency.Blips.FireBlip.enableBlip == true) then
            if (Config.Emergency.Blips.FireBlip.blipIcon == false) then
                blip = nil
                blips = {}
                local blipRadius = 175.0
                
                local blip = AddBlipForRadius(x, y, z, blipRadius)
                
                SetBlipHighDetail(blip, true)
                SetBlipColour(blip, Config.Emergency.Blips.FireBlip.blipColor)
                SetBlipAlpha(blip, 128)
                
                local FireBlip1 = AddBlipForCoord(x, y, z)
                local FireBlip2 = AddBlipForCoord(x, y, z)
                
                SetBlipSprite(FireBlip1, sprite)
                SetBlipSprite(FireBlip2, Config.Emergency.Blips.FireBlip.blip)
                SetBlipDisplay(FireBlip1, true)
                SetBlipScale(FireBlip1, Config.Emergency.Blips.FireBlip.blipSize)
                SetBlipScale(FireBlip2, 0.0)
                SetBlipColour(FireBlip1, Config.Emergency.Blips.FireBlip.blipColor)
                SetBlipColour(FireBlip2, Config.Emergency.Blips.FireBlip.blipColor)
                SetBlipAsShortRange(FireBlip1, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active Fire Call by: " .. name)
                EndTextCommandSetBlipName(FireBlip2)
                table.insert(blips, FireBlip1)
                Wait(Config.Emergency.Blips.FireBlip.timeout * 1000)
                for i, FireBlip1 in pairs(blips) do
                    RemoveBlip(blip)
                    RemoveBlip(FireBlip1)
                end
            else
                local FireBlip3 = AddBlipForCoord(x, y, z)
                SetBlipSprite(FireBlip3, Config.Emergency.Blips.FireBlip.blip)
                SetBlipDisplay(FireBlip3, 4)
                SetBlipScale(FireBlip3, Config.Emergency.Blips.FireBlip.blipSize)
                SetBlipColour(FireBlip3, Config.Emergency.Blips.FireBlip.blipColor)
                SetBlipAsShortRange(FireBlip3, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active Fire Call by: " .. name)
                EndTextCommandSetBlipName(FireBlip3)
                SetTimeout(Config.Emergency.Blips.FireBlip.timeout * 1000, function()
                    RemoveBlip(FireBlip3)
                end)
            end
        end
    end)

    RegisterCommand(Config.Emergency.Basic.towCommand, function(source, args)

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