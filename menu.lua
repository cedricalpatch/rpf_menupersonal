--- menu perso

Citizen.CreateThread(function()
    local checkbox2 = false
    WarMenu.CreateMenu('perso', "Personel")
    WarMenu.SetSubTitle('perso', 'Information joueur')
    WarMenu.CreateSubMenu('inv', 'perso', 'Your inventory')
    WarMenu.CreateSubMenu('inv1', 'perso', 'Your clothing')
    WarMenu.CreateSubMenu('inv2', 'perso', 'Your Weapon')


    while true do

        local ped = GetPlayerPed()
        local coords = GetEntityCoords(PlayerPedId())

        if WarMenu.IsMenuOpened('perso') then

            if WarMenu.MenuButton('Inventaire', 'inv') then 

            end

            if WarMenu.MenuButton('Tenues', 'inv1') then

            end

            if WarMenu.MenuButton('Weapon', 'inv2') then

            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('inv1') then
            if WarMenu.Button('Clothe saved') then
                TriggerServerEvent("rpf_clotheshop:loadClothes")
                --Citizen.InvokeNative(0xA5BAE410B03E7371, PlayerPedId(), 46, 0, 0, 0)

            elseif WarMenu.Button('Outfit saved') then
                    TriggerServerEvent("redemrp_clothing:loadClothes", 1, function(cb)
                    end)
            elseif WarMenu.Button('Skin saved') then
                 TriggerServerEvent("redemrp_skin:loadSkin")
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('inv') then   

            if WarMenu.Button('Your Horse') then
                TriggerServerEvent('elrp:loadhorse')
                --TriggerServerEvent("redemrp_inventory:itemsList", 1)
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('inv2') then   

            if WarMenu.Button('Revolver') then
                Citizen.InvokeNative(0xB282DC6EBD803C75, GetPlayerPed(), GetHashKey("WEAPON_REVOLVER_CATTLEMAN"), 500, true, 0)
            elseif WarMenu.Button('Rifle') then
                Citizen.InvokeNative(0xB282DC6EBD803C75, GetPlayerPed(), GetHashKey("WEAPON_SNIPERRIFLE_ROLLINGBLOCK"), 500, true, 0)
            end

            WarMenu.Display()

        elseif whenKeyJustPressed(keys["L"]) then 
            WarMenu.OpenMenu('perso')
        end
        Citizen.Wait(0)
    end
end)
