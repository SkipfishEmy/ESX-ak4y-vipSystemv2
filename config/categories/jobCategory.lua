local preCategory = {
    label = "Job",
    pageValue = "job-menu",
    categoryType = "item",
    items = {
        {
            id = 1,
            label = "Police Job (Rookie)", -- label
            itemName = "police", -- This is the job name
            jobGrade = 1, -- This is the job grade
            itemType = "job", -- Dont change this
            price = 1000, -- This is the price
            filter = "Whitelist", -- This is the filter
            description = "You are the officer now!", -- This is the description
            discount = {
                state = true,
                newPrice = 900,
            },
            itemImg = "./itemImages/policeImage.png",
        },
        {
            id = 2,
            label = "Police Job (Commander)", -- label
            itemName = "police", -- This is the job name
            jobGrade = 5, -- This is the job grade
            itemType = "job", -- Dont change this
            price = 2500, -- This is the price
            filter = "Whitelist", -- This is the filter
            description = "You are the Commander now!", -- This is the description
            discount = {
                state = true,
                newPrice = 2300,
            },
            itemImg = "./itemImages/policeImage.png",
        },
        {
            id = 3,
            label = "Ambulance Job", -- label
            itemName = "ambulance", -- This is the job name
            jobGrade = 1, -- This is the job grade
            itemType = "job", -- Dont change this
            price = 1000, -- This is the price
            filter = "Whitelist", -- This is the filter
            description = "You are the Doctor now!", -- This is the description
            discount = {
                state = true,
                newPrice = 900,
            },
            itemImg = "./itemImages/doctorJob.png",
        },
        {
            id = 4,
            label = "Miner Job", -- label
            itemName = "miner", -- This is the job name
            jobGrade = 1, -- This is the job grade
            itemType = "job", -- Dont change this
            price = 500, -- This is the price
            filter = "Whitelist", -- This is the filter
            description = "You are the Miner now!", -- This is the description
            discount = {
                state = false,
                newPrice = 900,
            },
            itemImg = "./itemImages/minerJob.png",
        },
    },
},

Citizen.Wait(10)

if Settings.Debug then
    Settings.DebugPrint("Job Category Preloaded", json.encode(preCategory))
end

table.insert(AK4Y.Categories, preCategory)

