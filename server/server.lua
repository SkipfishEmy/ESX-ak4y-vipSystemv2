ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('ak4y-vipSystemv2:getPlayerData:server', function(source, cb, isFirst)
    local playerName, profileImage = nil, nil
    local callbackData = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier  = xPlayer.getIdentifier()
    if isFirst then 
        playerName = GetPlayerName(source)
        profileImage = getPlayerAvatar(source)
    end
    local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2 WHERE identifier  = '"..identifier .."'")
    if result[1] then 
        callbackData = {
            coinAmount = result[1].coinAmount,
            playerName = playerName,
            profileImage = profileImage,
        }
    else
        callbackData = {
            coinAmount = 0,
            playerName = playerName,
            profileImage = profileImage,
        }
    end
    cb(callbackData)
end)

ESX.RegisterServerCallback('ak4y-vipSystemv2:buyItem:server', function(source, cb, itemData)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemCategory = getCorrectCategoryForItem(itemData.pageValue)
    if itemCategory == nil then return end
    local correctionMoney = moneyCorrectionForItem(itemData, itemCategory)
    if correctionMoney then 
        local identifier = xPlayer.getIdentifier()
        local totalAmountOfItem = correctionMoney * (itemData.quantity or 1)

        if itemData.itemType == Settings.SqlVehicleType or
           itemData.itemType == Settings.SqlAirType or
           itemData.itemType == Settings.SqlBoatType then
            if itemData.customPlate ~= nil and itemData.customPlate.plateState then
                totalAmountOfItem = totalAmountOfItem + itemData.customPlate.platePrice
                itemData.carData.plate = itemData.customPlate.plateNumber:upper()
            end
        end

        local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2 WHERE identifier = '"..identifier.."'")
        if result[1] then 
            if result[1].coinAmount >= totalAmountOfItem then
                local newCoinAmount = result[1].coinAmount - totalAmountOfItem
                if itemData.itemName == nil then itemData.itemName = "null" end

                if itemData.itemType == "item" then 
                    local count = (itemData.quantity or 1) * (itemData.itemCount or 1)
                    addItemToPlayer(xPlayer, itemData.itemName, count)
                elseif itemData.itemType == "money" then 
                    giveServerMoney(xPlayer, (itemData.quantity or 1) * (itemData.itemCount or 1))
                elseif itemData.itemType == "job" then 
                    setJobToPlayer(xPlayer, itemData.itemName, itemData.jobGrade)
                elseif itemData.itemType == "weapon" then 
                    local count = (itemData.quantity or 1) * (itemData.itemCount or 1)
                    addWeaponToPlayer(xPlayer, itemData.itemName, count)
                elseif itemData.itemType == Settings.SqlVehicleType or
                       itemData.itemType == Settings.SqlAirType or
                       itemData.itemType == Settings.SqlBoatType then
                    addVehicleToGarage(xPlayer, itemData)
                elseif itemData.itemType == "bundle" then
                    for k, v in pairs(itemData.giveItems) do 
                        if v.itemType == "item" then 
                            addItemToPlayer(xPlayer, v.itemName, v.itemCount or 1)
                        elseif v.itemType == "money" then 
                            giveServerMoney(xPlayer, v.itemCount or 1)
                        elseif v.itemType == "job" then 
                            setJobToPlayer(xPlayer, v.itemName, v.jobGrade)
                        elseif v.itemType == "weapon" then 
                            addWeaponToPlayer(xPlayer, v.itemName, v.itemCount or 1)
                        elseif v.itemType == Settings.SqlVehicleType or
                               v.itemType == Settings.SqlAirType or
                               v.itemType == Settings.SqlBoatType then
                            addVehicleToGarage(xPlayer, v)
                        end
                    end
                elseif itemData.itemType == "number" then 
                    local newNumber = itemData.customizePopUp.phoneNumber
                    local checkedNumber = checkPhoneNumber(newNumber)
                    if not checkedNumber then 
                        DropPlayer(source, "[ak4y-vipSystemv2] ".. AK4Y.Translate.phoneNumberChanged)
                        Wait(5000)
                        givePhoneNumber(identifier, newNumber)
                    end
                elseif itemData.itemType == "plate" then 
                    local oldPlateCheck = plateOwnerCheck(identifier, itemData.oldPlate)
                    if oldPlateCheck then 
                        updatePlate(itemData.oldPlate, itemData.customizePopUp.plateNumber, oldPlateCheck)
                    else
                        cb(AK4Y.Translate.plateHasOwnerText)
                        return
                    end
                elseif itemData.itemType == "house" then 
                    TriggerClientEvent('ak4y-vipSystemv2:houseBought', source, itemData)
                end
                ExecuteSql("UPDATE ak4y_vipsystemv2 SET coinAmount = coinAmount - '"..totalAmountOfItem.."' WHERE identifier = '"..identifier.."'")
                sendNotifyToDc(source, identifier, itemData.itemName, itemData.quantity, totalAmountOfItem, newCoinAmount)
                cb(true)
            else
                cb(AK4Y.Translate.youDontHaveEnoughCoinText)
            end
        else
            cb(AK4Y.Translate.youDontHaveEnoughCoinText)
        end
    else
        cb(AK4Y.Translate.priceHasChangedText)
    end
end)



