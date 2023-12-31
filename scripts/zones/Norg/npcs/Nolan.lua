-----------------------------------
-- Area: Norg
--  NPC: Nolan
-- Escha Gear Augment Services
-- !pos 12.107 0.142 23.005 252
-----------------------------------
local ID = require("scripts/zones/Norg/IDs")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------

local zitahGear =
{
    26794, -- ( 1) Rawhide Mask
    26950, -- ( 2) Rawhide Vest
    27100, -- ( 3) Rawhide Gloves
    27285, -- ( 4) Rawhide Trousers
    27460, -- ( 5) Rawhide Boots
    26792, -- ( 6) Despair Helm
    26948, -- ( 7) Despair Mail
    27098, -- ( 8) Despair Gauntlets
    27283, -- ( 9) Despair Cuisses
    27458, -- (10) Despair Greaves
    26791, -- (11) Eschite Helm
    26947, -- (12) Eschite Breastplate
    27097, -- (13) Eschite Gauntlets
    27282, -- (14) Eschite Cuisses
    27457, -- (15) Eschite Greaves
    26793, -- (16) Naga Somen
    26949, -- (17) Naga Samue
    27099, -- (18) Naga Tekko
    27284, -- (19) Naga Hakama
    27459, -- (20) Naga Kyahan
    26795, -- (21) Pursuer's Beret
    26951, -- (22) Pursuer's Doublet
    27101, -- (23) Pursuer's Cuffs
    27286, -- (24) Pursuer's Pants
    27461, -- (25) Pursuer's Gaiters
    26796, -- (26) Psycloth Tiara
    26952, -- (27) Psycloth Vest
    27102, -- (28) Psycloth Manillas
    27287, -- (29) Psycloth Lappas
    27462, -- (30) Psycloth Boots
    26797, -- (31) Vanya Hood
    26953, -- (32) Vanya Robe
    27103, -- (33) Vanya Cuffs
    27288, -- (34) Vanya Slops
    27463, -- (35) Vanya Clogs
    20983, -- (36) Mijin (Katana)
    20710, -- (37) Nibiru Blade (Sword)
    21216, -- (38) Nibiru Bow (Archery)
    20848, -- (39) Nibiru Chopper (Great Axe)
    21092, -- (40) Nibiru Cudgel (Club)
    21699, -- (41) Nibiru Faussar (Great Sword)
    21273, -- (42) Nibiru Gun (Marksmanship)
    21399, -- (43) Nibiru Harp (String)
    20600, -- (44) Nibiru Knife (Dagger)
    20939, -- (45) Nibiru Lance (Polearm)
    20524, -- (46) Nibiru Sainti (Hand-to-Hand)
    27642, -- (47) Nibiru Shield (Shield)
    20895, -- (48) Nibiru Sickle (Scythe)
    21156, -- (49) Nibiru Staff (Staff)
    20801, -- (50) Nibiru Tabar (Axe)
    21031, -- (51) Sensui (Great Katana)
}

local augCurrency =
{
    9177, -- Mog Kupon AW-GF
    9176, -- Mog Kupon AW-GFII
    9175, -- Mog Kupon AW-GFIII
    9187, -- Mog Kupon AW-GeIV
}

