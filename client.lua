local ESX = exports["es_extended"]:getSharedObject()

local cooldown = false
local AppelCoords = nil
local AppelEnAttente = false
local playerCoords = GetEntityCoords(PlayerPedId())
local isOpen = false
local chargement = 0
local panelActive = nil

-- MENU FUNCTIONS --
local mainMenu = RageUI.CreateMenu('Braquage', 'FANTAISIE')
mainMenu.Display.Header = true
mainMenu.Closed = function()
    isOpen = false
    FreezeEntityPosition(PlayerPedId(), false)
end

function OpenMenuBraquage()
    if isOpen then
        isOpen = false
        RageUI.Visible(mainMenu, false)
        return
    else
        isOpen = true
        RageUI.Visible(mainMenu, true)
        CreateThread(function()
            if cooldown then
                local cooldownMinutes = math.round((Config.Braquage.Cooldown.Temps) / 60000)
                ESX.ShowNotification('Vous devez attendre ' ..cooldownMinutes.. ' minutes entre chaque ~r~braquage ~s~!')
            end
            while isOpen do
                RageUI.IsVisible(mainMenu, function()
                    for _, braquage in pairs(Config.Braquage.Config) do
                        RageUI.Button(braquage.name, braquage.sousname, { RightLabel = "→" }, not cooldown, {
                            onSelected = function()
                                ESX.ShowNotification("La police vient d'être ~r~avertie ~s~!")
                                TriggerServerEvent("Braquage:Banque", GetEntityCoords(PlayerPedId()), 4)
                                RageUI.CloseAll()
                                OpenMenuTime()
                                OpenMenuTime()
                                panelActive = true
                                cooldown = true
                                Wait(Config.Braquage.Cooldown.Temps)
                                cooldown = false
                                local money = braquage.money
                                TriggerServerEvent("Braquage:Argent", money)
                            end
                        })
                    end
                end)
                Wait(0)
            end
        end)
    end
end

local timeMenu = RageUI.CreateMenu('Braquage', 'BRAQUAGE')
timeMenu.Display.Header = true
timeMenu.Closed = function()
    isOpen = false
    FreezeEntityPosition(PlayerPedId(), false)
end
timeMenu.Closable = false

function OpenMenuTime()
    if isOpen then
        isOpen = false
        RageUI.Visible(timeMenu, false)
        return
    else
        isOpen = true
        RageUI.Visible(timeMenu, true)
        CreateThread(function()
            while isOpen do
                RageUI.IsVisible(timeMenu, function()
                    RageUI.Separator("La police vient d'être ~r~avertie ~s~!")
                    RageUI.Button("Arrêter le braquage", nil, { RightLabel = "→" }, true, {
                        onSelected = function()
                            isOpen = false
                            ESX.ShowNotification("~r~Vous avez arrêté le braquage. Vous ne recevrez pas la récompense promise")
                        end
                    })
                    if panelActive == true then
                        RageUI.PercentagePanel(chargement, " Fin du braquage : " .. math.floor(chargement * 100) .. "%~s~", "", "", {})
                        for _, braquage in pairs(Config.Braquage.Config) do
                            if chargement < 1.0 then
                                chargement = chargement + 0.00001
                            else
                                chargement = 0
                            end
                            if chargement >= 1.0 then
                                ClearPedTasksImmediately(GetPlayerPed(-1))
                                Wait(2000)
                                ClearPedTasksImmediately(GetPlayerPed(-1))
                                chargement = 0
                                ESX.ShowNotification("Vous avez eu votre récompense de " .. braquage.money .. "~g~$")
                                isOpen = false
                                RageUI.CloseAll()
                                panelActive = false
                            end
                        end
                    end
                end)
                Wait(0)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
        local wait = 750
        for _, position in pairs(Config.Braquage.Position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position.x, position.y, position.z)
            if dist <= 2.5 then
                DrawMarker(27, position.x, position.y, position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 155, 255, 255, false, false, p19, false)
                wait = 1
                ESX.ShowHelpNotification("Appuyer sur ~INPUT_PICKUP~ pour commencer le braquage")
                if IsControlJustPressed(1, 51) then
                    OpenMenuBraquage()
                end
            end
        end
        Citizen.Wait(wait)
    end
end)
