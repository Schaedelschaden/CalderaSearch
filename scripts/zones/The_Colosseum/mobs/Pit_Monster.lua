-----------------------------------
-- Pit Monster (Battle Square)
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

local effects =
{
    [1]  = {tpz.effect.MAGIC_EVASION_DOWN, tpz.effect.MAGIC_EVASION_DOWN, 100, 0, 3600},
    [2]  = {tpz.effect.AMNESIA, tpz.effect.AMNESIA, 1, 0, 600},
    [3]  = {tpz.effect.SILENCE, tpz.effect.SILENCE, 1, 0, 3600},
    [4]  = {tpz.effect.CURSE_II, tpz.effect.CURSE_II, 1, 0, 3600},
    [5]  = {tpz.effect.SLOW, tpz.effect.SLOW, 1, 0, 3600},
    [6]  = {tpz.effect.CURSE_I, tpz.effect.CURSE_I, 1, 0, 3600},
    [7]  = {tpz.effect.DISEASE, tpz.effect.DISEASE, 1, 0, 3600},
    [8]  = {tpz.effect.PLAGUE, tpz.effect.PLAGUE, 1, 0, 3600},
    [9]  = {tpz.effect.STR_DOWN, tpz.effect.STR_DOWN, 100, 0, 3600},
    [10] = {tpz.effect.DEX_DOWN, tpz.effect.DEX_DOWN, 100, 0, 3600},
    [11] = {tpz.effect.VIT_DOWN, tpz.effect.VIT_DOWN, 100, 0, 3600},
    [12] = {tpz.effect.AGI_DOWN, tpz.effect.AGI_DOWN, 100, 0, 3600},
    [13] = {tpz.effect.INT_DOWN, tpz.effect.INT_DOWN, 100, 0, 3600},
    [14] = {tpz.effect.MND_DOWN, tpz.effect.MND_DOWN, 100, 0, 3600},
    [15] = {tpz.effect.CHR_DOWN, tpz.effect.CHR_DOWN, 100, 0, 3600},
    [16] = {tpz.effect.MAX_HP_DOWN, tpz.effect.MAX_HP_DOWN, 25, 0, 3600},
    [16] = {tpz.effect.MAX_MP_DOWN, tpz.effect.MAX_MP_DOWN, 25, 0, 3600},
    [17] = {tpz.effect.ABYSSEA_STR, tpz.effect.STR_BOOST_II, 25, 0, 3600},
    [18] = {tpz.effect.ABYSSEA_DEX, tpz.effect.DEX_BOOST_II, 25, 0, 3600},
    [19] = {tpz.effect.ABYSSEA_VIT, tpz.effect.VIT_BOOST_II, 25, 0, 3600},
    [20] = {tpz.effect.ABYSSEA_AGI, tpz.effect.AGI_BOOST_II, 25, 0, 3600},
    [21] = {tpz.effect.ABYSSEA_INT, tpz.effect.INT_BOOST_II, 25, 0, 3600},
    [22] = {tpz.effect.ABYSSEA_MND, tpz.effect.MND_BOOST_II, 25, 0, 3600},
    [23] = {tpz.effect.ABYSSEA_CHR, tpz.effect.CHR_BOOST_II, 25, 0, 3600},
    [24] = {tpz.effect.ABYSSEA_HP, tpz.effect.MAX_HP_BOOST, 50, 0, 3600},
    [25] = {tpz.effect.ABYSSEA_MP, tpz.effect.MAX_MP_BOOST, 50, 0, 3600},
    [26] = {tpz.effect.BIO, tpz.effect.BIO, 1, 0, 3600}, 
    [27] = {tpz.effect.DIA, tpz.effect.DIA, 1, 0, 3600}, 
    [28] = {tpz.effect.HASTE, tpz.effect.HASTE, 2, 0, 3600}, 
    [29] = {tpz.effect.SLEEP_I, tpz.effect.SLEEP_I, 1, 0, 300},   
    [30] = {tpz.effect.MULTI_STRIKES, tpz.effect.MULTI_STRIKES, 1, 0, 3600},     
    [31] = {tpz.effect.BURN, tpz.effect.BURN, 1, 0, 3600}, 
    [32] = {tpz.effect.FROST, tpz.effect.FROST, 1, 0, 3600}, 
    [33] = {tpz.effect.CHOKE, tpz.effect.CHOKE, 1, 0, 3600}, 
    [34] = {tpz.effect.RASP, tpz.effect.RASP, 1, 0, 3600}, 
    [35] = {tpz.effect.SHOCK, tpz.effect.SHOCK, 1, 0, 3600},   
    [36] = {tpz.effect.DROWN, tpz.effect.DROWN, 1, 0, 3600}, 
    [37] = {tpz.effect.WEAKNESS, tpz.effect.WEAKNESS, 1, 0, 300}, 
    [38] = {tpz.effect.POISON, tpz.effect.POISON, 1, 0, 3600}, 
    [39] = {tpz.effect.PARALYSIS, tpz.effect.PARALYSIS, 1, 0, 3600}, 
    [40] = {tpz.effect.BLINDNESS, tpz.effect.BLINDNESS, 1, 0, 3600}, 
    [41] = {tpz.effect.PETRIFICATION, tpz.effect.PETRIFICATION, 1, 0, 3600}, 
    [42] = {tpz.effect.STUN, tpz.effect.STUN, 1, 0, 300}, 
    [43] = {tpz.effect.BIND, tpz.effect.BIND, 1, 0, 300}, 
    [44] = {tpz.effect.WEIGHT, tpz.effect.WEIGHT, 1, 0, 600}, 
    [45] = {tpz.effect.DOOM, tpz.effect.DOOM, 10, 0, 60}, 
    [46] = {tpz.effect.ADDLE, tpz.effect.ADDLE, 1, 0, 3600}, 
    [47] = {tpz.effect.TERROR, tpz.effect.TERROR, 1, 0, 300}, 
    [48] = {tpz.effect.MUTE, tpz.effect.MUTE, 1, 0, 3600}, 
    [49] = {tpz.effect.BANE, tpz.effect.BANE, 1, 0, 3600}, 
    [50] = {tpz.effect.ACCURACY_DOWN, tpz.effect.ACCURACY_DOWN, 100, 0, 3600}, 
    [51] = {tpz.effect.ATTACK_DOWN, tpz.effect.ATTACK_DOWN, 100, 0, 3600}, 
    [52] = {tpz.effect.EVASION_DOWN, tpz.effect.EVASION_DOWN, 100, 0, 3600}, 
    [53] = {tpz.effect.DEFENSE_DOWN, tpz.effect.DEFENSE_DOWN, 100, 0, 3600}, 
    [54] = {tpz.effect.INHIBIT_TP, tpz.effect.INHIBIT_TP, 50, 0, 3600}, 
    [55] = {tpz.effect.REGAIN, tpz.effect.REGAIN, 25, 0, 3600}, 
    [56] = {tpz.effect.MAGIC_ACC_DOWN, tpz.effect.MAGIC_ACC_DOWN, 100, 0, 3600}, 
    [57] = {tpz.effect.MAGIC_ATK_DOWN, tpz.effect.MAGIC_ATK_DOWN, 100, 0, 3600}, 
    [58] = {tpz.effect.MAGIC_ATK_BOOST, tpz.effect.MAGIC_ATK_BOOST, 100, 0, 3600}, 
    [59] = {tpz.effect.MAGIC_DEF_BOOST, tpz.effect.MAGIC_DEF_BOOST, 100, 0, 3600}, 
    [60] = {tpz.effect.STORE_TP, tpz.effect.STORE_TP, 50, 0, 3600}, 
    [61] = {tpz.effect.LETHARGIC_DAZE_5, tpz.effect.LETHARGIC_DAZE_5, 1, 0, 3600}, 
    [62] = {tpz.effect.SLUGGISH_DAZE_5, tpz.effect.SLUGGISH_DAZE_5, 1, 0, 3600}, 
    [63] = {tpz.effect.WEAKENED_DAZE_5, tpz.effect.WEAKENED_DAZE_5, 1, 0, 3600}, 
    [64] = {tpz.effect.MUDDLE, tpz.effect.MUDDLE, 1, 0, 600}, 
}

