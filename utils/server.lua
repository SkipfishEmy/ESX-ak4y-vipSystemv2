-- ESX-Only Version (neues ESX Format)

Framework = exports['es_extended']:getSharedObject()

function RegisterServerCallback(...)
    Framework.RegisterServerCallback(...)
end

function getXPlayer(src)
    return Framework.GetPlayerFromId(src)
end

function getidentifier (player)
    return player.identifier
end

function getName(player, state)
    return player.getName()
end

function getFirstName(player)
    -- Im neuen ESX gibt es oft player.getFirstName(), falls nicht, dann muss man es ggf. aus getName() parsen
    if player.getFirstName then
        return player.getFirstName()
    else
        return player.getName()
    end
end

function getLastName(player)
    -- Im neuen ESX gibt es oft player.getLastName(), falls nicht, dann leer lassen oder ebenfalls aus getName() parsen
    if player.getLastName then
        return player.getLastName()
    else
        return ""
    end
end

function giveServerMoney(player, amount)
    -- Cash oder Bank per Settings.CashOrBank, Standard ESX ist "money" (cash) oder "bank"
    local cashOrBank = Settings.CashOrBank == "cash" and "money" or "bank"
    player.addAccountMoney(cashOrBank, tonumber(amount))
end

function removeServerMoney(player, bankOrCash, amount)
    player.removeAccountMoney(bankOrCash, tonumber(amount))
end

function addItemToPlayer(player, item, amount)
    player.addInventoryItem(item, amount)
end

function setJobToPlayer(player, job, grade)
    player.setJob(job, grade)
end

function getPlayerLicense(player)
    return player.getIdentifier()
end

function addWeaponToPlayer(player, weapon, amount)
    -- ESX addWeapon(weapon, ammo)
    -- amount = Munition, aber dein alter Code nimmt amount als Anzahl der Waffen (was bei ESX so keinen Sinn macht)
    -- Falls du wirklich mehrfach die gleiche Waffe geben willst, musst du ne Schleife machen, aber meistens reicht 1x:
    player.addWeapon(weapon, amount)
end

function plateOwnerCheck(identifier , plate)
    local result = plateCheck(plate)
    if result ~= nil then
        if result.owner == identifier  then
            return result
        else
            return nil
        end
    else
        return nil
    end
end

function addVehicleToGarage(player, itemData)
    -- Nur ESX!
    ExecuteSql("INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored) VALUES ('"..getidentifier (player).."', '"..itemData.carData.plate.."', '"..json.encode(itemData.carData).."', '"..itemData.itemType.."', '"..Settings.VehicleStored.."')")
end

function plateCheck(plate)
    local plateCheck = ExecuteSql("SELECT * FROM owned_vehicles WHERE plate = '"..plate.."'")
    if plateCheck[1] ~= nil then
        return plateCheck[1]
    else
        return nil
    end
end

-- @phoneNumber : string (Alte Telefonnummer)
function checkPhoneNumber(phoneNumber)
    if not Settings.PhoneCustomElse then 
        local selectNumberExecute = ""
        if Settings.Phone == "qb-phone" then 
            selectNumberExecute = "SELECT * FROM users WHERE charinfo LIKE '%"..phoneNumber.."%'"
        elseif Settings.Phone == "gcphone" or Settings.Phone == "gksphone" then
            selectNumberExecute = "SELECT * FROM users WHERE phone_number = '"..phoneNumber.."'"
        end
        local phoneCheck = ExecuteSql(selectNumberExecute)
        if phoneCheck[1] ~= nil then
            return phoneCheck[1]
        else
            return nil
        end
    else
        -- Hier kannst du eine eigene SQL-Abfrage machen, falls du was eigenes nutzt
        local phoneCheck = ExecuteSql("SELECT * FROM users WHERE phone_number = '"..phoneNumber.."'")
        if phoneCheck[1] ~= nil then
            return phoneCheck[1]
        else
            return nil
        end
    end
end

-- @phoneNumber: string (neue Telefonnummer)
function givePhoneNumber(identifier , newNumber)
    if not Settings.PhoneCustomElse then
        local setNumberExecute = ""
        if Settings.Phone == "qb-phone" then 
            setNumberExecute = string.format("UPDATE users SET charinfo = JSON_SET(charinfo, '$.phone', '%s') WHERE identifier  = '%s'", newNumber, identifier )
        elseif Settings.Phone == "gcphone" or Settings.Phone == "gksphone" then
            setNumberExecute = "UPDATE users SET phone_number = '"..newNumber.."' WHERE identifier  = '"..identifier .."'"
        end
        local executed = ExecuteSql(setNumberExecute)
    else
        -- Eigene Datenbankstruktur, selbst anpassen
        ExecuteSql("UPDATE users SET charinfo = '"..newNumber.."' WHERE identifier  = '"..identifier .."'")
    end
end

function checkPlayerFromSql(identifier )
    local playerCheck = ExecuteSql("SELECT * FROM users WHERE identifier  = '"..identifier .."'")
    if playerCheck[1] ~= nil then
        return playerCheck[1]
    else
        return nil
    end
end

function updatePlate(oldPlate, newPlate, jsonData)
    if jsonData then 
        local newVeri = json.decode(jsonData.vehicle)
        newVeri.plate = newPlate
        ExecuteSql("UPDATE owned_vehicles SET vehicle = '"..json.encode(newVeri).."', plate = '"..newPlate.."' WHERE plate = '"..oldPlate.."'")
    else
        ExecuteSql("UPDATE owned_vehicles SET plate = '"..newPlate.."' WHERE plate = '"..oldPlate.."'")
    end
end

function ExecuteSql(query)
    local IsBusy = true
    local result = nil
    if Settings.Mysql == "oxmysql" then
        if MySQL == nil then
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.query(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Settings.Mysql == "ghmattimysql" then
        exports.ghmattimysql:execute(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    elseif Settings.Mysql == "mysql-async" then   
        MySQL.Async.fetchAll(query, {}, function(data)
            result = data
            IsBusy = false
        end)
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end

