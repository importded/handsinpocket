ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local handsInPocket = false

RegisterCommand("handsinpocket", function()
    local playerPed = PlayerPedId()
    
    if handsInPocket then
        ClearPedTasks(playerPed)
        handsInPocket = false
    else
        RequestAnimDict("missbigscore1")
        while not HasAnimDictLoaded("missbigscore1") do
            Citizen.Wait(100)
        end
        TaskPlayAnim(playerPed, "missbigscore1", "idle_a", 8.0, 8.0, -1, 49, 0, false, false, false)
        handsInPocket = true
    end
end, false)

RegisterKeyMapping('handsinpocket', 'Hands in Pocket', 'keyboard', 'F5')
