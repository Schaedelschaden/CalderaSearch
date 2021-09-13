-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Pantagruel
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
	mob:addMod(tpz.mod.BLINDRES, 85)
	mob:addMod(tpz.mod.SLOWRES, 85)
	mob:addMod(tpz.mod.PARALYZERES, 85)

	mob:addListener("WEAPONSKILL_STATE_EXIT", "ICE_ROAR_USED", function(mob, skillID)
		if (skillID == 663) then
			local hpp = mob:getHPP()
			
			mob:addStatusEffect(tpz.effect.ICE_SPIKES, 60 + (100 - hpp), 0, 0)
		end
    end)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "MORIBUND_HACK_USED", function(mob, skillID)
		if (skillID == 2367) then
			mob:delStatusEffect(tpz.effect.ICE_SPIKES)
		end
    end)
end

function onMobFight(mob)

end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("ICE_ROAR_USED")
	mob:removeListener("MORIBUND_HACK_USED")
	
	tpz.abyssea.kiOnMobDeath(mob, player)
end