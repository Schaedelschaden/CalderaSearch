-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Poroggo Dom Juan
-----------------------------------
mixins = {require("scripts/mixins/families/poroggo")}
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:addMod(tpz.mod.REFRESH, 20)

	-- mob:addListener("WEAPONSKILL_STATE_EXIT", "PROVIDENCE_USED", function(mob, skillID)
		-- -- Slowga, Blindga, Bindga, Breakga, Graviga, Death
		-- local spells = {357, 361, 362, 365, 366, 367}

		-- if skillID == 1961 and mob:hasStatusEffect(tpz.effect.PREPARATIONS) then
			-- mob:castSpell(spells[math.random(#spells)])
			-- mob:delStatusEffect(tpz.effect.PREPARATIONS)
		-- end
    -- end)
end

function onMobFight(mob)
end

function onAdditionalEffect(mob, target, damage)
	if target:isPC() then
		return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.CHARM, {chance = 15, duration = 30})
	end
end

function onMobDeath(mob, player, isKiller)
	-- mob:removeListener("PROVIDENCE_USED")
end
