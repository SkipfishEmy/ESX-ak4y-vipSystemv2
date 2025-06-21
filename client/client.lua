ESX = exports["es_extended"]:getSharedObject()

local firstOpening = true

-- Open Menu Command
if Settings.openWithCommand then 
    RegisterCommand(Settings.openCommand, function()
        if Settings.Debug then
            Settings.DebugPrint("Command to open menu was triggered")
        end
        TriggerEvent('ak4y-vipSystemv2:openMenu')
    end, false)
end

-- Open Menu trigger
RegisterNetEvent('ak4y-vipSystemv2:openMenu', function()
    if Settings.Debug then
        Settings.DebugPrint("Opening Menu")
    end
    ESX.TriggerServerCallback('ak4y-vipSystemv2:getPlayerData:server', function(data)
        firstOpening = false
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "openMenu",
            plyInfo = data
        })
    end, firstOpening)
end)

RegisterNuiCallback("redeemCode", function(data, cb)
    if Settings.Debug then
        Settings.DebugPrint("Redeem Code Clicked")
    end
    ESX.TriggerServerCallback('ak4y-vipSystemv2:redeemCode:server', function(state)
        cb(state)
    end, data)
end)

RegisterNuiCallback("getData", function(data, cb)
    SendNUIMessage({
        action = "init",
        config = AK4Y
    })

    if Settings.Debug then
        Settings.DebugPrint("NUI Ready, Data requested from NUI")
    end

    cb("ok")
end)

RegisterNuiCallback("closeMenu", function(data, cb)
    SetNuiFocus(false, false)
    if Settings.Debug then
        Settings.DebugPrint("Closing Menu")
    end
    cb("ok")
end)

RegisterNuiCallback("itemBuy", function(data, cb)
    if Settings.Debug then
        Settings.DebugPrint("Item Buy Clicked")
    end
    if data.itemType == Settings.SqlVehicleType or data.itemType == Settings.SqlAirType or data.itemType == Settings.SqlBoatType then
        data.carData = getCarData(data)
        ESX.TriggerServerCallback('ak4y-vipSystemv2:buyItem:server', function(state)
            cb(state)
        end, data)
    elseif data.itemType == "bundle" then
        for k, v in pairs(data.giveItems) do 
            if v.itemType == Settings.SqlVehicleType or v.itemType == Settings.SqlAirType or v.itemType == Settings.SqlBoatType then
                v.carData = getCarData(v)
            end
        end
        ESX.TriggerServerCallback('ak4y-vipSystemv2:buyItem:server', function(state)
            cb(state)
        end, data)
    elseif data.itemType == "plate" then 
        if IsPedInAnyVehicle(PlayerPedId(), false) then
			local veh = GetVehiclePedIsIn(PlayerPedId(), false)
			local oldPlate = GetVehicleNumberPlateText(veh)
            local newPlate = data.customizePopUp.plateNumber
            data.oldPlate = oldPlate
			ESX.TriggerServerCallback('ak4y-vipSystemv2:buyItem:server', function(state)
                SetVehicleNumberPlateText(veh, newPlate)
                if Settings.GiveAddKeys then 
                    Settings.GiveAddKeysFunction(newPlate)
                end
                cb(state)
            end, data)
		else
			cb(AK4Y.Translate.youHaveToBeInVehicle)
		end
    else
        ESX.TriggerServerCallback('ak4y-vipSystemv2:buyItem:server', function(state) 
            cb(state)
        end, data)
    end
end)

RegisterNetEvent('ak4y-vipSystemv2:houseBought', function(data)
    if Settings.Debug then
        Settings.DebugPrint("House Bought")
    end
    if data.afterPurchaseTrigger.clientOrServer == "server" then 
        TriggerServerEvent(data.afterPurchaseTrigger.trigger, data.afterPurchaseTrigger.parameters)
    else
        TriggerEvent(data.afterPurchaseTrigger.trigger, data.afterPurchaseTrigger.parameters)
    end
end)

RegisterNetEvent('ak4y-vipSystemv2:startTestDrive', function(data)
    if Settings.Debug then
        Settings.DebugPrint("Starting Test Drive")
    end
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = GetVehicleNumberPlateText(veh)
    ESX.TriggerServerCallback('ak4y-vipSystemv2:startTestDrive:server', function(state)
        if state then
            if Settings.Debug then
                Settings.DebugPrint("Test Drive Started")
            end
            SetEntityAsMissionEntity(veh, true, true)
            DeleteVehicle(veh)
            TriggerEvent('ak4y-vipSystemv2:openMenu')
        end
    end, plate)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    Settings.DebugPrint("Resource Started")
end)

