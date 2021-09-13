-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Gu'Dha Effigy
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.PARALYZERES, 100) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 20) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 100) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 100) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 200) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 400) -- Magic Attack (Compare to MDEF)
    mob:addMod(tpz.mod.ACC, 300) -- Accuracy (compare to EVA)
	mob:addMod(tpz.mod.MACC, 100) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 200) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 700) -- Defense (Compart to ATT)
	-- mob:addMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 200) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.FASTCAST, 50) -- Fast Cast
	mob:setMod(tpz.mod.DMGPHYS, -50) -- PDT
	mob:setMobMod(tpz.mobMod.LINK_RADIUS, 6)
	mob:setMobMod(tpz.mobMod.SOUND_RANGE, 6)
	mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
end

function onMobengaged (mob)
end


function onMobDeath(mob, player, isKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
end
