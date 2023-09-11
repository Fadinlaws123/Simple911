if(Config.MainFunctions.emergency911 == true) then
    RegisterNetEvent('Simple911:new')
    AddEventHandler('Simple911:new', function(name, description, coords)
        TriggerClientEvent('Simple911:new', -1, name, description, coords)
    end)
end

if(Config.MainFunctions.emergency311 == true) then
    RegisterNetEvent('Simple311:new')
    AddEventHandler('Simple311:new', function(name, description, coords)
        TriggerClientEvent('Simple311:new', -1, name, description, coords)
    end)
end

print('^4This script was made by Fadin_laws! ^3For support join our discord @ ^1https://discord.gg/mxcu8Az8XG.^0')