getCorrectCategoryForItem = function(page)
    if page == "specialOffer" then 
        if AK4Y.specialOffer.pageValue == page then 
            return AK4Y.specialOffer
        end
    end
    for k,v in pairs(AK4Y.Categories) do 
        if v.pageValue == page then 
            return v
        end
    end
    return nil
end

moneyCorrectionForItem = function(uiData, configData)
    if configData.pageValue == "specialOffer" then 
        if configData.discount.state then 
            if configData.discount.newPrice == uiData.price then 
                return configData.discount.newPrice
            else
                return false
            end
        else
            if configData.price == uiData.price then 
                return configData.price
            else
                return false
            end
        end
    end

    for k,v in pairs(configData.items) do 
        if v.id == uiData.id then 
            if v.discount.state then 
                if v.discount.newPrice == uiData.price then 
                    return v.discount.newPrice
                else
                    return false
                end
            else
                if v.price == uiData.price then 
                    return v.price
                else
                    return false
                end
            end
        end
    end
end

function addCredit(player, creditCount)
    local src = tonumber(player)
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer then 
        local identifier  = xPlayer.getIdentifier()
        local deger = tonumber(creditCount)
        local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2 WHERE identifier  = '"..identifier .."'")
        if result[1] ~= nil then 
            ExecuteSql("UPDATE ak4y_vipsystemv2 SET coinAmount = coinAmount + '"..deger.."' WHERE identifier  = '"..identifier .."'")
            return true
        else
            ExecuteSql("INSERT INTO ak4y_vipsystemv2 (identifier , coinAmount) VALUES ('"..identifier .."', '"..deger.."')")
            return true
        end
    else
        return false
    end 
end

function removeCredit(player, creditCount)
    local src = tonumber(player)
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer then 
        local identifier  = xPlayer.getIdentifier()
        local deger = tonumber(creditCount)
        local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2 WHERE identifier  = '"..identifier .."'")
        if result[1] ~= nil then 
            ExecuteSql("UPDATE ak4y_vipsystemv2 SET coinAmount = coinAmount - '"..deger.."' WHERE identifier  = '"..identifier .."'")
            return true
        else
            return true
        end
    else
        return false
    end 
end

-- redeem code callback
ESX.RegisterServerCallback('ak4y-vipSystemv2:redeemCode:server', function(source, cb, code)
    local code = code.code
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier  = xPlayer.getIdentifier()
    local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2_codes WHERE code = '"..code.."'")
    if result[1] then 
        local newCoinAmount = result[1].coinAmount
        ExecuteSql("DELETE FROM ak4y_vipsystemv2_codes WHERE code = '"..code.."'")
        addCredit(source, newCoinAmount)
        SendToDiscord("Code: ``"..code.."``\nCredit: ``"..newCoinAmount.."``\nsuccessfuly into your database!")
        cb(newCoinAmount)
    else
        cb(AK4Y.Translate.codeNotFoundText)
    end
end)

