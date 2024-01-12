ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('Braquage:Banque')
AddEventHandler('Braquage:Banque', function(CodeCoords, CodeType)
    local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
        if thePlayer.job.name == 'police' then
            TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "LSPD", '~r~Braquage de Banque', "Un Braquage de banque est en cours, vous devez vous y rendre le plus vite possible !", 'CHAR_CALL911', 0)
            TriggerClientEvent('Braquage:Alerte', xPlayers[i], CodeCoords)
        end
    end
end, false)

RegisterNetEvent('Braquage:Argent')
AddEventHandler('Braquage:Argent', function(money)
    local _source = source
    local xPlayers = ESX.GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(source)  
	xPlayer.addAccountMoney('black_money', money)
end)




