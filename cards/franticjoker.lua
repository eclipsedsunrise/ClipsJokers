SMODS.Joker {
    key = "franticjoker",
    config = { extra = { h_discards = 2, h_plays = 1}},
    loc_vars = function(self, info_queue, card)
        -- note that the h_plays variable is passed as negative!
        return { vars = { card.ability.extra.h_discards, -card.ability.extra.h_plays } }
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = "ClipsJokers",
    pos = {x = 2, y = 1},

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.h_plays
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.h_discards
            ease_discard(card.ability.extra.h_discards)
        return true end }))
        end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.h_plays
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.h_discards
            ease_discard(-card.ability.extra.h_discards)
        return true end }))
        end,
}