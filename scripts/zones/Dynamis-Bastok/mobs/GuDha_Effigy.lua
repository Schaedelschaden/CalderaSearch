-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Gu'Dha Effigy
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.PARALYZERES, 1000) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 100) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 1000) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 1000) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 10000) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 10000) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 10000) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 10000) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 10000) -- Resistance to Poison
	mob:setMod(tpz.mod.ATT, 1000) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 400) -- Magic Attack (Compare to MDEF)
    mob:setMod(tpz.mod.ACC, 800) -- Accuracy (compare to EVA)
	mob:setMod(tpz.mod.MACC, 900) -- Magic ACC (Compare to MEVA)
	mob:setMod(tpz.mod.EVA, 200) -- Evasion (Compare to ACC)
	mob:setMod(tpz.mod.DEF, 1500) -- Defense (Compart to ATT)
	mob:setMod(tpz.mod.MEVA, 500) -- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.MDEF, 200) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.FASTCAST, 50) -- Fast Cast
	mob:setMod(tpz.mod.DMGPHYS, -50) -- PDT
	mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
end

function onMobengaged (mob)
end


function onMobDeath(mob, player, isKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
end
