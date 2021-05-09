-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel EV
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(tpz.mod.REGAIN, 50)
end

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
--            {id = tpz.jsa.BENEDICTION, hpp = math.random(20, 30)}, -- "Uses Benediction once."
            {id = tpz.jsa.INVINCIBLE, hpp = math.random(90, 95), cooldown = 90}, -- "Uses Invincible many times."
        },
    })
	mob:setMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 750) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 100) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:setMod(tpz.mod.ATT, 1500) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 200) -- Magic Attack (Compare to MDEF)
    mob:setMod(tpz.mod.ACC, 1000) -- Accuracy (compare to EVA)
	mob:setMod(tpz.mod.MACC, 400) -- Magic ACC (Compare to MEVA)
	mob:setMod(tpz.mod.EVA, 775) -- Evasion (Compare to ACC)
	mob:setMod(tpz.mod.DEF, 1500) -- Defense (Compart to ATT)
	mob:setMod(tpz.mod.MEVA, 200) -- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.MDEF, 400) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 35) -- Double Attack in %
	mob:setMod(tpz.mod.SHIELDBLOCKRATE, 100) -- Block?
end

function onMobFight(mob)
	mob:setMod(tpz.mod.STUNRES, 1000)
end

function onMobEngaged(mob, target)
    local mobid = mob:getID()

    for member = mobid-4, mobid+3 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

function onMobDeath(mob, player, isKiller)
end