-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Alectryon
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "CONTAMINATION_USED", function(mob, skillID)
		if (skillID == 1334) then
			local total = mob:getLocalVar("CONTAMINATION_TOTAL")
			
			for i = 1, total do
				local effect = mob:getLocalVar("CONTAMINATION_"..i)
				mob:delStatusEffect(effect)
				mob:setLocalVar("CONTAMINATION_"..i, 0)
			end
			
			mob:getLocalVar("CONTAMINATION_TOTAL", 0)
		end
    end)
end

function onMobFight(mob, target)
	local allianceList = target:getAlliance()
	local playerName = {}
	
	for i, v in ipairs(allianceList) do
		if (v:isPC()) then
			PlayerName[i] = v.entity:getName()
			local targ = GetPlayerByName(PlayerName[i])
			
			if (targ:hasStatusEffect(tpz.effect.PETRIFICATION)) then
				mob:setMod(tpz.mod.MAIN_DMG_RATING, 150)
				mob:setLocalVar("ALECTRYON_PETRIFY", 1)
				break
			end
			
			if not (targ:hasStatusEffect(tpz.effect.PETRIFICATION) and mob:getLocalVar("ALECTRYON_PETRIFY" == 1)) then
				mob:setMod(tpz.mod.MAIN_DMG_RATING, 0)
				mob:setLocalVar("ALECTRYON_PETRIFY", 0)
			end
		elseif (v:getObjType() == tpz.objType.TRUST) then
			if (v:hasStatusEffect(tpz.effect.PETRIFICATION)) then
				mob:setMod(tpz.mod.MAIN_DMG_RATING, 150)
				mob:setLocalVar("ALECTRYON_PETRIFY", 1)
				break
			end
			
			if not (v:hasStatusEffect(tpz.effect.PETRIFICATION) and mob:getLocalVar("ALECTRYON_PETRIFY" == 1)) then
				mob:setMod(tpz.mod.MAIN_DMG_RATING, 0)
				mob:setLocalVar("ALECTRYON_PETRIFY", 0)
			end
		end
	end
	
	-- for i, v in ipairs(enmityList) do
		-- if (v.entity:isPC()) then
			-- PlayerName[i] = v.entity:getName()
			-- local targ = GetPlayerByName(PlayerName[i])
			
			-- if (targ:hasStatusEffect(tpz.effect.PETRIFICATION)) then
				-- mob:setMod(tpz.mod.MAIN_DMG_RATING, 150)
				-- mob:setLocalVar("ALECTRYON_PETRIFY", 1)
				-- break
			-- end
			
			-- if not (targ:hasStatusEffect(tpz.effect.PETRIFICATION) and mob:getLocalVar("ALECTRYON_PETRIFY" == 1)) then
				-- mob:setMod(tpz.mod.MAIN_DMG_RATING, 0)
				-- mob:setLocalVar("ALECTRYON_PETRIFY", 0)
			-- end
		-- end
	-- end
end

function onAdditionalEffect(mob, target, damage)
	local params = {}
		params.chance = 100
		params.power = 150
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON, params)
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("CONTAMINATION_USED")
	tpz.abyssea.kiOnMobDeath(mob, player)
end