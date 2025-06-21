local preCategory = {
    label = "House",
    pageValue = "house-menu",
    categoryType = "house",
    items = {
        {
            id = 1,
            label = "House (1)",
            itemType = "house",
            price = 1000,
            filter = "Luxury",
            locationText = "Hyper Street 4518 / Los Santos",
            houseInfoText = "510m2",
            description = "This is a description for house 1",
            coords = {x = 1342.72, y = -596.97, z = 74.5},
            afterPurchaseTrigger = {
                clientOrServer = "server",
                trigger = "yourhouse:buy:event",
                parameters = {
                    id = "1",
                },
            },
            discount = {
                state = true,
                newPrice = 500,
            },
            itemImg = "./itemImages/house1.png",
        },
        -- {
        --     id = 2,
        --     label = "Item 2",
        --     itemName = "item1",
        --     itemType = "item",
        --     price = 1000,
        --     filter = "Valuable",
        --     description = "This is a description for item 1",
        --     discount = {
        --         state = false,
        --         newPrice = 500,
        --     },
        --     itemImg = "./img/fmj2.png",
        -- },
        -- {
        --     id = 3,
        --     label = "Item 2",
        --     itemName = "item1",
        --     itemType = "item",
        --     price = 1000,
        --     filter = "Valuable",
        --     description = "This is a description for item 1",
        --     discount = {
        --         state = false,
        --         newPrice = 500,
        --     },
        --     itemImg = "./img/fmj3.png",
        -- },
    },
},

Citizen.Wait(10)

if Settings.Debug then
    Settings.DebugPrint("House Category Preloaded", json.encode(preCategory))
end

table.insert(AK4Y.Categories, preCategory)