local pickEffect = math.random(#effects)

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.ALWAYS_AGGRO, 1)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 30)
    mob:addStatusEffect(tpz.effect.BESIEGED, 71, 0, 0)
    mob:setLocalVar("despawn", os.time() + 120)
end

function onMobRoam(mob)
    local zone = mob:getZone():getPlayers()
    if os.time() > mob:getLocalVar("despawn") then
        for _, players in pairs(zone) do
            players:delStatusEffect(tpz.effect.BESIEGED)
            if players:isDead() then
                players:sendRaise(3)
            end
        end
        DespawnMob(17068033)
    end
end


function onMobFight(mob, target)
    mob:setLocalVar("despawn", os.time() + 120)

    local targ = target:getAlliance()
    local BP   = 0
    for _, v in ipairs(targ) do
        if v:getLocalVar("BattlePoints") > BP then
            BP = v:getLocalVar("BattlePoints")
        end
    end
    
    if mob:getLocalVar("HPset") == 0 then
        if BP == 0 then
            mob:setHP(20000)
        else
            mob:setHP(20000 * BP)
        end
        mob:setLocalVar("HPset", 1)
    end
    
    if mob:getLocalVar("DTset") == 0 then
        mob:setMod(tpz.mod.DMG, (-50 + BP))
        mob:setLocalVar("DTset", 1)
    end
    
        
    if mob:getLocalVar("SkillSet") == 0 then
        mob:setMod(tpz.mod.LIGHTRES, BP * 2)
        mob:setMod(tpz.mod.SILENCERES, BP * 2)
        mob:setMod(tpz.mod.SLEEPRES, BP * 2)
        mob:setMod(tpz.mod.PETRIFYRES, BP * 2)
        mob:setMod(tpz.mod.BINDRES, BP * 2)
        mob:setMod(tpz.mod.CHARMRES, 100)
        mob:setMod(tpz.mod.DEATHRES, 100)
        mob:setMod(tpz.mod.PARALYZERES, BP * 2)
        mob:setMod(tpz.mod.STUNRES, BP * 2)
        mob:setMod(tpz.mod.BINDRES, BP * 2)
        mob:setMod(tpz.mod.GRAVITYRES, BP * 2)
        mob:addMod(tpz.mod.ATT, BP * 4)
        mob:addMod(tpz.mod.ACC, BP * 2)
        mob:addMod(tpz.mod.MACC, BP * 4)
        mob:addMod(tpz.mod.EVA, BP * 2)
        mob:addMod(tpz.mod.MEVA, BP * 2)
        mob:addMod(tpz.mod.DEF, BP * 4)
        mob:addMod(tpz.mod.FASTCAST, BP)
        mob:addMod(tpz.mod.MATT, BP * 2)
        mob:addMod(tpz.mod.REGEN, BP * 10)
        mob:addMod(tpz.mod.REFRESH, BP * 2)
        if BP == 0 then
            mob:setSpellList(23)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 281)
        elseif BP == 1 then
            mob:setSpellList(20)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 224)
        elseif BP == 2 then
            mob:setSpellList(430)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 329)
        elseif BP == 3 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 34)
        elseif BP == 4 then
            mob:setSpellList(149)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 378)
        elseif BP == 5 then
            mob:setSpellList(46)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 1206)
        elseif BP == 6 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 879)
        elseif BP == 7 then
            mob:setSpellList(227)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
        elseif BP == 8 then
            mob:setSpellList(187)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 839)
        elseif BP == 9 then
            mob:setSpellList(5)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 302)
        elseif BP == 10 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 266)
        elseif BP == 11 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 267)
        elseif BP == 12 then
            mob:setSpellList(4)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 266)
        elseif BP == 13 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 87)
        elseif BP == 14 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 210)
        elseif BP == 15 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 210)
        elseif BP == 16 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 192)
        elseif BP == 17 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 98)
        elseif BP == 18 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 174)
        elseif BP == 19 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 456)
        elseif BP == 20 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 1164)
        elseif BP == 21 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 461)
        elseif BP == 22 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 465)
        elseif BP == 23 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 460)
        elseif BP == 24 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 457)
        elseif BP == 25 then
            mob:setSpellList(126)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 479)
        elseif BP == 26 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 263)
        elseif BP == 27 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 2)
        elseif BP == 28 then
            mob:setSpellList(78)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 393)
        elseif BP == 29 then
            mob:setSpellList(57)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 391)
        elseif BP == 30 then
            mob:setSpellList(111)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 392)
        elseif BP == 31 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 62)
        elseif BP == 32 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 168)
        elseif BP == 33 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 6)
        elseif BP == 34 then
            mob:setSpellList(4)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 334)
        elseif BP == 35 then
            mob:setSpellList(1)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 202)
        elseif BP == 36 then
            mob:setSpellList(30)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 360)
        elseif BP == 37 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 725)
        elseif BP == 38 then
            mob:setSpellList(7)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 285)
        elseif BP == 39 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 326)
        elseif BP == 40 then
            mob:setSpellList(459)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 340)
        elseif BP == 41 then
            mob:setSpellList(7)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 360)
        elseif BP == 42 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 132)
        elseif BP == 43 then
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 240)
        elseif BP == 44 then
            mob:setSpellList(144)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 726)
        elseif BP == 45 then
            mob:setSpellList(2)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 426)
        elseif BP == 46 then -- BartsIdeas
            mob:setSpellList(253)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 923) 
        elseif BP == 47 then -- TK's Hammer
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
        elseif BP == 48 then -- NarsPurpose
            mob:setSpellList(508)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 1125)
        elseif BP >= 49 then -- Caldera
            mob:setSpellList(0)
            mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
        end        
        mob:setLocalVar("SkillSet", 1)
    end
    
    if os.time() > mob:getLocalVar("BartsIdeas") then
        if mob:getModelId() == 1845 then
            mob:useMobAbility(710)
            mob:resetEnmity(target)
            mob:castSpell(277, target) -- Dread Spikes
        end
        mob:setLocalVar("BartsIdeas", os.time() + 60)
    end
    
    if os.time() > mob:getLocalVar("TksHammer") then
        if mob:getModelId() == 26 then
            mob:resetEnmity(target)
            
            local targ = target:getAlliance()
            local BP   = 0
            local rand = math.random(1, 100)

            for _, v in ipairs(targ) do
                v:addStatusEffect(tpz.effect.TERROR, 30, 0, math.random(1, 15))
                v:injectActionPacket(11, 2337)
                if v:getObjType() == tpz.objType.PC then
                    if rand > 50 then
                        v:addStatusEffect(tpz.effect.LEVEL_RESTRICTION, math.random(88, 98), 0, math.random(15, 45))
                    elseif rand <= 50 then
                        v:addStatusEffect(tpz.effect.SJ_RESTRICTION, math.random(0, 48), 0, math.random(15, 45))
                    end
                end
            end
        end
        mob:setLocalVar("TksHammer", os.time() + 60)
    end
  
    if os.time() > mob:getLocalVar("NarsPurpose") then
        if mob:getModelId() == 772 then
            mob:useMobAbility(731) -- Mijin Gakure
        end
        mob:setLocalVar("NarsPurpose", os.time() + 60)
    end
    
    if os.time() > mob:getLocalVar("Caldera") then
        if mob:getModelId() == 2942 then
            mob:useMobAbility(math.random(693, 695))
            mob:resetEnmity(target)
            mob:castSpell(377, target) -- Horde lullaby
            mob:castSpell(367, target) -- Death.
        end
        mob:setLocalVar("Caldera", os.time() + 60)
    end
end

function onMobDisengage(mob)
    local targ  = mob:getTarget()
    local party = targ:getAlliance()
    for _, v in ipairs(party) do
        if not v:hasStatusEffect(tpz.effect.CHARM_I) then
            mob:setHP(0)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    player:setLocalVar("BattlePoints", player:getLocalVar("BattlePoints") + 1)
    -- player:addCurrency("jetton", 1)
    local BP       = player:getLocalVar("BattlePoints")
    local effect   = effects[pickEffect][1]
    local icon     = effects[pickEffect][2]
    local power    = effects[pickEffect][3]
    local tick     = effects[pickEffect][4]
    local duration = effects[pickEffect][5]
    
    if player:getCharVar("Ribbon") == 0 then
        if BP >= 0 then
            player:addStatusEffectEx(effect, icon, power, tick, duration)
        end      
    end        
    
    if BP == 49 then
        player:setCharVar("Ribbon", 1)
    end
    
    player:getStatusEffect(effect):setFlag(tpz.effectFlag.ON_ZONE)
    player:getStatusEffect(effect):unsetFlag(tpz.effectFlag.ERASABLE)
    player:clearTrusts()
    player:delStatusEffect(tpz.effect.BESIEGED)
end

function onMobDespawn(mob)

end
