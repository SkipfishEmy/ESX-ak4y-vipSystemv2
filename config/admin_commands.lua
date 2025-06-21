-- Nur ESX!
Framework.RegisterCommand('addvipcredit', 'admin', function(xPlayer, args, showError)
    addCredit(args.player.source, args.credit)
end, true, {
    help = "Füge VIP-Credits für einen Spieler hinzu.",
    validate = true,
    arguments = {
        {name = 'player', help = "Spieler-Quelle (ID)", type = 'player'},
        {name = 'credit', help = "Anzahl der Credits", type = 'number'}
    }
})

Framework.RegisterCommand('removevipcredit', 'admin', function(xPlayer, args, showError)
    removeCredit(args.player.source, args.credit)
end, true, {
    help = "Entferne VIP-Credits von einem Spieler.",
    validate = true,
    arguments = {
        {name = 'player', help = "Spieler-Quelle (ID)", type = 'player'},
        {name = 'credit', help = "Anzahl der Credits", type = 'number'}
    }
})