function onTrade(player, npc, trade)
    local pathKupon        = 0
    local eschalixer       = {{9084, 60}, {9085, 12}, {9086, 3}}
    local elixerFound      = 0
    local augGear          = 0
    local zitahGearCounter = 0

    -- Check for the required path dictating kupon
    for i = 1, #eschalixer do
        if (npcUtil.tradeHas(trade, {eschalixer[i]})) then
            elixerFound = eschalixer[i]
            break
        end
    end

    -- Cancel the transaction if no eschalixer is found or not enough was traded
    if elixerFound == 0 then
        player:PrintToPlayer(string.format("Nolan : I need the magical essence from Eschalixers to make this work."),tpz.msg.channel.NS_SAY)
        return
    end

    -- Check for the required path dictating kupon
    for i = 1, #augCurrency do
        if (npcUtil.tradeHas(trade, {augCurrency[i]})) then
            pathKupon = augCurrency[i]
            break
        end
    end

    -- Cancel the transaction if no Kupon is found
    if pathKupon == 0 then
        player:PrintToPlayer(string.format("Nolan : I really need a Kupon so I know what path you want."),tpz.msg.channel.NS_SAY)
        return
    end

    -- Check for the piece of gear
    for i = 1, #zitahGear do
        if npcUtil.tradeHas(trade, zitahGear[i]) then
            augGear = zitahGear[i]
            zitahGearCounter = i
            break
        end
    end

    -- Cancel the transaction if no gear is found
    if augGear == 0 then
        player:PrintToPlayer(string.format("Nolan : Where's the gear?"),tpz.msg.channel.NS_SAY)
        return
    end

    player:tradeComplete()
    player:PrintToPlayer(string.format("Nolan : This should satisfy you."),tpz.msg.channel.NS_SAY)

    -- Path A (Mog Kupon AW-GF)
    if pathKupon == 9177 then
        -- Rawhide
        if zitahGearCounter <= 5 then
            player:addItem(augGear, 1, 513, 9, 512, 6, 516, 6) -- DEX +10, STR +7, INT +7 DONE
        -- Despair
        elseif zitahGearCounter <= 10 then
            player:addItem(augGear, 1, 2, 17, 514, 9, 356, 4) -- HP +50, VIT +10, Cure Pot Rec +5 DONE
        -- Eschite
        elseif zitahGearCounter <= 15 then
            player:addItem(augGear, 1, 3, 15, 39, 6, 54, 3) -- HP +80, ENM +7, PDT -4 DONE
        -- Naga
        elseif zitahGearCounter <= 20 then
            player:addItem(augGear, 1, 512, 9, 23, 14, 44, 6) -- STR +10, ACC +15, Subtle Blow +7 DONE
        -- Persuer
        elseif zitahGearCounter <= 25 then
            player:addItem(augGear, 1, 515, 9, 139, 9, 195, 6) -- AGI +10, Rapid Shot +10, Subtle Blow +7 DONE
        -- Psycloth
        elseif zitahGearCounter <= 30 then
            player:addItem(augGear, 1, 10, 17, 516, 6, 141, 5) -- MP +50, INT +7, Conserve MP +6 DONE
        -- Vanya
        elseif zitahGearCounter <= 35 then
            player:addItem(augGear, 1, 10, 17, 329, 6, 40, 5) -- MP +50, Cure potency +7%, Enmity -6 DONE
        -- Mijin
        elseif zitahGearCounter == 36 then
            player:addItem(augGear, 1, 25, 14, 23, 14, 27, 14) -- ATT +15, ACC +15, RACC +15 DONE
        -- Nibiru Blade
        elseif zitahGearCounter == 37 then
            player:addItem(augGear, 1, 513, 9, 23, 19, 35, 14) -- DEX +10, ACC +20, MACC +15 DONE
        -- Nibiru Bow
        elseif zitahGearCounter == 38 then
            player:addItem(augGear, 1, 515, 9, 27, 24, 40, 5) -- AGI +10, RACC +25, Enmity -6 DONE
        -- Nibiru Chopper
        elseif zitahGearCounter == 39 then
            player:addItem(augGear, 1, 2, 17, 512, 9, 23, 24) -- HP +50, STR +10, ACC +25 DONE
        -- Nibiru Cudgel
        elseif zitahGearCounter == 40 then
            player:addItem(augGear, 1, 517, 9, 35, 14, 329, 14) -- MND +10, MACC +15, Cure Potency +15 DONE
        -- Nibiru Faussar
        elseif zitahGearCounter == 41 then
            player:addItem(augGear, 1, 512, 9, 25, 24, 35, 14) -- STR +10, ATT +25, MACC +15 DONE
        -- Nibiru Gun
        elseif zitahGearCounter == 42 then
            player:addItem(augGear, 1, 512, 9, 27, 14, 142, 2) -- STR +10, RACC +15, Store TP +3 DONE
        -- Nibiru Harp
        elseif zitahGearCounter == 43 then
            player:addItem(augGear, 1, 10, 17, 35, 9, 67, 1) -- MP +50, MACC +10, All Songs +2 DONE
        -- Nibiru Knife
        elseif zitahGearCounter == 44 then
            player:addItem(augGear, 1, 23, 19, 25, 14, 31, 19) -- ACC +20, ATT +15, EVA +20 DONE
        -- Nibiru Lance
        elseif zitahGearCounter == 45 then
            player:addItem(augGear, 1, 512, 9, 23, 19, 143, 2) -- STR +10, ACC +20, Double Attack +3 DONE
        -- Nibiru Sainti
        elseif zitahGearCounter == 46 then
            player:addItem(augGear, 1, 23, 24, 512, 6, 195, 6) -- ACC +25, STR +7, Subtle Blow +7 DONE
        -- Nibiru Shield
        elseif zitahGearCounter == 47 then
            player:addItem(augGear, 1, 3, 15, 39, 6, 54, 4) -- HP +80, Enmity +7, PDT -5% DONE
        -- Nibiru Sickle
        elseif zitahGearCounter == 48 then
            player:addItem(augGear, 1, 512, 9, 25, 24, 516, 6) -- STR +10, ATT +25, INT +7 DONE
        -- Nibiru Staff
        elseif zitahGearCounter == 49 then
            player:addItem(augGear, 1, 11, 15, 133, 24, 40, 4) -- MP +80, MAB +25, Enmity -5 DONE
        -- Nibiru Tabar
        elseif zitahGearCounter == 50 then
            player:addItem(augGear, 1, 512, 9, 25, 19, 107, 19) -- STR +10, ATT +20, PET: ATT +20 DONE
        -- Sensui
        elseif zitahGearCounter == 51 then
            player:addItem(augGear, 1, 513, 6, 23, 19, 142, 4) -- DEX +7, ACC +20, Store TP +5 DONE
        end
    -- Path B (Mog Kupon AW-GFII)
    elseif pathKupon == 9176 then
        -- Rawhide
        if zitahGearCounter <= 5 then
            player:addItem(augGear, 1, 2, 17, 23, 14, 31, 19) -- HP +50, ACC +15, EVA +20 DONE
        -- Despair
        elseif zitahGearCounter <= 10 then
            player:addItem(augGear, 1, 512, 11, 514, 6, 49, 1) -- STR +12, VIT +7, Gear Haste +2% DONE
        -- Eschite
        elseif zitahGearCounter <= 15 then
            player:addItem(augGear, 1, 11, 15, 23, 9, 39, 6) -- MP +80, ACC +10, ENM +7 DONE
        -- Naga
        elseif zitahGearCounter <= 20 then
            player:addItem(augGear, 1, 2, 17, 514, 9, 31, 19) -- HP +50, VIT +10, EVA +20 DONE
        -- Persuer
        elseif zitahGearCounter <= 25 then
            player:addItem(augGear, 1, 513, 6, 515, 9, 212, 14) -- DEX +7, AGL +10, Recycle +15 DONE
        -- Psycloth
        elseif zitahGearCounter <= 30 then
            player:addItem(augGear, 1, 35, 9, 53, 14, 517, 6) -- MACC +10, Spell Interruption Rate -15%, MND +7 DONE
        -- Vanya
        elseif zitahGearCounter <= 35 then
            player:addItem(augGear, 1, 289, 19, 323, 6, 55, 2) -- Healing Magic Skill +20, Cure Cast Time -7%, MDT -3% DONE
        -- Mijin
        elseif zitahGearCounter == 36 then
            player:addItem(augGear, 1, 23, 14, 27, 14, 142, 4) -- ACC +15, RACC +15, Store TP +5 DONE
        -- Nibiru Blade
        elseif zitahGearCounter == 37 then
            player:addItem(augGear, 1, 512, 9, 25, 19, 142, 2) -- STR +10, ATT +20, Store TP +3 DONE
        -- Nibiru Bow
        elseif zitahGearCounter == 38 then
            player:addItem(augGear, 1, 2, 17, 29, 24, 139, 9) -- HP +50, RATT +25, Rapid Shot +10 DONE
        -- Nibiru Chopper
        elseif zitahGearCounter == 39 then
            player:addItem(augGear, 1, 25, 19, 39, 3, 143, 2) -- ATT +20, Enmity +4, Double Attack +3% DONE
        -- Nibiru Cudgel
        elseif zitahGearCounter == 40 then
            player:addItem(augGear, 1, 10, 17, 516, 9, 133, 14) -- MP +50, INT +10, MAB +15 DONE
        -- Nibiru Faussar
        elseif zitahGearCounter == 41 then
            player:addItem(augGear, 1, 23, 9, 25, 14, 142, 4) -- ACC +10, ATT +15, Store TP +5 DONE
        -- Nibiru Gun
        elseif zitahGearCounter == 42 then
            player:addItem(augGear, 1, 2, 17, 515, 9, 27, 19) -- HP +50, AGI +10, RACC +20 DONE
        -- Nibiru Harp
        elseif zitahGearCounter == 43 then
            player:addItem(augGear, 1, 2, 17, 518, 9, 67, 1) -- HP +50, CHR +10, All Songs +2 DONE
        -- Nibiru Knife
        elseif zitahGearCounter == 44 then
            player:addItem(augGear, 1, 513, 6, 25, 19, 142, 2) -- DEX +7, ATT +20, Store TP +3 DONE
        -- Nibiru Lance
        elseif zitahGearCounter == 45 then
            player:addItem(augGear, 1, 2, 17, 23, 14, 25, 14) -- HP +50, ACC + 15, ATT +15 DONE
        -- Nibiru Sainti
        elseif zitahGearCounter == 46 then
            player:addItem(augGear, 1, 2, 17, 25, 19, 142, 2) -- HP +50, ATT +20, Store TP +3 DONE
        -- Nibiru Shield
        elseif zitahGearCounter == 47 then
            player:addItem(augGear, 1, 3, 15, 11, 15, 140, 6) -- HP +80, MP +80, Fast Cast +7% DONE
        -- Nibiru Sickle
        elseif zitahGearCounter == 48 then
            player:addItem(augGear, 1, 25, 19, 133, 24, 140, 4) -- ATT +20, MAB +25, Fast Cast +5% DONE
        -- Nibiru Staff
        elseif zitahGearCounter == 49 then
            player:addItem(augGear, 1, 55, 2, 517, 9, 35, 24) -- Magic DMG Taken -3%, MND +10, MACC +25 DONE
        -- Nibiru Tabar
        elseif zitahGearCounter == 50 then
            player:addItem(augGear, 1, 23, 14, 25, 14, 142, 4) -- ACC +15, ATT +15, Store TP +5 DONE
        -- Sensui
        elseif zitahGearCounter == 51 then
            player:addItem(augGear, 1, 25, 14, 195, 6, 143, 2) -- ATT +15, Subtle Blow +7, Double Attack +3% DONE
        end
    -- Path C (Mog Kupon AW-GEIII)
    elseif pathKupon == 9175 then
        -- Rawhide
        if zitahGearCounter <= 5 then
            player:addItem(augGear, 1, 23, 14, 106, 14, 123, 2) -- ACC +15, Pet: ACC +15, Pet: Double Attack +3 DONE
        -- Despair
        elseif zitahGearCounter <= 10 then
            player:addItem(augGear, 1, 23, 9, 1794, 6, 112, 2) -- ACC +10, Pet: VIT +7, Pet: DT -3% DONE
        -- Eschite
        elseif zitahGearCounter <= 15 then
            player:addItem(augGear, 1, 37, 14, 53, 14, 39, 6) -- MEVA +15, Spell Interrupt Down -15%, Enmity +7 DONE
        -- Naga
        elseif zitahGearCounter <= 20 then
            -- player:addItem(augGear, 1, xxx, 28, xxx, 3, xxx, 2) -- Automaton: MP +80, Automaton: Cure Potency +4, Automaton: Fast Cast +3
            player:addItem(augGear, 1, 108, 19, 105, 19) -- Pet: MAcc/MATT +15, Pet: Enm -20
        -- Persuer
        elseif zitahGearCounter <= 25 then
            player:addItem(augGear, 1, 2, 17, 23, 19, 25, 14) -- HP +50, ACC +20, ATT +15 DONE
        -- Psycloth
        elseif zitahGearCounter <= 30 then
            player:addItem(augGear, 1, 107, 24, 101, 14, 104, 6) -- Pet: ATT +25, Pet: MATT +15, ENM +7 DONE
        -- Vanya
        elseif zitahGearCounter <= 35 then
            player:addItem(augGear, 1, 517, 9, 53, 14, 141, 5) -- MND +10, Spell Interruption Rate -15%, Conserve MP +6 DONE
        -- Mijin
        elseif zitahGearCounter == 36 then
            player:addItem(augGear, 1, 516, 6, 35, 14, 133, 14) -- INT +7, MACC +15, MAB +15 DONE
        -- Nibiru Blade
        elseif zitahGearCounter == 37 then
            player:addItem(augGear, 1, 35, 14, 133, 14, 37, 19) -- MACC +15, MAB +15, MEVA +20 DONE
        -- Nibiru Bow
        elseif zitahGearCounter == 38 then
            player:addItem(augGear, 1, 515, 9, 27, 14, 29, 14) -- AGI +10, RACC +15, RATT +15 DONE
        -- Nibiru Chopper
        elseif zitahGearCounter == 39 then
            player:addItem(augGear, 1, 514, 9, 31, 19, 145, 2) -- VIT +10, EVA +20, Counter +3 DONE
        -- Nibiru Cudgel
        elseif zitahGearCounter == 40 then
            player:addItem(augGear, 1, 23, 14, 35, 14, 140, 2) -- ACC +15, MACC +15, Fast Cast +3% DONE
        -- Nibiru Faussar
        elseif zitahGearCounter == 41 then
            player:addItem(augGear, 1, 31, 19, 37, 19, 140, 4) -- EVA +20, MEVA +20, Fast Cast +5% DONE
        -- Nibiru Gun
        elseif zitahGearCounter == 42 then
            player:addItem(augGear, 1, 512, 9, 27, 14, 29, 14) -- STR +10, RACC +15, RATT +15 DONE
        -- Nibiru Harp
        elseif zitahGearCounter == 43 then
            player:addItem(augGear, 1, 10, 17, 329, 4, 67, 1) -- MP +50, Cure Potency +5%, All Songs +2 DONE
        -- Nibiru Knife
        elseif zitahGearCounter == 44 then
            player:addItem(augGear, 1, 512, 14, 513, 9, 518, 9) -- STR +15, DEX +10, CHR +10 DONE
        -- Nibiru Lance
        elseif zitahGearCounter == 45 then
            player:addItem(augGear, 1, 106, 19, 107, 19, 110, 2) -- Pet: ACC +20, Pet: ATT +20, Pet: Regen +3 Improvised DONE
        -- Nibiru Sainti
        elseif zitahGearCounter == 46 then
            player:addItem(augGear, 1, 31, 19, 39, 6, 54, 2) -- EVA +20, Enmity +7, PDT -3% DONE
        -- Nibiru Shield
        elseif zitahGearCounter == 47 then
            player:addItem(augGear, 1, 517, 14, 329, 4, 356, 4) -- MND +15, Cure Potency +5%, Cure Potency Received +5% DONE
        -- Nibiru Sickle
        elseif zitahGearCounter == 48 then
            player:addItem(augGear, 1, 23, 19, 25, 14, 142, 2) -- ACC +20, ATT +15, Store TP +3 DONE
        -- Nibiru Staff
        elseif zitahGearCounter == 49 then
            player:addItem(augGear, 1, 110, 1, 100, 19, 101, 24) -- Pet: Regen +2, Pet: MACC +20, Pet: MAB +25 DONE
        -- Nibiru Tabar
        elseif zitahGearCounter == 50 then
            player:addItem(augGear, 1, 107, 24, 101, 14, 104, 6) -- Pet: ATT +25, Pet: MAB +15, Pet: Enmity +7 DONE
        -- Sensui
        elseif zitahGearCounter == 51 then
            player:addItem(augGear, 1, 515, 9, 27, 14, 29, 19) -- AGI +10, RACC +15, RATT +20 DONE
        end
    -- Path D (Mog Kupon AW-GeIV)
    elseif pathKupon == 9187 then
        if zitahGearCounter == 1 then -- Rawhide Mask
            player:addItem(augGear, 1, 25, 14, 100, 19, 101, 14) -- ATT +15, Pet: MACC +20, Pet: MAB +15 DONE
        elseif zitahGearCounter == 2 then -- Rawhide Vest
            player:addItem(augGear, 1, 2, 17, 195, 6, 144, 1) -- HP +50, Subtle Blow +7, Triple Attack +2 DONE
        elseif zitahGearCounter == 3 then -- Rawhide Gloves
            player:addItem(augGear, 1, 131, 14, 516, 6, 517, 6) -- MACC +15, INT +7, MND +7 DONE
        elseif zitahGearCounter == 4 then -- Rawhide Trousers
            player:addItem(augGear, 1, 10, 17, 140, 4, 138, 0) -- MP +50, Fast Cast +5, Refresh +1 DONE
        elseif zitahGearCounter == 5 then -- Rawhide Boots
            player:addItem(augGear, 1, 512, 9, 25, 14, 142, 4) -- STR +10, ATT +15, Store TP +5 DONE
        elseif zitahGearCounter == 6 then -- Despair Helm
            player:addItem(augGear, 1, 512, 14, 39, 6, 142, 2) -- STR +15, ENM +7, Store TP +3 DONE
        elseif zitahGearCounter == 7 then -- Despair Mail
            player:addItem(augGear, 1, 25, 24, 37, 19, 132, 2) -- ATT +25, MEVA +20, Double Attach +3 DONE
        elseif zitahGearCounter == 8 then -- Despair Finger Gauntlets
            player:addItem(augGear, 1, 27, 24, 29, 19, 212, 9) -- RACC +25, RATT +20, Recycle +10 DONE
        elseif zitahGearCounter == 9 then -- Despair Cuisses
            player:addItem(augGear, 1, 515, 9, 31, 19, 116, 6) -- AGI +10, EVA +20, Subtle Blow +7 DONE
        elseif zitahGearCounter == 10 then -- Despair Greaves
            player:addItem(augGear, 1, 513, 9, 512, 6, 54, 2) -- DEX +10, STR +7, PDT -3% DONE
        elseif zitahGearCounter == 11 then -- Eschite Helm
            player:addItem(augGear, 1, 512, 8, 514, 6, 329, 6) -- STR +9, VIT +7, Cure Pot +7 DONE
        elseif zitahGearCounter == 12 then -- Eschite Breastplate
            player:addItem(augGear, 1, 25, 14, 514, 6, 71, 3) -- ATT +15, VIT +7, DT -4% DONE
        elseif zitahGearCounter == 13 then -- Eschite Gauntlets
            player:addItem(augGear, 1, 23, 19, 143, 3, 39, 7) -- ACC +20, Double Attack +4, Enmity +7 DONE
        elseif zitahGearCounter == 14 then -- Eschite Cuisses
            player:addItem(augGear, 1, 131, 24, 141, 5, 140, 4) -- MAB +25, Conserve MP +6, Fast Cast +5 DONE
        elseif zitahGearCounter == 15 then -- Eschite Greaves
            player:addItem(augGear, 1, 512, 14, 2, 17, 142, 4) -- STR +15, HP +50, Store TP +5 DONE
        elseif zitahGearCounter == 16 then -- Naga Somen
            player:addItem(augGear, 1, 23, 14, 27, 24, 40, 5) -- ACC +15, RACC +25, ENM -6 DONE
        elseif zitahGearCounter == 17 then -- Naga Samue
            player:addItem(augGear, 1, 3, 15, 513, 9, 25, 19) -- HP +80, DEX +10, ATT +20 DONE
        elseif zitahGearCounter == 18 then -- Naga Tekko
            -- player:addItem(augGear, 1, XXX, XXX, 101, 19, 100, 19) -- Pet: MP +80, Pet: MAB +20, Pet: MACC +20
            player:addItem(augGear, 1, 101, 19, 100, 19) -- Pet: MAB +20, Pet: MACC +20 DONE
        elseif zitahGearCounter == 19 then -- Naga Hakama
            player:addItem(augGear, 1, 25, 19, 29, 24, 41, 3) -- ATT +20, RATT +25, Critical Hit Rate +4% DONE
        elseif zitahGearCounter == 20 then -- Naga Kyahan
            player:addItem(augGear, 1, 4, 3, 106, 24, 107, 24) -- HP +100, Pet: ACC +25, Pet: ATT +25 DONE
        elseif zitahGearCounter == 21 then -- Pursuer's Beret
            player:addItem(augGear, 1, 29, 14, 40, 5, 195, 6) -- RATT +15, ENM -6, Subtle Blow +7 DONE
        elseif zitahGearCounter == 22 then -- Pursuer's Doublet
            player:addItem(augGear, 1, 2, 17, 41, 3, 211, 5) -- HP +50, Critical hit rate +4%, Snapshot +6 DONE
        elseif zitahGearCounter == 23 then -- Pursuer's Cuffs
            player:addItem(augGear, 1, 29, 14, 512, 6, 54, 3) -- RATT +15, STR +7, PDT -4% DONE
        elseif zitahGearCounter == 24 then -- Pursuer's Pants
            player:addItem(augGear, 1, 513, 6, 515, 9, 512, 6) -- DEX +7, AGI +10, STR +7 DONE
        elseif zitahGearCounter == 25 then -- Pursuer's Gaiters
            player:addItem(augGear, 1, 29, 9, 139, 9, 212, 14) -- RACC +10, Rapid Shot +10, Recycle +15 DONE
        elseif zitahGearCounter == 26 then -- Psycloth Tiara
            player:addItem(augGear, 1, 35, 19, 140, 9, 516, 6) -- MACC +20, Fast Cast +10, INT +7 DONE
        elseif zitahGearCounter == 27 then -- Psycloth Vest
            player:addItem(augGear, 1, 292, 19, 516, 6, 40, 5) -- Elemental Magic Skill +20, INT +7, ENM -6 DONE
        elseif zitahGearCounter == 28 then -- Psycloth Manillas
            player:addItem(augGear, 1, 11, 15, 233, 3, 101, 24) -- MP +80, Blood Boon +4, Pet: MAB +25 DONE
        elseif zitahGearCounter == 29 then -- Psycloth Lappas
            player:addItem(augGear, 1, 11, 15, 35, 14, 140, 6) -- MP +80, MACC +15, Fast Cast +7 DONE
        elseif zitahGearCounter == 30 then -- Psycloth Boots
            player:addItem(augGear, 1, 100, 19, 101, 19, 104, 6) -- Pet: MACC +20, Pet: MAB +20, Pet: Enm +7 DONE
        elseif zitahGearCounter == 31 then -- Vanya Hood
            player:addItem(augGear, 1, 10, 17, 140, 9, 49, 1) -- MP +50, Fast Cast +10, Haste +2% DONE
        elseif zitahGearCounter == 32 then -- Vanya Robe
            player:addItem(augGear, 1, 2, 17, 10, 17, 138, 1) -- HP +50, MP +50, Refresh +2 DONE
        elseif zitahGearCounter == 33 then -- Vanya Cuffs
            player:addItem(augGear, 1, 518, 9, 297, 9, 35, 19) -- CHR +10, String Skill +10, MACC +20 DONE
        elseif zitahGearCounter == 34 then -- Vanya Slops
            player:addItem(augGear, 1, 2, 17, 37, 14, 54, 2) -- HP +50, MEVA +15, PDT -3% DONE
        elseif zitahGearCounter == 35 then -- Vanya Clogs
            player:addItem(augGear, 1, 329, 4, 323, 14, 141, 5) -- Cure pot +5%, Cure Cast -15%, Conserve MP +6 DONE
        elseif zitahGearCounter == 36 then -- Mijin
            player:addItem(augGear, 1, 31, 19, 37, 19, 39, 3) -- EVA +20, MEVA +20, Enmity +4 DONE
        elseif zitahGearCounter == 37 then -- Nibiru Blade
            player:addItem(augGear, 1, 2, 17, 143, 2, 140, 4) -- HP +50, Double Attack +3%, Fast Cast +5% DONE
        elseif zitahGearCounter == 38 then -- Nibiru Bow
            player:addItem(augGear, 1, 29, 19, 212, 14, 142, 4) -- RATT +20, Recycle +15, Store TP +5 DONE
        elseif zitahGearCounter == 39 then -- Nibiru Chopper
            player:addItem(augGear, 1, 3, 15, 39, 6, 54, 2) -- HP +80, Enmity +7, PDT -3% DONE
        elseif zitahGearCounter == 40 then -- Nibiru Cudgel
            player:addItem(augGear, 1, 10, 17, 112, 2, 110, 1) -- MP +50, Pet: DT -3%, Pet: Regen +2 DONE
        elseif zitahGearCounter == 41 then -- Nibiru Faussar
            player:addItem(augGear, 1, 514, 9, 23, 24, 54, 3) -- VIT +10, ACC +25, PDT -4% DONE
        elseif zitahGearCounter == 42 then -- Nibiru Gun
            player:addItem(augGear, 1, 512, 14, 515, 6, 142, 4) -- STR +15, AGI +7, Store TP +5 DONE
        elseif zitahGearCounter == 43 then -- Nibiru Harp
            player:addItem(augGear, 1, 37, 19, 54, 2, 55, 2) -- MEVA +20, PDT -3%, MDT -3% DONE
        elseif zitahGearCounter == 44 then -- Nibiru Knife
            player:addItem(augGear, 1, 10, 17, 37, 19, 140, 4) -- MP +50, MEVA +20, Fast Cast +5% DONE
        elseif zitahGearCounter == 45 then -- Nibiru Lance
            player:addItem(augGear, 1, 23, 19, 106, 14, 142, 4) -- ACC +20, Pet: ACC +20, Store TP +5 DONE
        elseif zitahGearCounter == 46 then -- Nibiru Sainti
            player:addItem(augGear, 1, 107, 19, 106, 19, 108, 19) -- Pet: ATT/RATK +20, Pet: ACC/RACC +20, Pet: MACC/MAB +20 - Improvised DONE
        elseif zitahGearCounter == 47 then -- Nibiru Shield
            player:addItem(augGear, 1, 23, 14, 25, 14, 142, 4) -- ACC +15, ATK +15, Store TP +5 DONE
        elseif zitahGearCounter == 48 then -- Nibiru Sickle
            player:addItem(augGear, 1, 35, 19, 133, 14, 138, 0) -- MACC +20, MAB +15, Refresh +1 DONE
        elseif zitahGearCounter == 49 then -- Nibiru Staff
            player:addItem(augGear, 1, 106, 19, 107, 19, 123, 2) -- Pet: ACC +20, Pet: ATT +20, Pet: Double Attack +3% DONE
        elseif zitahGearCounter == 50 then -- Nibiru Tabar
            player:addItem(augGear, 1, 518, 14, 111, 2, 123, 2) -- CHR +15, Pet: Haste +3%, Pet: Double Attack +3% DONE
        elseif zitahGearCounter == 51 then -- Sensui
            player:addItem(augGear, 1, 31, 19, 37, 19, 54, 2) -- EVA +20, MEVA +20, PDT -3% DONE
        end
    end
