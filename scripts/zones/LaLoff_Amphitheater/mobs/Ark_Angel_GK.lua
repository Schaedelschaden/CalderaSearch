-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel GK
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

-- TODO: Allegedly has a 12 hp/sec regen.  Determine if true, and add to onMobInitialize if so.

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.CALL_WYVERN, hpp = 100, cooldown = 60}, -- "Call Wyvern is used at the time of monster engage. Call Wyvern is used ~1 minute subsequent to Wyvern's death."
            {id = tpz.jsa.MEIKYO_SHISUI, hpp = math.random(90, 95), cooldown = 90}, -- "Meikyo Shisui is used very frequently."
        },
    })
	mob:setMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 1000) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 100) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:setMod(tpz.mod.ATT, 1000) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
    mob:setMod(tpz.mod.ACC, 1100) -- Accuracy (compare to EVA)
	mob:setMod(tpz.mod.MACC, 400) -- Magic ACC (Compare to MEVA)
	mob:setMod(tpz.mod.EVA, 1000) -- Evasion (Compare to ACC)
	mob:setMod(tpz.mod.DEF, 1000) -- Defense (Compart to ATT)
	mob:setMod(tpz.mod.MEVA, 200) -- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.MDEF, 400) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 50) -- Double Attack in %
	mob:setMod(tpz.mod.COUNTER, 50) -- Counter Attack
	mob:setMod(tpz.mod.COUNTER_DMG, 50) -- Counter Damage
end

function onMobEngaged(mob, target)
    local mobid = mob:getID()

    for member = mobid-6, mobid+1 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

function onMobFight(mob, target)
    -- TODO: AA GK actively seeks to skillchain to Light off of his own WSs under MS, or other AA's WSs.
end

function onMobDeath(mob, player, isKiller)
end
