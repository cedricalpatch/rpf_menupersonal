--- menu perso

Citizen.CreateThread(function()
    local checkbox2 = false
    WarMenu.CreateMenu('perso', "Menu Perso")
    WarMenu.SetSubTitle('perso', 'Information joueur')
    WarMenu.CreateSubMenu('inv', 'perso', 'Votre inventaire')
    WarMenu.CreateSubMenu('inv1', 'perso', 'Tenue disponible')
    WarMenu.CreateSubMenu('inv2', 'perso', 'Arme disponible')


    while true do

        local ped = GetPlayerPed()
        local coords = GetEntityCoords(PlayerPedId())

        if WarMenu.IsMenuOpened('perso') then

                HasStreamedTextureDictLoaded("menu_textures")
                DrawSprite("menu_textures", "translate_bg_1a", 0.55, 0.2, 0.35, 0.70, 0.8, 000, 2, 2, 200, 1)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.5, 0.5)
                DisplayText("Invetaire", 0.41, 0.06)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.3, 0.3)
                DisplayText("Vous avez un cheval et votre garde du corp !", 0.41, 0.11)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.3, 0.3)
                DisplayText("N'abuzez pas des bug ne spamer pas la touche ...", 0.41, 0.13)
                TriggerServerEvent("redemrp_inventory:itemsList") 

            if WarMenu.MenuButton('Inventaire', 'inv') then 

                HasStreamedTextureDictLoaded("menu_textures")
                DrawSprite("menu_textures", "translate_bg_1a", 0.55, 0.2, 0.35, 0.70, 0.8, 000, 2, 2, 200, 1)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.5, 0.5)
                DisplayText("Invetaire", 0.41, 0.06)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.3, 0.3)
                DisplayText("Vous avez un cheval et votre garde du corp !", 0.41, 0.11)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.3, 0.3)
                DisplayText("N'abuzez pas des bug ne spamer pas la touche ...", 0.41, 0.13)
            end

            if WarMenu.MenuButton('Tenues', 'inv1') then

                HasStreamedTextureDictLoaded("menu_textures")
                DrawSprite("menu_textures", "translate_bg_1a", 0.55, 0.2, 0.35, 0.70, 0.8, 000, 2, 2, 200, 1)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.5, 0.5)
                DisplayText("Invetaire", 0.41, 0.06)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.3, 0.3)
                DisplayText("Vous avez un cheval et votre garde du corp !", 0.41, 0.11)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.3, 0.3)
                DisplayText("N'abuzez pas des bug ne spamer pas la touche ...", 0.41, 0.13)
            end

            if WarMenu.MenuButton('Armes', 'inv2') then
                                HasStreamedTextureDictLoaded("menu_textures")
                DrawSprite("menu_textures", "translate_bg_1a", 0.55, 0.2, 0.35, 0.70, 0.8, 000, 2, 2, 200, 1)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.5, 0.5)
                DisplayText("Invetaire", 0.41, 0.06)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.3, 0.3)
                DisplayText("Vous avez un cheval et votre garde du corp !", 0.41, 0.11)
                SetTextColor(255, 255, 255, 255)
                SetTextFontForCurrentCommand(1)
                SetTextScale(0.3, 0.3)
                DisplayText("N'abuzez pas des bug ne spamer pas la touche ...", 0.41, 0.13)
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('inv1') then
            if WarMenu.Button('Perso de base') then
                TriggerServerEvent("rpf_clotheshop:loadClothes")
            elseif WarMenu.Button('Perso modifier') then
                TriggerServerEvent("redem_clothing:loadClothes")
            elseif WarMenu.Button('Perso Online') then
                 TriggerServerEvent("redemrp_skin:loadSkin")
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('inv') then   

            if WarMenu.Button('Votre cheval') then
                TriggerServerEvent('elrp:loadhorse')
            end
            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('inv2') then   

            if WarMenu.Button('Revelver') then
                Citizen.InvokeNative(0xB282DC6EBD803C75, GetPlayerPed(), GetHashKey("WEAPON_REVOLVER_CATTLEMAN"), 500, true, 0)
            elseif WarMenu.Button('Carabine') then
                Citizen.InvokeNative(0xB282DC6EBD803C75, GetPlayerPed(), GetHashKey("WEAPON_SNIPERRIFLE_ROLLINGBLOCK"), 500, true, 0)
            end

            WarMenu.Display()

        elseif whenKeyJustPressed(keys["E"]) then 
            WarMenu.OpenMenu('perso')
        end
        Citizen.Wait(0)
    end
end)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end
