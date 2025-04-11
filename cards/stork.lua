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
        and not self.debuff
        and #context.full_hand == 2 then
            local first_card
            local second_card
            if not context.full_hand[1].debuff then
                first_card = context.full_hand[1].base.nominal
            else
                first_card = 0
            end
            if not context.full_hand[2].debuff then
                second_card = context.full_hand[2].base.nominal
            else
                second_card = 0
            end

            if first_card + second_card > 0 then --nothing happens if both cards are debuffed
                return {
                    mult = first_card + second_card,
                    card = card,
                }
            end
        end
    end
}