-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel TT
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(tpz.mod.UFASTCAST, 30)
end

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            {id = tpz.jsa.BLOOD_WEAPON},
            {
                id = tpz.jsa.MANAFONT,
                endCode = function(mob) -- "Uses Manafont and ... Will cast Sleepga followed by Meteor."
                    mob:castSpell(273) -- sleepga
--                    mob:castSpell(218) -- meteor
                end,
            },
        },
    })
	mob:setMod(tpz.mod.PARALYZERES, 100) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 800) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 1000) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:setMod(tpz.mod.ATT, 1500) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 200) -- Magic Attack (Compare to MDEF)
    mob:setMod(tpz.mod.ACC, 800) -- Accuracy (compare to EVA)
	mob:setMod(tpz.mod.MACC, 900) -- Magic ACC (Compare to MEVA)
	mob:setMod(tpz.mod.EVA, 800) -- Evasion (Compare to ACC)
	mob:setMod(tpz.mod.DEF, 500) -- Defense (Compart to ATT)
	mob:setMod(tpz.mod.MEVA, 200) -- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.MDEF, 400) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.QUICK_MAGIC, 35) -- Double Attack in %
	mob:setMod(tpz.mod.FASTCAST, 100) -- Absorbs Fire Damage
	mob:addMod(tpz.mod.REFRESH, 100)
end

function onMobEngaged(mob, target)
    local mobid = mob:getID()

    for member = mobid-5, mobid+2 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

function onMobFight(mob, target)

    if (mob:hasStatusEffect(tpz.effect.BLOOD_WEAPON) and bit.band(mob:getBehaviour(), tpz.behavior.STANDBACK) > 0) then
        mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(tpz.behavior.STANDBACK)))
        mob:setMobMod(tpz.mobMod.TELEPORT_TYPE, 0)
        mob:setMobMod(tpz.mobMod.SPAWN_LEASH, 0)
        mob:setSpellList(0)
    end
    if (not mob:hasStatusEffect(tpz.effect.BLOOD_WEAPON) and bit.band(mob:getBehaviour(), tpz.behavior.STANDBACK) == 0) then
        mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.STANDBACK))
        mob:setMobMod(tpz.mobMod.TELEPORT_TYPE, 1)
        mob:setMobMod(tpz.mobMod.SPAWN_LEASH, 22)
        mob:setSpellList(39)
    end
end

function onMobDeath(mob, player, isKiller)
end