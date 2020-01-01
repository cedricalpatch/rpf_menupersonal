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

-------------------------------------- functio, blip

if not AddBlipForEntity then function AddBlipForEntity(...)
    return N_0x23f74c2fda6e7c61(...)
end end
-- Add blip for coord, <blipType, x, y, z>
if not AddBlipForCoord then function AddBlipForCoord(...)
    return N_0x554d9d53f696d002(...)
end end
-- Add blip for radius, <blipType, x, y, z, radius>
if not AddBlipForRadius then function AddBlipForRadius(...)
    return N_0x45f13b7e0a15c880(...)
end end
-- Add blip for area, <blipType, x, y, z, width, height, _, rotation>
if not AddBlipForArea then function AddBlipForArea(...)
    return N_0xec174adbcb611ecc(...)
end end
-- Set blip name to custom text, <blip, name>
if not SetBlipName then function SetBlipName(blip, name)
    N_0x9cb1a1623062f402(blip, TEXT(name))
end end

