ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

Citizen.CreateThread(function()
	for k, v in pairs(Config["item_chests"]) do
		ESX.RegisterUsableItem(k, function(source)
			local xPlayer = ESX.GetPlayerFromId(source)
			TriggerClientEvent("master_lootbox:open_lootbox", source, k)
		end)
	end
end)

function GetItemCount(xPlayer, item)
    local items = xPlayer.getInventoryItem(item)

    if items == nil then
        return 0
    else
        return items.count
    end
end

RegisterServerEvent("master_lootbox:giveReward")
AddEventHandler("master_lootbox:giveReward", function(chestID, t, data, amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if GetItemCount(xPlayer, chestID) <= 0 then
		return
	else
		xPlayer.removeInventoryItem(chestID, 1)
	end
	
	if Config["item_chests"][chestID] ~= nil then
		for k, v in pairs(Config["item_chests"][chestID].list) do
			Item = Config["item_chests"][chestID].list[k]
			if t == "item" and Item.item ~= nil and Item.item == data and Item.amount == amount then
				xPlayer.addInventoryItem(data, amount)
			elseif t == "weapon" and Item.weapon ~= nil and Item.weapon == data then
				xPlayer.addWeapon(string.upper(data), 1)
			elseif t == "money" and Item.money ~= nil and Item.money == data then
				xPlayer.addMoney(data)
			end
		end
	end
end)