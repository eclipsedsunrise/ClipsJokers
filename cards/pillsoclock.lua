SMODS.Joker {
    key = "pillsoclock",
    config = { extra = { target = 7, progress = 7, juiced = false }},
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.progress, card.ability.extra.target} }
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    atlas = "ClipsJokers",
    pos = {x = 3, y = 0},
    cost = 3,

    calculate = function(self, card, context)
        -- decriment the progress counter by one on discard
        if context.discard 
        and context.other_card == context.full_hand[#context.full_hand] 
        and not context.hook 
        and not context.blueprint then
            if card.ability.extra.progress > 0 then
                card.ability.extra.progress = card.ability.extra.progress - 1
            end
        end

        if context.before and context.cardarea == G.jokers then
            --if we've played or discarded 8 hands, reset the progress counter and upgrade the played hand.
            if card.ability.extra.progress <= 0 then
                card.ability.extra.progress = 7
                local text,disp_text = context.scoring_name
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex')})
                update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(text, 'poker_hands'),chips = G.GAME.hands[text].chips, mult = G.GAME.hands[text].mult, level=G.GAME.hands[text].level})
                level_up_hand(context.blueprint_card or card, text, nil, 1)
                card.ability.extra.juiced = false
            else
                --otherwise we just count this as another hand played.
                card.ability.extra.progress = card.ability.extra.progress - 1
            end

        end
        -- juice the card if no hands/discards are remaining.
        -- this function goes after the counting functions so the card remains juiced going to the next hand.
        if card.ability.extra.progress <= 0 and card.ability.extra.juiced == false then
            juice_card_until(card,function() return card.ability.extra.progress == 0 end, true)
            card.ability.extra.juiced = true
        end

    end
    }