getCarData = function(itemData)
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	local vehItemNameHash = GetHashKey(itemData.itemName)
	if not IsModelInCdimage(vehItemNameHash) then return end
	RequestModel(vehItemNameHash)
	while not HasModelLoaded(vehItemNameHash) do Wait(0) end
	local vehicle = CreateVehicle(vehItemNameHash, playerCoords.x, playerCoords.y, playerCoords.z - 200.0, 1.0, false, false)
	FreezeEntityPosition(vehicle, true)
	local carData = ESX.Game.GetVehicleProperties(vehicle)
	DeleteVehicle(vehicle)
	DeleteEntity(vehicle)
	return carData
end

RegisterNuiCallback("locate", function(data, cb)
    if Settings.Debug then
        Settings.DebugPrint("Locate Clicked")
    end
    SetNewWaypoint(data.coords.x, data.coords.y)
    frameworkNotify(AK4Y.Translate.locationMarked, "success")
    cb(true)
end)

RegisterNuiCallback("testDrive", function(data, cb)
    if Settings.Debug then
        Settings.DebugPrint("Test Drive Clicked")
    end
    local prevPlayerCoords = GetEntityCoords(PlayerPedId())
    if #(prevPlayerCoords - vector3(Settings.testDriveCoord.x, Settings.testDriveCoord.y, Settings.testDriveCoord.z)) > 10.0 then
        frameworkNotify(AK4Y.Translate.soFarFromTestDriveArea, "error")
        cb(AK4Y.Translate.soFarFromTestDriveArea)
        return
    end
    spawnCarForTest(data, Settings.testDriveTime)
    cb(true)
end)

local inTestDrive = false
local testDriveVehicle = nil

spawnCarForTest = function(itemData, timing)
    if inTestDrive then return end
    local prevPlayerCoords = GetEntityCoords(PlayerPedId())
    if #(prevPlayerCoords - vector3(Settings.testDriveCoord.x, Settings.testDriveCoord.y, Settings.testDriveCoord.z)) > 10.0 then
        frameworkNotify(AK4Y.Translate.soFarFromTestDriveArea, "error")
        return
    end
    inTestDrive = true
	local playerPed = PlayerPedId()
	local playerCoords = GetEntityCoords(playerPed)
	local vehItemNameHash = GetHashKey(itemData.itemName)
	if not IsModelInCdimage(vehItemNameHash) then return end
	RequestModel(vehItemNameHash)
	while not HasModelLoaded(vehItemNameHash) do Wait(0) end
	local vehicle = CreateVehicle(vehItemNameHash, playerCoords.x, playerCoords.y, playerCoords.z, 1.0, true, false)
	testDriveVehicle = vehicle
    SetVehicleOnGroundProperly(vehicle)
	SetEntityAsMissionEntity(vehicle, true, true)
	SetVehicleHasBeenOwnedByPlayer(vehicle, true)
	local id = NetworkGetNetworkIdFromEntity(vehicle)
	SetNetworkIdCanMigrate(id, true)
	SetVehicleNeedsToBeHotwired(vehicle, false)
	TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
	frameworkNotify(testDriveStarted, "success")
	SetTimeout(timing * 1000, function()
        inTestDrive = false
		DeleteVehicle(testDriveVehicle)
		DeleteEntity(testDriveVehicle)
		frameworkNotify(testDriveEnded, "error")
        SetEntityCoords(playerPed, prevPlayerCoords)
	end)
    startTestDriveTimer(timing)
end

function startTestDriveTimer(testDriveTime)
    local gameTimer = GetGameTimer()
    CreateThread(function()
        while inTestDrive do
            if GetGameTimer() < gameTimer + tonumber(1000 * testDriveTime) then
                local secondsLeft = GetGameTimer() - gameTimer
                drawTxt(AK4Y.Translate.testDriveRemaining..''..math.ceil(testDriveTime - secondsLeft / 1000), 4, 0.5, 0.93, 0.50, 255, 255, 255, 180)
            end
            Wait(0)
        end
    end)
end

local performansCd = 1000
CreateThread(function()
    if Settings.testDriveBlip then
        local Dealer = AddBlipForCoord(Settings.testDriveCoord)
        SetBlipSprite(Dealer, 79)
        SetBlipDisplay(Dealer, 4)
        SetBlipScale(Dealer, 0.70)
        SetBlipAsShortRange(Dealer, true)
        SetBlipColour(Dealer, 4)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Settings.testDriveBlipText)
        EndTextCommandSetBlipName(Dealer)
    end
	while true do
        local pos = GetEntityCoords(PlayerPedId())
        if #(Settings.testDriveCoord - pos) < 10 then 
            performansCd = 1
            DrawText3D(Settings.testDriveCoord.x, Settings.testDriveCoord.y, Settings.testDriveCoord.z+1, Settings.testDriveDrawText)
        end
        Citizen.Wait(performansCd)
    end
end)
