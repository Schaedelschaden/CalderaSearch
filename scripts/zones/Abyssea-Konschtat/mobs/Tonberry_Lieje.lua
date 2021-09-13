-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Tonberry Lieje
-----------------------------------

function onMobSpawn(mob)
	mob:setSpellList(0)
	mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
	mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 1, 0, 0)
    mob:getStatusEffect(tpz.effect.BLAZE_SPIKES):setFlag(tpz.effectFlag.DEATH)
	mob:setMod(tpz.mod.REFRESH, 20)
end

function onMobFight(mob)
	local hpp = mob:getHPP()
	-- Fire IV, Firaga III, Flare
	local spellsOver50 = {147, 176, 204}
	-- Fire V, Firaga IV, Flare, Flare II
	local spellsUnder50 = {148, 177, 204, 205}
	
	local lastCast = mob:getLocalVar("LAST_CAST")
	local removeChainspell = mob:getLocalVar("REMOVE_CHAINSPELL")
	local randomSpell
	local act = mob:getCurrentAction()
	local isBusy = false
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or
	   act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true 
    end
	
	if (os.time() - lastCast > 25 and isBusy == false) then
		if (hpp > 50) then
			randomSpell = math.random(1, 3)
			mob:castSpell(spellsOver50[randomSpell], target)
		else
			randomSpell = math.random(1, 4)
			mob:castSpell(spellsUnder50[randomSpell], target)
		end

		mob:setLocalVar("LAST_CAST", os.time())
    end
	
	if (os.time() - removeChainspell > 5) then
		mob:delStatusEffectSilent(tpz.effect.CHAINSPELL)
	end
end

function onSpellPrecast(mob, spell)
    if (mob:getHPP() <= 50 and spell:getID() == 204) then -- Flare
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(15)
    end
end

function onSpikesDamage(mob, target, damage)
	local hpp = mob:getHPP()
	local dmg = 223 * (1 - (hpp / 100))

    if dmg < 30 then
        dmg = 30
    end

    return tpz.subEffect.BLAZE_SPIKES, tpz.msg.basic.SPIKES_EFFECT_DMG, dmg
end

function onMobDeath(mob, player, isKiller)
	tpz.abyssea.kiOnMobDeath(mob, player)
end