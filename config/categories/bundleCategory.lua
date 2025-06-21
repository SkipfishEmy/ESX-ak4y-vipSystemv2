local preCategory = {
    label = "Bundle",
    pageValue = "bundle-menu",
    categoryType = "bundle",
    items = {
        {
            id = 1, -- Should be unique 
            label = "Player Starter Pack", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Zentorno", itemName = "zentorno", itemCount = 1, itemType = "vehicle", garage = "pillboxgarage", itemImg = "./itemImages/zentorno.png" },
                { label = "Zentorno", itemName = "zentorno", itemCount = 1, itemType = "vehicle", garage = "pillboxgarage", itemImg = "./itemImages/zentorno.png" },
                { label = "Zentorno", itemName = "zentorno", itemCount = 1, itemType = "vehicle", garage = "pillboxgarage", itemImg = "./itemImages/zentorno.png" },
                            
                { label = "Pistol", itemName = "weapon_pistol", itemCount = 1, itemType = "weapon", itemImg = "./itemImages/weapon_pistol.png" },
                { label = "Pistol", itemName = "weapon_pistol", itemCount = 1, itemType = "weapon", itemImg = "./itemImages/weapon_pistol.png" },
                { label = "Pistol", itemName = "weapon_pistol", itemCount = 1, itemType = "weapon", itemImg = "./itemImages/weapon_pistol.png" },
            
                { label = "Bandage", itemName = "bandage", itemCount = 1, itemType = "item", itemImg = "./itemImages/bandage.png" },
                { label = "Bandage", itemName = "bandage", itemCount = 1, itemType = "item", itemImg = "./itemImages/bandage.png" },
                { label = "Bandage", itemName = "bandage", itemCount = 1, itemType = "item", itemImg = "./itemImages/bandage.png" },

                { label = "Money ($10.000)", itemName = "money", itemCount = 10000, itemType = "money", itemImg = "./itemImages/dirtymoney.png"},
                { label = "Money ($10.000)", itemName = "money", itemCount = 10000, itemType = "money", itemImg = "./itemImages/dirtymoney.png"},
            },
            price = 1000, -- Price (Without discount)
            description = "This is a starter pack for new players, it includes weapons, vehicles, and more!",
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
    },
},

Citizen.Wait(10)

if Settings.Debug then
    Settings.DebugPrint("Bundle Category Preloaded", json.encode(preCategory))
end

table.insert(AK4Y.Categories, preCategory)