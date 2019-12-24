local PLAYER_BLIP_TYPE = -214162151 -- yellow straggler
local PLAYER_GAMERTAGS = {}
local PLAYER_PED = {}
local PLAYER_ONLINE = {}

function UpdatePlayerblips()
    for _, player in next, GetActivePlayers() do
        local ped = GetPlayerPed(player)
        if PLAYER_PED[player] and PLAYER_PED[player] ~= ped then
            CleanupPlayerblip(player)
        end
        PLAYER_PED[player] = ped
        local name = GetPlayerName(player)
        local blip = GetBlipFromEntity(ped)
        if not DoesBlipExist(blip) then
            blip = AddBlipForEntity(PLAYER_BLIP_TYPE, ped)
            SetBlipNameToPlayerName(blip, player)
        end
        if not PLAYER_GAMERTAGS[player] then
            local gamertag = CreateFakeMpGamerTag(ped, name, false, false, "", 0)
            PLAYER_GAMERTAGS[player] = gamertag
        else
            local gamertag = PLAYER_GAMERTAGS[player]
            if not IsMpGamerTagActive(gamertag) then
                PLAYER_GAMERTAGS[player] = nil
            end
        end
        PLAYER_ONLINE[player] = true
    end
end

function CleanupPlayerblip(player)
    if PLAYER_GAMERTAGS[player] then
        PLAYER_GAMERTAGS[player] = nil
    end
    if PLAYER_ONLINE[player] then
        PLAYER_ONLINE[player] = nil
    end
    if PLAYER_CURRENTNAME[player] then
        PLAYER_CURRENTNAME[player] = nil
    end
end

function CleanupPlayerblips()
    -- Cleanup?
    for player, online in next, PLAYER_ONLINE do
        if not NetworkIsPlayerActive(player) then
            CleanupPlayerblip(player)
        end
    end
end

-- Update loop
Citizen.CreateThread(function()
    while true do
        Wait(1000)
        UpdatePlayerblips()
    end
end)

-- Cleanup loop
Citizen.CreateThread(function()
    while true do
        Wait(1000)
        CleanupPlayerblips()
    end
end)

-------------------------------------------------------- key

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end


