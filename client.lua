
--------------------------------------------------------


Citizen.CreateThread(function()
for _, model in ipairs(GetActiveHorses()) do
    local saddle = GetHorseSaddle(model)
    if saddle ~= 0 then
        print(saddle)
    end
end
end)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local pos = GetEntityCoords()
        local model = GetHashKey("A_C_Horse_TennesseeWalker_BlackRabicano")
        if whenKeyJustPressed(keys["UP"]) then
            TaskGoStraightToCoord(0xD49F9B0955C367DE, model, pos.x, pos.y, pos.z, 10.0, true, true, true, true) 
        end
    end
end)

function SpawnHorse()

            local localPed = PlayerPedId(-1)
            local model = GetHashKey("A_C_Horse_TennesseeWalker_BlackRabicano")
            local forward = Citizen.InvokeNative(0x2412D9C05BB09B97, localPed)
            local pos = GetEntityCoords(localPed)
            local myHorse = Citizen.InvokeNative(0xD49F9B0955C367DE, model, pos.x+10, pos.y+10, pos.z, 0.0, true, true, true, true)
            Citizen.InvokeNative(0x283978A15512B2FE, myHorse, true)
            Citizen.InvokeNative(0x9F3480FE65DB31B5, myHorse, 1)
            Citizen.InvokeNative(0x4AD96EF928BD4F9A, model)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, 489680375, saddle)
            Citizen.InvokeNative(0x23f74c2fda6e7c61, -1230993421, myHorse)
            SetPedOutfitPreset(model, 300)
end