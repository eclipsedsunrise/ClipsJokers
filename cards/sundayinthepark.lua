SMODS.Joker {
    key = "sundayinthepark",
    config = { extra = { repetitions = 1}},
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    atlas = "ClipsJokers",
    pos = {x = 2, y = 2},
    cost = 5,
    rarity = 1,

    --retriggers each played 2 and queen
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            if context.other_card:get_id() == 2 or context.other_card:get_id() == 12 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = card,
                }
            end
        end
    end
}