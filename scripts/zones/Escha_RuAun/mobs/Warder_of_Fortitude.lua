-----------------------------------
-- Area: The Garden of Ru'Hmet
--   NM: Jailer of Fortitude
-----------------------------------
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/settings")
require("scripts/globals/limbus")
require("scripts/globals/status")
require("scripts/globals/magic")

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.INVINCIBLE, cooldown = 180, hpp = math.random(90, 95)}, -- "Has access to Invincible, which it may use several times."
        },
    })

    -- Change animation to humanoid w/ prismatic core
    mob:AnimationSub(1)
    mob:setModelId(1169)
	
	mob:addMod(tpz.mod.PARALYZERES, 30)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 30)
    mob:addMod(tpz.mod.SILENCERES, 30)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
	mob:addMod(tpz.mod.ATT, 250)
	mob:addMod(tpz.mod.EVA, 175)
	mob:addMod(tpz.mod.DEF, 275)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MDEF, 50)
	mob:addMod(tpz.mod.STR, 110)
    mob:addMod(tpz.mod.DEX, 110)
    mob:addMod(tpz.mod.AGI, 110)
    mob:addMod(tpz.mod.VIT, 110)
    mob:addMod(tpz.mod.MND, 110)
    mob:addMod(tpz.mod.CHR, 110)
    mob:addMod(tpz.mod.INT, 110)
end

function onMobFight(mob, target)
    local delay = mob:getLocalVar("delay")
    local LastCast = mob:getLocalVar("LAST_CAST")
    local spell = mob:getLocalVar("COPY_SPELL")

    if (mob:getBattleTime() - LastCast > 30) then
        mob:setLocalVar("COPY_SPELL", 0)
        mob:setLocalVar("delay", 0)
    end

    -- if (not GetMobByID(ID.mob.WARDERS_GHRAH):isDead() or not GetMobByID(ID.mob.WARDERS_GHRAH):isDead()) then -- Probably need to change this
        -- if (spell > 0 and not mob:hasStatusEffect(tpz.effect.SILENCE)) then
            -- if (delay >= 3) then
                -- mob:castSpell(spell)
                -- mob:setLocalVar("COPY_SPELL", 0)
                -- mob:setLocalVar("delay", 0)
            -- else
                -- mob:setLocalVar("delay", delay+1)
            -- end
        -- end
    -- end
end

function onMagicHit(caster, target, spell)
    if (spell:tookEffect() and (caster:isPC() or caster:isPet()) and spell:getSpellGroup() ~= tpz.magic.spellGroup.BLUE ) then
        -- Handle mimicked spells
        target:setLocalVar("COPY_SPELL", spell:getID())
        target:setLocalVar("LAST_CAST", target:getBattleTime())
        target:setLocalVar("reflectTime", target:getBattleTime())
        target:AnimationSub(1)
    end

    return 1
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_WardOfFort")
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_WardOfFort", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
	
    -- Despawn the pets if alive, might need to change to mobID since same name
    DespawnMob(ID.mob.WARDERS_GHRAH)
    DespawnMob(ID.mob.WARDERS_GHRAH)
end

function onMobDespawn(mob)
end