-----------------------------------
-- Area: Apollyon SE
--  Mob: Evil Armory
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobInitialize( mob )
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setMod(tpz.mod.UDMGMAGIC, -100)
    mob:setMod(tpz.mod.UDMGPHYS, -80)
	-- mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    -- mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 300) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 210) -- Magic Attack (Compare to MDEF)
    mob:addMod(tpz.mod.ACC, 300) -- Accuracy (compare to EVA)
	mob:addMod(tpz.mod.MACC, 400) -- Magic ACC (Compare to MEVA)
	mob:addMod(tpz.mod.EVA, 200) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 400) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 300) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 100) -- Magic Defense (Compare to MATT)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 35) -- Double Attack in %
	mob:addMod(tpz.mod.FASTCAST, 50)
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 100
	params.chance = 100

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENDARK)
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        GetNPCByID(ID.npc.APOLLYON_SE_CRATE[4]):setStatus(tpz.status.NORMAL)
    end
end