-- Command zum Erstellen eines Codes (nur Konsole)
RegisterCommand('vipsystemv2_credit_purchase', function(source, args)
	local src = source
    if src == 0 then
        local dec = json.decode(args[1])
        local tbxid = dec.transid
        local credit = tonumber(dec.credit)
        while inProgress do
            Wait(1000)
        end
        inProgress = true
        local result = ExecuteSql("SELECT * FROM ak4y_vipsystemv2_codes WHERE code = '"..tbxid.."'")
        if result[1] == nil then
            ExecuteSql("INSERT INTO ak4y_vipsystemv2_codes (code, coinAmount) VALUES ('"..tbxid.."', '"..credit.."')")
            SendToDiscord("Code: ``"..tbxid.."``\nCredit: ``"..credit.."``\nsuccessfuly into your database!")
        end
        inProgress = false
    end
end)


function setNewVehiclePlate(oldPlate, newPlate)
    -- Diese Funktion ist framework-unabhängig hier deaktiviert
    return false
end

sendNotifyToDc = function(source, identifier , itemName, quantity, totalAmountOfItem, newCoinAmount)
    SendToDiscord("> **Source: **"..source.."\n> **identifier : **"..identifier .."\n> **Get: **"..itemName.."\n> **Quantity: **"..quantity.."\n> **For: **"..totalAmountOfItem.."\n> **New Coin Amount: **"..newCoinAmount.."")
end

function getPlayerAvatar(src)
    if AK4Y.ProfilePhotos == "discord" then 
        local discord = nil
        local avatar = nil
        for i = 0, GetNumPlayerIdentifiers(src) - 1 do
            local license = GetPlayerIdentifier(src, i)
            if string.sub(license, 1, string.len("discord:")) == "discord:" then
                discord = license
            end
        end
        if discord then
            discord = string.sub(discord, 9)
            local p = promise.new()
            PerformHttpRequest("https://discordapp.com/api/users/" .. discord, function(statusCode, data)
                if statusCode == 200 then
                    data = json.decode(data or "{}")
                    if data.avatar then
                        local animated = data.avatar:sub(1, 2) == "a_"
                        avatar = "https://cdn.discordapp.com/avatars/" .. discord .. "/" .. data.avatar .. (animated and ".gif" or ".png")
                    end
                end
                p:resolve()
            end, "GET", "", {
                Authorization = "Bot " .. DiscordBotToken
            })
            Citizen.Await(p)
        end
        return avatar or "assets/default.png"
    elseif AK4Y.ProfilePhotos == "steam" then
        local hex = tonumber(string.gsub(GetPlayerIdentifier(src, 0), 'steam:', ''), 16)
        local avatar = nil
        if hex then
            local p = promise.new()
            PerformHttpRequest('http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=' .. SteamApiKey .. '&steamids=' .. hex, function(error, result)
                local result = json.decode(result)
                avatar = result.response.players[1].avatarfull
                p:resolve()
            end)
            Citizen.Await(p)
        end
        return avatar or "assets/default.png"
    else
        return "assets/default.png"
    end     
end

local DISCORD_NAME = Discord_Bot_Username
local DISCORD_IMAGE = Discord_Bot_Avatar
DiscordWebhook = DiscordWebhook

function SendToDiscord(name, message, color)
	if DiscordWebhook == "CHANGE_WEBHOOK" then
		return
	else
		local connect = {
            {
                ["color"] = color or 65280,
                ["title"] = "**".. name .."**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = "ak4y development",
                },
            },
	    }
		PerformHttpRequest(DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({
            username = DISCORD_NAME,
            embeds = connect,
            avatar_url = DISCORD_IMAGE
        }), { ['Content-Type'] = 'application/json' })
	end
end
