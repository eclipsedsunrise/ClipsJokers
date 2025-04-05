SMODS.Joker {
    key = "stork",
    unlocked = true,
    discovered =  true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    cost = 5,
    atlas = "ClipsJokers",
    pos = { x = 5, y = 1},

    --if a hand is a Pair and contains only two cards,
    --Adds their combined value as mult.
    calculate = function(self, card, context)
        if context.joker_main 
        and next(context.poker_hands['Pair']) 
        and not context.debuff
        and #context.full_hand == 2 then
            local first_card = context.full_hand[1].base.nominal
            local second_card = context.full_hand[2].base.nominal
            return {
                mult = first_card + second_card,
                card = card,
            }
        end
    end
}