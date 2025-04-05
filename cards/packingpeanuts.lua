SMODS.Joker {
    key = "packingpeanuts",
    config = { extra = {scaling = 7, chips = 0}},
    loc_vars = function(self, info_queue,card)
        return { vars = { card.ability.extra.scaling, card.ability.extra.chips}}
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compate = true,
    rarity = 1,
    atlas = "ClipsJokers",
    pos = {x = 2, y = 0},
    cost = 4,
    calculate = function(self, card, context)
            if context.open_booster
            and not context.blueprint then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.scaling
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                }
            end

            if context.cardarea == G.jokers 
            and context.joker_main  
            and card.ability.extra.chips > 0 then
                return {
                    message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}},
                    chip_mod = card.ability.extra.chips, 
                    colour = G.C.CHIPS,
                }
            end
    end



    }   