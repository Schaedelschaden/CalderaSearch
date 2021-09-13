-----------------------------------
-- Area: The Celestial Nexus
--  Mob: Eald'narche (Phase 2)
-- Zilart Mission 16 BCNM Fight
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    -- 60% fast cast, -75% physical damage taken, 10tp/tick regain, no standback
    mob:addMod(tpz.mod.UFASTCAST, 60)
    mob:addMod(tpz.mod.UDMGPHYS, -75)
    mob:addMod(tpz.mod.REGAIN, 100)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 75) -- Resistance to Stun
    mob:addMod(tpz.mod.SILENCERES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison	
	mob:addMod(tpz.mod.ATT, 400)
	mob:addMod(tpz.mod.ACC, 100)
	mob:setMod(tpz.mod.MATT, 350)	
	mob:addMod(tpz.mod.DEF, 300)
	mob:addMod(tpz.mod.EVA, 200)
	mob:setMod(tpz.mod.REGEN, 250)
	mob:addMod(tpz.mod.REFRESH, 200)
	mob:addMod(tpz.mod.REGAIN, 100)
end

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.GA_CHANCE, 25)
    if GetMobByID(mob:getID() - 1):isDead() and GetMobByID(mob:getID() - 2):isDead() then
        mob:getBattlefield():setLocalVar("phaseChange", 0)
    end
end

function onMobFight(mob)
	mob:setMod(tpz.mod.REGEN, 250)
end

function onMobDeath(mob, player, isKiller)
end
