Settings = {} -- NICHT ANFASSEN

Settings.Debug = false -- Gibt Debug-Nachrichten in die Konsole aus.
Settings.DebugPrint = function(...)
    print("[ak4y DEBUG]:", ...)
end

Settings.Framework = "esx" -- NUR "esx" verwenden!
Settings.Mysql = "oxmysql" -- "mysql-async", "oxmysql" oder "ghmattimysql"

Settings.Phone = "gksphone" -- "gksphone" oder "gcphone" (nicht "qb-phone"!)
Settings.PhoneCustomElse = false -- Eigene Anpassung der Telefonnummern-Abfrage, nur auf true wenn du das willst.

Settings.openWithCommand = true -- Öffnet das Menü per Befehl.
Settings.openCommand = "donateMenu" -- Der Befehl zum Öffnen des Menüs.

Settings.CashOrBank = "bank" -- "cash" oder "bank" (ESX-typische Konten)

Settings.VehicleStored = 0 -- NUR FÜR ESX

-- Item-Typen sollten wie die Tabellennamen in deiner Datenbank lauten
Settings.SqlVehicleType = "vehicle" -- Tabelle für Fahrzeuge
Settings.SqlAirType = "air" -- Tabelle für Flugzeuge
Settings.SqlBoatType = "boat" -- Tabelle für Boote

Settings.testDriveBlip = true -- Blip auf der Map für Probefahrt
Settings.testDriveBlipText = "Probefahrt" -- Blip-Text auf der Map
Settings.testDriveDrawText = "Du kannst die Probefahrt im Spenden-Menü starten" -- Text in der Nähe des Test-Drive-Orts
Settings.testDriveTime = 30 -- Dauer der Probefahrt in Sekunden
Settings.testDriveCoord = vector3(1219.88, -2934.43, 5.87) -- Koordinaten für die Probefahrt
Settings.testDriveCarSpawn = vector4(1216.51, -2918.03, 5.87, 37.31) -- Spawn-Position des Test-Fahrzeugs

Settings.GiveAddKeys = true -- Gibt dem Spieler Schlüssel, wenn er ein Fahrzeug kauft
Settings.GiveAddKeysFunction = function(newPlate)
    -- Schlüsselübergabe-Funktion, ggf. an dein Key-System anpassen (Standard für esx_vehiclelock, vehiclekeys, etc.)
    TriggerEvent("vehiclekeys:client:SetOwner", newPlate)
end
