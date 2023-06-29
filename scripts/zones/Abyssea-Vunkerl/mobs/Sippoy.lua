-----------------------------------
-- Area: Abyssea - Vunkerl
--   NM: Sippoy
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/spell_data")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.STUNRES, 75)
    mob:addMod(tpz.mod.FASTCAST, 50)
    mob:addMod(tpz.mod.KICK_ATTACK_RATE, 35)
    mob:addMod(tpz.mod.KICK_DMG, 150)
end

function onMobFight(mob, target)
    if mob:getHPP() < 50 then
        mob:setMobMod(tpz.mobMod.SPELL_LIST, 159)
    else
        mob:setMobMod(tpz.mobMod.SPELL_LIST, 158)
    end
end

function onSpellPrecast(mob, spell)
    if math.random(0, 100) <= 25 then
        if
            spell:getID() == tpz.magic.spell.WATER_V or
            spell:getID() == tpz.magic.spell.BLIZZARD_V or
            spell:getID() == tpz.magic.spell.WATERGA_IV or
            spell:getID() == tpz.magic.spell.BLIZZAGA_IV
        then
            spell:castTime(2)
        elseif
            spell:getID() == tpz.magic.spell.BINDGA or
            spell:getID() == tpz.magic.spell.PARALYGA or
            spell:getID() == tpz.magic.spell.BLINDGA
        then
            spell:castTime(0)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.SIPPOY_CAPTURER)
end
