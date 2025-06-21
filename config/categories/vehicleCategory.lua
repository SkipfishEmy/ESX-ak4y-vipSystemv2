local preCategory = {
    label = "Vehicle", -- Category Label
    pageValue = "vehicle-menu", -- DONT Change page value (This is the page name value) ("vehicle-menu" for vehicle menu)
    categoryType = "vehicle", -- Dont change this value
    items = {
        {
            id = 1, -- Should be unique
            label = "Adder", -- Display name
            itemName = "adder", -- Item name ( Spawn name for vehicle )
            filter = "Super", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 95, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 80, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 35, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 800, -- New price (if discount is active)
            },
            itemImg = "./itemImages/adder.png", -- Item image
        },
        {
            id = 2, -- Should be unique 
            label = "Baller 3", -- Display name
            itemName = "baller3", -- Item name ( Spawn name for vehicle )
            filter = "SUV", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 350, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 70, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 70, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 80, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/baller3.png", -- Item image
        },
        {
            id = 3, -- Should be unique 
            label = "Zentorno", -- Display name
            itemName = "zentorno", -- Item name ( Spawn name for vehicle )
            filter = "Super", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 950, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 90, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 75, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 30, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 800, -- New price (if discount is active)
            },
            itemImg = "./itemImages/zentorno.png", -- Item image
        },
        {
            id = 4, -- Should be unique 
            label = "superd", -- Display name
            itemName = "superd", -- Item name ( Spawn name for vehicle )
            filter = "Sedan", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 700, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 50, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 35, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 85, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 800, -- New price (if discount is active)
            },
            itemImg = "./itemImages/superd.png", -- Item image
        },
        {
            id = 5, -- Should be unique 
            label = "T20", -- Display name
            itemName = "t20", -- Item name ( Spawn name for vehicle )
            filter = "Super", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1500, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 70, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 50, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 800, -- New price (if discount is active)
            },
            itemImg = "./itemImages/t20.png", -- Item image
        },
        {
            id = 6, -- Should be unique 
            label = "Comet 2", -- Display name
            itemName = "comet2", -- Item name ( Spawn name for vehicle )
            filter = "Super", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 900, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 75, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 70, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 50, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 800, -- New price (if discount is active)
            },
            itemImg = "./itemImages/comet2.png", -- Item image
        },
        {
            id = 6, -- Should be unique 
            label = "Diablous", -- Display name
            itemName = "diablous", -- Item name ( Spawn name for vehicle )
            filter = "Motocycle", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 300, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 75, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 70, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 20, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 250, -- New price (if discount is active)
            },
            itemImg = "./itemImages/diablous.png", -- Item image
        },
        {
            id = 7, -- Should be unique 
            label = "Double", -- Display name
            itemName = "double", -- Item name ( Spawn name for vehicle )
            filter = "Motocycle", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 300, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 75, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 70, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 20, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 250, -- New price (if discount is active)
            },
            itemImg = "./itemImages/double.png", -- Item image
        },
        {
            id = 8, -- Should be unique 
            label = "FMJ", -- Display name
            itemName = "fmj", -- Item name ( Spawn name for vehicle )
            filter = "Super", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1650, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 70, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 20, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 1500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/fmj.png", -- Item image
        },
        {
            id = 9, -- Should be unique 
            label = "Bison 2", -- Display name
            itemName = "bison2", -- Item name ( Spawn name for vehicle )
            filter = "Offroad", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 500, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 30, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 30, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 50, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 450, -- New price (if discount is active)
            },
            itemImg = "./itemImages/bison2.png", -- Item image
        },
        {
            id = 10, -- Should be unique 
            label = "Dubsta 2", -- Display name
            itemName = "dubsta2", -- Item name ( Spawn name for vehicle )
            filter = "Offroad", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 500, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 50, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 30, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 50, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 450, -- New price (if discount is active)
            },
            itemImg = "./itemImages/dubsta2.png", -- Item image
        },
        {
            id = 11, -- Should be unique 
            label = "Volatus", -- Display name
            itemName = "volatus", -- Item name ( Spawn name for vehicle )
            filter = "Helicopter", -- Filter name
            itemType = "air", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 3000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 80, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 0, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 2500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/volatus.png", -- Item image
        },
        {
            id = 12, -- Should be unique 
            label = "Swift 2", -- Display name
            itemName = "swift2", -- Item name ( Spawn name for vehicle )
            filter = "Helicopter", -- Filter name
            itemType = "air", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 3000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 80, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 0, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 2500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/swift2.png", -- Item image
        },
        {
            id = 13, -- Should be unique 
            label = "Miljet", -- Display name
            itemName = "miljet", -- Item name ( Spawn name for vehicle )
            filter = "Airplane", -- Filter name
            itemType = "air", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 8000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 80, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 0, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 7500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/miljet.png", -- Item image
        },
        {
            id = 14, -- Should be unique 
            label = "Seabreeze", -- Display name
            itemName = "seabreeze", -- Item name ( Spawn name for vehicle )
            filter = "Airplane", -- Filter name
            itemType = "air", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 70, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 50, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 0, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 7500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/seabreeze.png", -- Item image
        },
        {
            id = 15, -- Should be unique 
            label = "Chimera", -- Display name
            itemName = "chimera", -- Item name ( Spawn name for vehicle )
            filter = "Motocycle", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 600, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 70, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 50, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 35, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 7500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/chimera.png", -- Item image
        },
        {
            id = 16, -- Should be unique 
            label = "Coquette", -- Display name
            itemName = "coquette", -- Item name ( Spawn name for vehicle )
            filter = "Sport", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 600, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 65, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 50, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 35, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 7500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/coquette.png", -- Item image
        },
        {
            id = 17, -- Should be unique 
            label = "Drafter", -- Display name
            itemName = "drafter", -- Item name ( Spawn name for vehicle )
            filter = "Sport", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat... (if motocycle, set it to vehicle)
            itemCount = 1, -- Just 1 for vehicle
            garage = "pillboxgarage", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 600, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 65, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 65, fa = "fa-solid fa-angles-down" },
                { label = "Suspansion", stat = 40, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 550, -- New price (if discount is active)
            },
            itemImg = "./itemImages/drafter.png", -- Item image
        },
    },
}

Citizen.Wait(10)

if Settings.Debug then
    Settings.DebugPrint("Vehicle Category Preloaded", json.encode(preCategory))
end

table.insert(AK4Y.Categories, preCategory)
