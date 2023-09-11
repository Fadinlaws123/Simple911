if (Config.MainFunctions.emergency911 == true) then
    local onCooldown = false
    
    RegisterNetEvent('Simple911:new')
    AddEventHandler('Simple911:new', function(name, description, coords)
        local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        local streetName = GetStreetNameFromHashKey(streetHash)
        
        if (Config.Emergency911.showInChat == true) then
            TriggerEvent('chat:addMessage', {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^5📞Incoming 911 Report:'}
            })
            TriggerEvent('chat:addMessage', {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^5🧍[Caller Name]: ^r^7' .. name}
            })
            TriggerEvent('chat:addMessage', {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^5🗺️[Location]: ^r^7' .. streetName}
            })
            TriggerEvent('chat:addMessage', {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^5⚠️[Report]: ^r^7' .. description}
            })
        end
        
        if (Config.Emergency911.enableBlip == true) then
            if (Config.Emergency911.blipIcon == false) then
                blip = nil
                blips = {}
                local blipRadius = 175.0
                
                local blip = AddBlipForRadius(coords.x, coords.y, coords.z, blipRadius)
                
                SetBlipHighDetail(blip, true)
                SetBlipColour(blip, Config.Emergency911.blipColor)
                SetBlipAlpha(blip, 128)
                
                local blip1 = AddBlipForCoord(coords.x, coords.y, coords.z)
                local blip4 = AddBlipForCoord(coords.x, coords.y, coords.z)
                
                SetBlipSprite(blip1, sprite)
                SetBlipSprite(blip4, Config.Emergency911.blip)
                SetBlipDisplay(blip1, true)
                SetBlipScale(blip1, Config.Emergency911.blipSize)
                SetBlipScale(blip4, 0.0)
                SetBlipColour(blip1, Config.Emergency911.blipColor)
                SetBlipColour(blip4, Config.Emergency911.blipColor)
                SetBlipAsShortRange(blip1, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active 911 Call by " .. name)
                EndTextCommandSetBlipName(blip4)
                table.insert(blips, blip1)
                Wait(Config.Emergency911.timeout * 1000)
                for i, blip1 in pairs(blips) do
                    RemoveBlip(blip)
                    RemoveBlip(blip1)
                end
            else
                local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
                SetBlipSprite(blip, Config.Emergency911.blip)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, Config.Emergency911.blipSize)
                SetBlipColour(blip, Config.Emergency911.blipColor)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active 911 Call by " .. name)
                EndTextCommandSetBlipName(blip)
                SetTimeout(Config.Emergency911.timeout * 1000, function()
                    RemoveBlip(blip)
                end)
            end
        end
    end)
    
    
    RegisterCommand('911', function(source, args, rawCommand)
            
            TriggerEvent('chat:addSuggestion', '/911', 'Call 911', {
                {name = 'Report crime!', help = 'Call for emergency services to your location!'}
            })
            
            if onCooldown then
                TriggerEvent('chat:addMessage', {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {'^0[^1Simple911^0] ^3You must wait ' .. Config.Emergency911.cooldown .. ' seconds before you can call 911 again!'}
                })
                return
            end
            
            local player = GetPlayerPed(-1)
            local playerPos = GetEntityCoords(player)
            local name = GetPlayerName(PlayerId())
            local description = table.concat(args, ' ')
            
            if description == '' then
                TriggerEvent('chat:addMessage', {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {'^0[^1Simple911^0] ^3You need to put a reason to call 911!'}
                })
                return
            end
            
            TriggerServerEvent('Simple911:new', name, description, playerPos)
            onCooldown = true
            SetTimeout(Config.Emergency911.cooldown * 1000, function()
                onCooldown = false
            end)
    end, false)
end

if (Config.MainFunctions.emergency311 == true) then
    local onCooldown = false
    
    RegisterNetEvent('Simple311:new')
    AddEventHandler('Simple311:new', function(name, description, coords)
        local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        local streetName = GetStreetNameFromHashKey(streetHash)
        
        if (Config.Emergency311.showInChat == true) then
            TriggerEvent('chat:addMessage', {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^3📞Incoming 311 Report:'}
            })
            TriggerEvent('chat:addMessage', {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^3🧍[Caller Name]: ^r^7' .. name}
            })
            TriggerEvent('chat:addMessage', {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^3🗺️[Location]: ^r^7' .. streetName}
            })
            TriggerEvent('chat:addMessage', {
                color = {0, 204, 204},
                multiline = false,
                args = {'^*^3⚠️[Report]: ^r^7' .. description}
            })
        end
        
        if (Config.Emergency311.enableBlip == true) then
            if (Config.Emergency311.blipIcon == false) then
                blip = nil
                blips = {}
                local blipRadius = 175.0
                
                local blip = AddBlipForRadius(coords.x, coords.y, coords.z, blipRadius)
                
                SetBlipHighDetail(blip, true)
                SetBlipColour(blip, Config.Emergency311.blipColor)
                SetBlipAlpha(blip, 128)
                
                local blip1 = AddBlipForCoord(coords.x, coords.y, coords.z)
                local blip4 = AddBlipForCoord(coords.x, coords.y, coords.z)
                
                SetBlipSprite(blip1, sprite)
                SetBlipSprite(blip4, Config.Emergency311.blip)
                SetBlipDisplay(blip1, true)
                SetBlipScale(blip1, Config.Emergency311.blipSize)
                SetBlipScale(blip4, 0.0)
                SetBlipColour(blip1, Config.Emergency311.blipColor)
                SetBlipColour(blip4, Config.Emergency311.blipColor)
                SetBlipAsShortRange(blip1, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active 311 Call by " .. name)
                EndTextCommandSetBlipName(blip4)
                table.insert(blips, blip1)
                Wait(Config.Emergency311.timeout * 1000)
                for i, blip1 in pairs(blips) do
                    RemoveBlip(blip)
                    RemoveBlip(blip1)
                end
            else
                local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
                SetBlipSprite(blip, Config.Emergency311.blip)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, Config.Emergency311.blipSize)
                SetBlipColour(blip, Config.Emergency311.blipColor)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Active 311 Call by " .. name)
                EndTextCommandSetBlipName(blip)
                SetTimeout(Config.Emergency311.timeout * 1000, function()
                    RemoveBlip(blip)
                end)
            end
        end
    end)
    
    
    RegisterCommand('311', function(source, args, rawCommand)
            
            TriggerEvent('chat:addSuggestion', '/311', 'Call 311', {
                {name = 'Call for DOT!', help = 'Call for emergency services to your location!'}
            })
            
            if onCooldown then
                TriggerEvent('chat:addMessage', {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {'^0[^1Simple911^0] ^3You must wait ' .. Config.Emergency311.cooldown .. ' seconds before you can call 911 again!'}
                })
                return
            end
            
            local player = GetPlayerPed(-1)
            local playerPos = GetEntityCoords(player)
            local name = GetPlayerName(PlayerId())
            local description = table.concat(args, ' ')
            
            if description == '' then
                TriggerEvent('chat:addMessage', {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {'^0[^1Simple911^0] ^3You need to put a reason to call 311!'}
                })
                return
            end
            
            TriggerServerEvent('Simple311:new', name, description, playerPos)
            onCooldown = true
            SetTimeout(Config.Emergency311.cooldown * 1000, function()
                onCooldown = false
            end)
    end, false)
end
