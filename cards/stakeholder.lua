SMODS.Joker {
    key = 'stakeholder',
    config = { extra = { mult = 0, a_mult = 1, earn_flag = 0}},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.mult, card.ability.extra.a_mult}}
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    atlas = "ClipsJokers",
    pos = { x = 8, y = 0},
    cost = 6,

    calculate = function(self, card, context)
        -- begin checking during individual card scoring.
        if context.before 
        and not context.blueprint
        and G.GAME.dollar_buffer ~= nil then
            card.ability.extra.earn_flag = G.GAME.dollar_buffer
        end
        -- when cards are scored, gain mult
        if context.cardarea == G.play 
        and not self.debuff 
        and not context.blueprint
        and G.GAME.dollar_buffer ~= nil then
            if G.GAME.dollar_buffer > card.ability.extra.earn_flag then
                card.ability.extra.earn_flag = G.GAME.dollar_buffer
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult
                return {
                    message = localize('k_upgrade_ex'),
                    card = card,
                    colour = G.C.RED
                }
            end
        end

        if context.pre_joker 
        and not self.debuff
        and not context.blueprint
        and G.GAME.dollar_buffer ~= nil then
            if G.GAME.dollar_buffer > card.ability.extra.earn_flag then
                card.ability.extra.earn_flag = G.GAME.dollar_buffer
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult
                return {
                    message = localize('k_upgrade_ex'),
                    card = card,
                    colour = G.C.RED
                }
            end
        end
        
        if context.other_joker
        and not self.debuff
        and not context.blueprint
        and G.GAME.dollar_buffer ~= nil then
            if G.GAME.dollar_buffer > card.ability.extra.earn_flag then
                card.ability.extra.earn_flag = G.GAME.dollar_buffer
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.a_mult
                G.E_MANAGER:add_event(Event({func = (function() return {
                    message = localize('k_upgrade_ex'),
                    card = card,
                    colour = G.C.RED
                } end)}))
            end
        end

        -- apply the scored mult during main joker scoring loop
        if context.joker_main and card.ability.extra.mult > 0 and not self.debuff then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end
}