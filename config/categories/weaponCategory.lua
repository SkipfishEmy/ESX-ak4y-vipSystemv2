local preCategory = {
    label = "Weapon", 
    pageValue = "weapon-menu",
    categoryType = "item",
    items = {
        {
            id = 1, -- Should be unique 
            label = "AP Pistol", -- Display name
            itemName = "weapon_appistol", -- Item name (giving item)
            itemType = "weapon", -- Type of item (if your item is a weapon, then you should set it to weapon)
            filter = "Pistol", -- Filter name
            itemCount = 1, -- How many items should be given
            price = 750, -- Price (Without discount)
            description = "This is a powerful AP Pistol that can be used for various purposes.", -- Description
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 700, -- New price (if discount is active)
            },
            itemImg = "./itemImages/weapon_appistol.png", -- Item image
        },
        {
            id = 2, -- Should be unique 
            label = "Combat Pistol", -- Display name
            itemName = "weapon_combatpistol", -- Item name (giving item)
            itemType = "weapon", -- Type of item (if your item is a weapon, then you should set it to weapon)
            filter = "Pistol", -- Filter name
            itemCount = 1, -- How many items should be given
            price = 1000, -- Price (Without discount)
            description = "The Combat Pistol is a popular choice among law enforcement officers for its reliability and accuracy.", -- Description
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
            itemImg = "./itemImages/weapon_combatpistol.png", -- Item image
        },
        {
            id = 3, -- Should be unique 
            label = "Pistol", -- Display name
            itemName = "weapon_pistol", -- Item name (giving item)
            itemType = "weapon", -- Type of item (if your item is a weapon, then you should set it to weapon)
            filter = "Pistol", -- Filter name
            itemCount = 1, -- How many items should be given
            price = 550, -- Price (Without discount)
            description = "The Pistol is a simple and reliable firearm that is commonly used for self-defense and target shooting.", -- Description
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/weapon_pistol.png", -- Item image
        },
        {
            id = 4, -- Should be unique 
            label = "SNS Pistol", -- Display name
            itemName = "weapon_snspistol", -- Item name (giving item)
            itemType = "weapon", -- Type of item (if your item is a weapon, then you should set it to weapon)
            filter = "Pistol", -- Filter name
            itemCount = 1, -- How many items should be given
            price = 450, -- Price (Without discount)
            description = "This is a small weapon.", -- Description
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/weapon_snspistol.png", -- Item image
        },
        {
            id = 5, -- Should be unique 
            label = "Mini SMG", -- Display name
            itemName = "weapon_minismg", -- Item name (giving item)
            itemType = "weapon", -- Type of item (if your item is a weapon, then you should set it to weapon)
            filter = "SMG", -- Filter name
            itemCount = 1, -- How many items should be given
            price = 1000, -- Price (Without discount)
            description = "The Mini SMG is a compact and lightweight submachine gun that excels in close-quarters combat. Its high rate of fire and maneuverability make it a popular choice for covert operations and tight spaces.", -- Description
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/weapon_minismg.png", -- Item image
        },
        {
            id = 6, -- Should be unique 
            label = "SMG", -- Display name
            itemName = "weapon_smg", -- Item name (giving item)
            itemType = "weapon", -- Type of item (if your item is a weapon, then you should set it to weapon)
            filter = "SMG", -- Filter name
            itemCount = 1, -- How many items should be given
            price = 1550, -- Price (Without discount)
            description = "The SMG is a powerful submachine gun that offers high firepower and accuracy. It is commonly used in close-quarters combat and excels in suppressing enemies.", -- Description
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 1500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/weapon_smg.png", -- Item image
        },
        {
            id = 7, -- Should be unique 
            label = "Knife", -- Display name
            itemName = "weapon_knife", -- Item name (giving item)
            itemType = "weapon", -- Type of item (if your item is a weapon, then you should set it to weapon)
            filter = "Melee", -- Filter name
            itemCount = 1, -- How many items should be given
            price = 300, -- Price (Without discount)
            description = "This is a simple and straightforward knife that is commonly used for various tasks such as cutting, slicing, and stabbing. It is a versatile tool that can be used in both everyday situations and survival scenarios.", -- Description
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 250, -- New price (if discount is active)
            },
            itemImg = "./itemImages/weapon_knife.png", -- Item image
        },
        {
            id = 8, -- Should be unique 
            label = "Nightstick", -- Display name
            itemName = "weapon_nightstick", -- Item name (giving item)
            itemType = "weapon", -- Type of item (if your item is a weapon, then you should set it to weapon)
            filter = "Melee", -- Filter name
            itemCount = 1, -- How many items should be given
            price = 300, -- Price (Without discount)
            description = "The Nightstick is a versatile melee weapon commonly used by law enforcement officers. It is a compact and lightweight baton that can be used for self-defense and subduing suspects. Its sturdy construction and ergonomic design make it an effective tool in close-quarters combat.", -- Description
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 250, -- New price (if discount is active)
            },
            itemImg = "./itemImages/weapon_nightstick.png", -- Item image
        },
        {
            id = 9, -- Should be unique 
            label = "Wrench", -- Display name
            itemName = "weapon_wrench", -- Item name (giving item)
            itemType = "weapon", -- Type of item (if your item is a weapon, then you should set it to weapon)
            filter = "Melee", -- Filter name
            itemCount = 1, -- How many items should be given
            price = 300, -- Price (Without discount)
            description = "The Wrench is a versatile tool commonly used for mechanical repairs and maintenance. It is a sturdy and durable handheld tool that can be used to tighten or loosen nuts, bolts, and other fasteners. Its compact size and ergonomic design make it easy to use in tight spaces. Whether you're a professional mechanic or a DIY enthusiast, the Wrench is an essential tool for any toolbox.", -- Description
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 250, -- New price (if discount is active)
            },
            itemImg = "./itemImages/weapon_wrench.png", -- Item image
        },
        {
            id = 10, -- Should be unique 
            label = "Grenade", -- Display name
            itemName = "weapon_grenade", -- Item name (giving item)
            itemType = "weapon", -- Type of item (if your item is a weapon, then you should set it to weapon)
            filter = "Explosion", -- Filter name
            itemCount = 1, -- How many items should be given
            price = 1700, -- Price (Without discount)
            description = "The Grenade is a powerful explosive device that can be thrown to cause significant damage to enemies and structures. It is commonly used in combat situations to clear out enemy positions or create diversions. The Grenade's explosive power and versatility make it a valuable tool for both offensive and defensive strategies.", -- Description
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 1500, -- New price (if discount is active)
            },
            itemImg = "./itemImages/weapon_grenade.png", -- Item image
        },
        {
            id = 11, -- Should be unique 
            label = "Armor", -- Display name
            itemName = "Armor", -- Item name (giving item)
            itemType = "item", -- Type of item (if your item is a weapon, then you should set it to weapon)
            filter = "Defence", -- Filter name
            itemCount = 1, -- How many items should be given
            price = 200, -- Price (Without discount)
            description = "The Grenade is a powerful explosive device that can be thrown to cause significant damage to enemies and structures. It is commonly used in combat situations to clear out enemy positions or create diversions. The Grenade's explosive power and versatility make it a valuable tool for both offensive and defensive strategies.", -- Description
            discount = { -- Discount settings...
                state = true, -- If you want to discount, set it to true
                newPrice = 180, -- New price (if discount is active)
            },
            itemImg = "./itemImages/armor.png", -- Item image
        },
    },
},

Citizen.Wait(10)

if Settings.Debug then
    Settings.DebugPrint("Weapon Category Preloaded", json.encode(preCategory))
end

table.insert(AK4Y.Categories, preCategory)

