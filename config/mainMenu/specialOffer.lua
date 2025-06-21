AK4Y.specialOffer = {
    id = 1,
	label = "SPECIAL OFFER",
	itemName = "special_offer", -- dont change
	description = "Lorem ipsum text description",
	itemType = "bundle", -- dont change
	pageValue = "specialOffer", -- dont CHANGE
	giveItems = { 
		{ label = "Zentorno", itemName = "zentorno", itemCount = 1, itemType = "vehicle", garage = "pillboxgarage", itemImg = "./itemImages/zentorno.png" },                    
        { label = "Pistol", itemName = "weapon_pistol", itemCount = 1, itemType = "weapon", itemImg = "./itemImages/weapon_pistol.png" },
        { label = "Bandage", itemName = "bandage", itemCount = 1, itemType = "item", itemImg = "./itemImages/bandage.png" },
        { label = "Money ($10.000)", itemName = "money", itemCount = 10000, itemType = "money", itemImg = "./itemImages/dirtymoney.png"},
    },
	price = 1000, -- price without discount
	discount = {
		state = true, -- true or false
		newPrice = 600, -- price with discount
	},
}