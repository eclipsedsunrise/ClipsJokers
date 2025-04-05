SMODS.Joker {
    key = "rapierwit",
    config = {extra = { x_mult = 1, a_x_mult = .5, default_x_mult = 1, x_mult_used = false}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.a_x_mult}}
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    atlas = "ClipsJokers",
    pos = { x = 3, y = 2},
    cost = 7,

    calculate = function(self, card, context)
        if card.ability.extra.x_mult_used == true then
            card.ability.extra.x_mult = card.ability.extra.default_x_mult
            card.ability.extra.x_mult_used = false
        end
        if context.joker_main         
        and not self.debuff then
            if (next(context.poker_hands['Straight']) or next(context.poker_hands['Straight Flush']))
            and card.ability.extra.x_mult > 1 then
                card.ability.extra.x_mult_used = true
                return {
                    xmult = card.ability.extra.x_mult,
                    message = localize("k_riposte"),
                    colour = G.C.MULT,
                    card = card,
                }
            elseif not context.blueprint then
                card.ability.extra.x_mult = card.ability.extra.a_x_mult + card.ability.extra.x_mult
                return {
                    message = localize('k_upgrade_ex'),
                    card = card,
                }
            end
        end
    end
}