end

function onTrigger(player, npc)
    local silt  = player:getCurrency("escha_silt")
    local beads = player:getCurrency("escha_bead")

    player:startEvent(9501, 0, silt, beads, 0, 0, 0, 0, 0)
    player:PrintToPlayer(string.format("Nolan : I'm charged with imbueing the items won from the dark lands of Escha."),tpz.msg.channel.NS_SAY)
end

function onEventUpdate(player, csid, option)

end

function onEventFinish(player, csid, option)
    local costNQ       = 10
    local costHQ1      = 50
    local costHQ2      = 2000
    local eschalixirID
    local cost
    local quantity

    if csid == 9501 then
        if option == 0x10001 then
            -- Eschalixir Quantity 1
            cost = costNQ * 1
            quantity = 1
            eschalixirID = 9084
        elseif option == 0x20001 then
            -- Eschalixir Quantity 2
            cost = costNQ * 2
            quantity = 2
            eschalixirID = 9084
        elseif option == 0x30001 then
            -- Eschalixir Quantity 3
            cost = costNQ * 3
            quantity = 3
            eschalixirID = 9084
        elseif option == 0x40001 then
            -- Eschalixir Quantity 4
            cost = costNQ * 4
            quantity = 4
            eschalixirID = 9084
        elseif option == 0x50001 then
            -- Eschalixir Quantity 5
            cost = costNQ * 5
            quantity = 5
            eschalixirID = 9084
        elseif option == 0x60001 then
            -- Eschalixir Quantity 6
            cost = costNQ * 6
            quantity = 6
            eschalixirID = 9084
        elseif option == 0x70001 then
            -- Eschalixir Quantity 7
            cost = costNQ * 7
            quantity = 7
            eschalixirID = 9084
        elseif option == 0x80001 then
            -- Eschalixir Quantity 8
            cost = costNQ * 8
            quantity = 8
            eschalixirID = 9084
        elseif option == 0x90001 then
            -- Eschalixir Quantity 9
            cost = costNQ * 9
            quantity = 9
            eschalixirID = 9084
        elseif option == 0xA0001 then
            -- Eschalixir Quantity 10
            cost = costNQ * 10
            quantity = 10
            eschalixirID = 9084
        elseif option == 0xB0001 then
            -- Eschalixir Quantity 11
            cost = costNQ * 11
            quantity = 11
            eschalixirID = 9084
        elseif option == 0xC0001 then
            -- Eschalixir Quantity 12
            cost = costNQ * 12
            quantity = 12
            eschalixirID = 9084
        elseif option == 0x10101 then
            -- Eschalixir +1 Quantity 1
            cost = costHQ1 * 1
            quantity = 1
            eschalixirID = 9085
        elseif option == 0x20101 then
            -- Eschalixir +1 Quantity 2
            cost = costHQ1 * 2
            quantity = 2
            eschalixirID = 9085
        elseif option == 0x30101 then
            -- Eschalixir +1 Quantity 3
            cost = costHQ1 * 3
            quantity = 3
            eschalixirID = 9085
        elseif option == 0x40101 then
            -- Eschalixir +1 Quantity 4
            cost = costHQ1 * 4
            quantity = 4
            eschalixirID = 9085
        elseif option == 0x50101 then
            -- Eschalixir +1 Quantity 5
            cost = costHQ1 * 5
            quantity = 5
            eschalixirID = 9085
        elseif option == 0x60101 then
            -- Eschalixir +1 Quantity 6
            cost = costHQ1 * 6
            quantity = 6
            eschalixirID = 9085
        elseif option == 0x70101 then
            -- Eschalixir +1 Quantity 7
            cost = costHQ1 * 7
            quantity = 7
            eschalixirID = 9085
        elseif option == 0x80101 then
            -- Eschalixir +1 Quantity 8
            cost = costHQ1 * 8
            quantity = 8
            eschalixirID = 9085
        elseif option == 0x90101 then
            -- Eschalixir +1 Quantity 9
            cost = costHQ1 * 9
            quantity = 9
            eschalixirID = 9085
        elseif option == 0xA0101 then
            -- Eschalixir +1 Quantity 10
            cost = costHQ1 * 10
            quantity = 10
            eschalixirID = 9085
        elseif option == 0xB0101 then
            -- Eschalixir +1 Quantity 11
            cost = costHQ1 * 11
            quantity = 11
            eschalixirID = 9085
        elseif option == 0xC0101 then
            -- Eschalixir +1 Quantity 12
            cost = costHQ1 * 12
            quantity = 12
            eschalixirID = 9085
        elseif option == 0x10201 then
            -- Eschalixir +2 Quantity 1
            cost = costHQ2 * 1
            quantity = 1
            eschalixirID = 9086
        elseif option == 0x20201 then
            -- Eschalixir +2 Quantity 2
            cost = costHQ2 * 2
            quantity = 2
            eschalixirID = 9086
        elseif option == 0x30201 then
            -- Eschalixir +2 Quantity 3
            cost = costHQ2 * 3
            quantity = 3
            eschalixirID = 9086
        elseif option == 0x40201 then
            -- Eschalixir +2 Quantity 4
            cost = costHQ2 * 4
            quantity = 4
            eschalixirID = 9086
        elseif option == 0x50201 then
            -- Eschalixir +2 Quantity 5
            cost = costHQ2 * 5
            quantity = 5
            eschalixirID = 9086
        elseif option == 0x60201 then
            -- Eschalixir +2 Quantity 6
            cost = costHQ2 * 6
            quantity = 6
            eschalixirID = 9086
        elseif option == 0x70201 then
            -- Eschalixir +2 Quantity 7
            cost = costHQ2 * 7
            quantity = 7
            eschalixirID = 9086
        elseif option == 0x80201 then
            -- Eschalixir +2 Quantity 8
            cost = costHQ2 * 8
            quantity = 8
            eschalixirID = 9086
        elseif option == 0x90201 then
            -- Eschalixir +2 Quantity 9
            cost = costHQ2 * 9
            quantity = 9
            eschalixirID = 9086
        elseif option == 0xA0201 then
            -- Eschalixir +2 Quantity 10
            cost = costHQ2 * 10
            quantity = 10
            eschalixirID = 9086
        elseif option == 0xB0201 then
            -- Eschalixir +2 Quantity 11
            cost = costHQ2 * 11
            quantity = 11
            eschalixirID = 9086
        elseif option == 0xC0201 then
            -- Eschalixir +2 Quantity 12
            cost = costHQ2 * 12
            quantity = 12
            eschalixirID = 9086
        end

        if cost ~= nil and cost > 0 then
            player:delCurrency("escha_bead", cost)
            player:addItem(eschalixirID, quantity)
            player:messageSpecial(ID.text.ITEM_OBTAINED, eschalixirID)
        end
    end
end
