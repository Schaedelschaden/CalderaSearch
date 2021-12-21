-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel TT
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
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
	mob:setMod(tpz.mod.PARALYZERES, 50) -- Resistance to Paralyze
    mob:setMod(tpz.mod.STUNRES, 80) -- Resistance to Stun
    mob:setMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:setMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:setMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    mob:setMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.PETRIFYRES, 100) -- Resistance to Pertrify
    mob:setMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	-- mob:setMod(tpz.mod.ATT, 1500) -- Attack Stat (Compare to DEF)
	mob:setMod(tpz.mod.MATT, 200) -- Magic Attack (Compare to MDEF)
    -- mob:setMod(tpz.mod.ACC, 800) -- Accuracy (compare to EVA)
	mob:setMod(tpz.mod.MACC, 650) -- Magic ACC (Compare to MEVA)
	-- mob:setMod(tpz.mod.EVA, 800) -- Evasion (Compare to ACC)
	-- mob:setMod(tpz.mod.DEF, 500) -- Defense (Compart to ATT)
	-- mob:setMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	mob:setMod(tpz.mod.MDEF, 150) -- Magic Defense (Compare to MATT)
	mob:setMod(tpz.mod.QUICK_MAGIC, 35) -- Instant Cast in %
	mob:setMod(tpz.mod.FASTCAST, 65) -- Speeds spellcasting
	mob:addMod(tpz.mod.REFRESH, 100)
	mob:setMod(tpz.mod.REGEN, 250)
--	mob:setMod(tpz.mod.REGAIN, 100)
--	mob:setLocalVar("AA_TT_TELEPORT", 1)
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
	-- Amon Drive, Spinning Scythe, Guillotine
	local skills = {935, 944, 945}
	local tp = mob:getTP()
	
	if (tp == 3000) then
		if (mob:checkDistance(target) <= 7) then
			mob:setTP(0)
			mob:useMobAbility(skills[math.random(1, 3)])
		elseif (mob:checkDistance(target) > 7) then
			local enmityList = mob:getEnmityList()
			local PlayerName = {}
			
			for i, v in ipairs(enmityList) do		
				PlayerName[i] = v.entity:getName()

				local targ = GetPlayerByName(PlayerName[i])
				
				if (mob:checkDistance(targ) <= 7) then
					mob:setTP(0)
					mob:useMobAbility(skills[math.random(1, 3)], targ)
				end
			end
		end
	end

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