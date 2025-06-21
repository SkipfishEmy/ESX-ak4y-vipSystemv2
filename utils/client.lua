Framework = nil

if Settings.Framework == "qb" then
	Framework = exports['qb-core']:GetCoreObject()
elseif Settings.Framework == "esx" then
	Framework = exports['es_extended']:getSharedObject()
elseif Settings.Framework == "oldEsx" then
	CreateThread(function()
		while Framework == nil do
			TriggerEvent('esx:getSharedObject', function(obj) Framework = obj end)
			Wait(10)
		end
	end)
end

function TriggerServerCallback(...)
	if Settings.Framework == "esx" or Settings.Framework == "oldEsx" then
		Framework.TriggerServerCallback(...)
	else
		Framework.Functions.TriggerCallback(...)
	end
end

function frameworkNotify(text, typeX)
	if Settings.Framework == "esx" or Settings.Framework == "oldEsx" then
		Framework.ShowNotification(text)
	else
		Framework.Functions.Notify(text, typeX)
	end
end

RegisterNetEvent('ak4y-vipSystemv2:client:sendNotification')
AddEventHandler('ak4y-vipSystemv2:client:sendNotification', function(text, typeX)
	frameworkNotify(text, typeX)
end)

function drawTxt(text, font, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

function DrawText3D(x, y, z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local px, py, pz = table.unpack(GetGameplayCamCoords())
	SetTextScale(0.48, 0.48)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 245)
	SetTextOutline(true)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x, _y)
end
