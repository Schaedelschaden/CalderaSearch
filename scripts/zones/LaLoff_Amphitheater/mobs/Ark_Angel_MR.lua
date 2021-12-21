-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel MR
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

-- TODO: Allegedly has a 12 hp/sec regen.  Determine if true, and add to onMobInitialize if so.

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = tpz.jsa.PERFECT_DODGE},
        },
    })
end

function onMobEngaged(mob, target)
    --[[ TODO:
        Summons pet when party is engaged.  Randomly chosen between Tiger and Mandragora.
        Current victory system doesn't readily support a random choice of pet while having
        the pet as a victory condition.  Therefore, Mandragora just isn't used at this time.
    ]]

    local mobid = mob:getID()

    for member = mobid-1, mobid+6 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
	mob:setMod(tpz.mod.PARALYZERES, 1000) -- Resistance to Silence
    mob:setMod(tpz.mod.STUNRES, 1000) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 1000) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 1000) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 100) -- Resistance to Poison
	-- mob:setMod(tpz.mod.ATT, 1800) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
    -- mob:setMod(tpz.mod.ACC, 900) -- Accuracy (compare to EVA)
	-- mob:setMod(tpz.mod.MACC, 700) -- Magic ACC (Compare to MEVA)
	-- mob:setMod(tpz.mod.EVA, 900) -- Evasion (Compare to ACC)
	-- mob:setMod(tpz.mod.DEF, 750) -- Defense (Compart to ATT)
	mob:setMod(tpz.mod.MEVA, 700)
	mob:setMod(tpz.mod.MDEF, 175) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 50) -- Double Attack in %
	mob:setMod(tpz.mod.ALL_KILLER_EFFECTS, 10) -- Killer Effects %
	mob:setMod(tpz.mod.REGEN, 250)
	mob:setMod(tpz.mod.REGAIN, 100)
end

function onMobFight(mob, target)
    local charm = mob:getLocalVar("Charm")

    if (charm == 0 and mob:getHPP() < 50) then
        mob:useMobAbility(710)
        mob:setLocalVar("Charm", 1)
    end
end

function onMobDeath(mob, player, isKiller)
end
