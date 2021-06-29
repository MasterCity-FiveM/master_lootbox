ESX = nil
local draw = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent("esx:getSharedObject", function(obj)
			ESX = obj
		end)
		Citizen.Wait(100)
	end
end)

RegisterNUICallback("closeUI", function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({type = "off"})
end)

RegisterNetEvent("master_lootbox:open_lootbox")
AddEventHandler("master_lootbox:open_lootbox", function(data)
	TriggerEvent("masterking32:closeAllUI")
	Citizen.Wait(500)
	local sum = 0
	draw = {}
	for k, v in pairs(Config["item_chests"][data].list) do
		local rate = Config["chance"][v.tier].rate * 100
		for i = 1, rate do
			if v.item then
				if v.amount then
					table.insert(draw, {item = v.item, amount = v.amount, tier = v.tier})
				else
					table.insert(draw, {item = v.item, amount = 1, tier = v.tier})
				end
			elseif v.weapon then
				table.insert(draw, {weapon = v.weapon, tier = v.tier})
			elseif v.money then
				table.insert(draw, {money = v.money, tier = v.tier})
			end
			i = i + 1
		end
		sum = sum + rate
	end
	
	local random = math.random(1, sum)
	SetNuiFocus(true, true)
	SendNUIMessage({type = "ui",
		data = Config["item_chests"][data].list,
		img = 'nui://Master_Inventory/html/img/items/',
		win = draw[random]
	})
	
	Wait(9000)
	if draw[random].item then
		TriggerServerEvent("master_lootbox:giveReward", data, "item", draw[random].item, draw[random].amount)
	elseif draw[random].weapon then
		TriggerServerEvent("master_lootbox:giveReward", data, "weapon", draw[random].weapon)
	elseif draw[random].money then
		TriggerServerEvent("master_lootbox:giveReward", data, "money", draw[random].money)
	end
end)
