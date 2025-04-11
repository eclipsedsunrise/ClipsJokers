SMODS.Joker {
    key = "jollyroger",
    config = {extra = { odds = 1, outof = 3, retrigger = false}},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.odds,
                card.ability.extra.outof,
                G.GAME and G.GAME.probabilities.normal or 1
            }
        }
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    rarity = 1,
    atlas = "ClipsJokers",
    pos = {x = 1, y = 1},
    cost = 6,

    calculate = function(self, card, context)
        -- The retrigger flag makes sure only the first card is destroyed.
        if context.before 
        and not self.debuff 
        and not context.blueprint then
            card.ability.extra.retrigger = false
        end

        if context.destroying_card and not context.blueprint then

            if card.ability.extra.retrigger == false 
            and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if pseudorandom('ropes') < (G.GAME.probabilities.normal/card.ability.extra.outof) then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local card = SMODS.create_card{set = "Tarot", area = G.consumeables}
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    card.ability.extra.retrigger = true
                    return {
                        message = localize('k_yar'),
                        card = card,
                    }
                end
            end
            -- disabling the probability check after the first card ensures a 1 in X chance
            card.ability.extra.retrigger = true
        end
    end
}
