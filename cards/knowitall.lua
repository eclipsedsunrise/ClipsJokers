SMODS.Joker {
    key = "knowitall",
    config = { extra = { mult = 4, hits = 0}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult}}
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = "ClipsJokers",
    pos = { x = 0, y = 1},
    cost = 4,

     -- scored cards get +_ mult for each card in hand which shares a rank with it.
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.end_of_round then
            card.ability.extra.hits = 0
            for i=1, #G.hand.cards do
                if G.hand.cards[i].base.id == context.other_card.base.id
                and G.hand.cards[i].ability.effect ~= 'Stone Card' 
                and not G.hand.cards[i].debuff then
                    card.ability.extra.hits = card.ability.extra.hits + 1
                end
            end
            if card.ability.extra.hits ~= 0 then
                return {
                    card = card,
                    mult = card.ability.extra.mult * card.ability.extra.hits,
                    message = localize('k_actually'),
                }
            end
        end
    end
}