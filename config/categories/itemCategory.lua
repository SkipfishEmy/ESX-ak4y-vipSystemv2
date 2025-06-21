local preCategory =  {
    label = "Item",
    pageValue = "item-menu",
    categoryType = "item",
    items = {
        {
            id = 1, -- should be unique
            label = "Acid", -- item label 
            itemName = "acid", -- item name (used for giving item)
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 100, -- item price (without discount)
            filter = "Drug", -- item filter (used for filtering items)
            description = "Acid is a powerful drug that is known for its hallucinogenic effects. It is commonly used recreationally for its mind-altering properties. Use with caution and always follow safety guidelines.",
            discount = { -- discount state and new price
                state = true, -- discount state
                newPrice = 95, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/acid.png", -- item image path
        },
        {
            id = 2, -- should be unique
            label = "Advanced Tool Kit", -- item label ,
            itemName = "advancedkit", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 80, -- item price (without discount)
            filter = "Tool", -- item filter (used for filtering items)
            description = "The Advanced Tool Kit is a high-quality tool kit that is designed for professional use. It contains a wide range of tools that are essential for any mechanic or handyman. The Advanced Tool Kit is perfect for anyone who needs a reliable and durable tool kit that can handle any job.",
            discount = { -- discount state and new price
                state = true, -- discount state
                newPrice = 70, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/advancedkit.png", -- item image path
        },
        {
            id = 3, -- should be unique
            label = "Bandage", -- item label 
            itemName = "bandage", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 80, -- item price (without discount)
            filter = "Medical", -- item filter (used for filtering items)
            description = "The Bandage is a simple medical item that is used to stop bleeding and promote healing. It is an essential item for anyone who is involved in combat or other dangerous activities. The Bandage is easy to use and can be applied quickly in an emergency.",
            discount = { -- discount state and new price
                state = true, -- discount state
                newPrice = 70, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/bandage.png", -- item image path
        },
        {
            id = 4, -- should be unique
            label = "Binoculars", -- item label 
            itemName = "binoculars", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 80, -- item price (without discount)
            filter = "Tool", -- item filter (used for filtering items)
            description = "The Binoculars are a high-quality pair of binoculars that are perfect for birdwatching, hunting, and other outdoor activities. They are lightweight, durable, and easy to use, making them the perfect accessory for any outdoor enthusiast. The Binoculars are also great for surveillance and other security-related tasks.",
            discount = { -- discount state and new price
                state = true, -- discount state
                newPrice = 70, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/binoculars.png", -- item image path
        },
        {
            id = 5, -- should be unique
            label = "Bitcoin", -- item label 
            itemName = "bitcoin", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 110, -- item price (without discount)
            filter = "Currency", -- item filter (used for filtering items)
            description = "Bitcoin is a digital currency that is used for online transactions. It is a decentralized currency that is not controlled by any government or financial institution. Bitcoin is a popular choice for online purchases and is accepted by many online retailers. It is also used as an investment and is traded on various online exchanges.",
            discount = { -- discount state and new price
                state = false, -- discount state
                newPrice = 70, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/bitcoin.png", -- item image path
        },
        {
            id = 6, -- should be unique
            label = "Master Card", -- item label 
            itemName = "creditcard_master", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 110, -- item price (without discount)
            filter = "Currency", -- item filter (used for filtering items)
            description = "Master Card is a digital currency that is used for online transactions. It is a decentralized currency that is not controlled by any government or financial institution. Master Card is a popular choice for online purchases and is accepted by many online retailers. It is also used as an investment and is traded on various online exchanges.",
            discount = { -- discount state and new price
                state = false, -- discount state
                newPrice = 70, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/creditcard_master.png", -- item image path
        },
        {
            id = 7, -- should be unique
            label = "Drone", -- item label 
            itemName = "drone", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 150, -- item price (without discount)
            filter = "Tech", -- item filter (used for filtering items)
            description = "The Drone is a high-quality remote-controlled drone that is perfect for aerial photography, surveillance, and other applications. It is easy to fly and has a range of advanced features that make it ideal for both beginners and experienced users. The Drone is also great for recreational use and can provide hours of entertainment for the whole family.",
            discount = { -- discount state and new price
                state = false, -- discount state
                newPrice = 70, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/drone.png", -- item image path
        },
        {
            id = 8, -- should be unique
            label = "First Aid Kit", -- item label 
            itemName = "firstaid", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 80, -- item price (without discount)
            filter = "Medical", -- item filter (used for filtering items)
            description = "The First Aid Kit is a comprehensive medical kit that is designed for emergency situations. It contains a wide range of medical supplies that are essential for treating injuries and illnesses. The First Aid Kit is perfect for anyone who needs a reliable and durable medical kit that can handle any emergency.",
            discount = { -- discount state and new price
                state = false, -- discount state
                newPrice = 70, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/firstaid.png", -- item image path
        },
        {
            id = 9, -- should be unique
            label = "Hacking Device", -- item label 
            itemName = "hackingdevice-1", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 180, -- item price (without discount)
            filter = "Tech", -- item filter (used for filtering items)
            description = "The Hacking Device is a high-quality device that is designed for hacking into computer systems and networks. It is perfect for anyone who needs to bypass security measures and gain access to restricted information. The Hacking Device is easy to use and has a range of advanced features that make it ideal for both beginners and experienced users.",
            discount = { -- discount state and new price
                state = false, -- discount state
                newPrice = 70, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/hackingdevice-1.png", -- item image path
        },
        {
            id = 10, -- should be unique
            label = "Joint", -- item label 
            itemName = "joint", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 80, -- item price (without discount)
            filter = "Drug", -- item filter (used for filtering items)
            description = "The Joint is a popular drug that is known for its relaxing and euphoric effects. It is commonly used recreationally for its calming properties. The Joint is perfect for anyone who needs to unwind and relax after a long day. Use with caution and always follow safety guidelines.",
            discount = { -- discount state and new price
                state = true, -- discount state
                newPrice = 70, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/joint.png", -- item image path
        },
        {
            id = 11, -- should be unique
            label = "Nightvision Goggles -- item label ",
            itemName = "nightvision", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 80, -- item price (without discount)
            filter = "Tech", -- item filter (used for filtering items)
            description = "The Nightvision Goggles are a high-quality pair of night vision goggles that are perfect for surveillance, hunting, and other applications. They are lightweight, durable, and easy to use, making them the perfect accessory for any outdoor enthusiast. The Nightvision Goggles are also great for security-related tasks and can provide a tactical advantage in low-light conditions.",
            discount = { -- discount state and new price
                state = true, -- discount state
                newPrice = 70, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/nightvision.png", -- item image path
        },
        {
            id = 12, -- should be unique
            label = "Parachute", -- item label 
            itemName = "parachute_blue", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 65, -- item price (without discount)
            filter = "Tool", -- item filter (used for filtering items)
            description = "The Parachute is a high-quality parachute that is perfect for skydiving, base jumping, and other aerial activities. It is lightweight, durable, and easy to use, making it the perfect accessory for any thrill-seeker. The Parachute is also great for emergency situations and can provide a safe landing in the event of an accident.",
            discount = { -- discount state and new price
                state = true, -- discount state
                newPrice = 40, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/parachute_blue.png", -- item image path
        },
        {
            id = 13, -- should be unique
            label = "Steroids", -- item label 
            itemName = "steroids", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 110, -- item price (without discount)
            filter = "Drug", -- item filter (used for filtering items)
            description = "Steroids are a powerful drug that is known for its muscle-building effects. They are commonly used by athletes and bodybuilders to increase strength and endurance. Steroids are perfect for anyone who wants to improve their physical performance and achieve their fitness goals. Use with caution and always follow safety guidelines.",
            discount = { -- discount state and new price
                state = true, -- discount state
                newPrice = 85, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/steroids.png", -- item image path
        },
    },
},


Citizen.Wait(10)

if Settings.Debug then
    Settings.DebugPrint("Item Category Preloaded", json.encode(preCategory))
end

table.insert(AK4Y.Categories, preCategory)
