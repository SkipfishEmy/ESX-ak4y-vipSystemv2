local preCategory = {
    label = "Customize",
    pageValue = "customize-menu",
    categoryType = "customize",
    items = {
        {
            id = 1, -- should be unique
            price = 1000, -- Price (Without discount)
            label = "Plate Change", -- Display name
            itemType = "plate", -- Dont change for plate customizations.
            itemImg = "./itemImages/plate.png", -- Item image
            discount = { state = false, newPrice = 0 }, -- If you want to discount, set it to true
        },
        {
            id = 2, -- should be unique
            price = 1500, -- Price (Without discount)
            label = "Number Change", -- Display name
            itemType = "number", -- Dont change for number customizations.
            itemImg = "./itemImages/phone.png", -- Item image
            discount = { state = false, newPrice = 0 }, -- If you want to discount, set it to true
        },
    },
},

Citizen.Wait(10)

if Settings.Debug then
    Settings.DebugPrint("Customize Category Preloaded", json.encode(preCategory))
end

table.insert(AK4Y.Categories, preCategory)