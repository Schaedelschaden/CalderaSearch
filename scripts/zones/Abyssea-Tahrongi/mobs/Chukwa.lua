-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Chukwa
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.MAGIC_COOL, 45)
	mob:setMod(tpz.mod.STUNRES, 100)
	mob:setMod(tpz.mod.REFRESH, 20)
	mob:setMod(tpz.mod.FASTCAST, 35)
	mob:addMod(tpz.mod.ACC, 150)
	mob:addMod(tpz.mod.MACC, 150)
	mob:setLocalVar("MIGHTY_STRIKES", 0)
	
	mob:addListener("MAGIC_STATE_EXIT", "MAGIC_USED", function(mob, spell, action)
		local spellID = spell:getID()
		-- Stonega IV, Waterga IV
		if (spellID == 192 or spellID == 202) then
			mob:useMobAbility(806)
		end
    end)
end

function onMobFight(mob)
	local act = mob:getCurrentAction()
	local isBusy = false
	local hpp = mob:getHPP()
	local mightyStrikes = mob:getLocalVar("MIGHTY_STRIKES")

	if act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true
    end

	if (isBusy == false) then
		-- Inside shell
		mob:AnimationSub(1)
		mob:SetMagicCastingEnabled(true)
	end
	
	if (isBusy == true or mob:hasStatusEffect(tpz.effect.MIGHTY_STRIKES)) then
		-- Out of shell
		mob:AnimationSub(0)
		mob:SetMagicCastingEnabled(false)
	end
	
	if (mob:AnimationSub() == 0) then
		-- Out of shell
		mob:setMod(tpz.mod.UDMGPHYS, 0)
		mob:setMod(tpz.mod.UDMGBREATH, 0)
		mob:setMod(tpz.mod.UDMGMAGIC, 0)
		mob:setMod(tpz.mod.UDMGRANGE, 0)
		mob:setMod(tpz.mod.REGEN, 0)
	elseif (mob:AnimationSub() == 1) then
		-- Inside shell
		mob:setMod(tpz.mod.UDMGPHYS, -80)
		mob:setMod(tpz.mod.UDMGBREATH, -80)
		mob:setMod(tpz.mod.UDMGMAGIC, -80)
		mob:setMod(tpz.mod.UDMGRANGE, -80)
		mob:setMod(tpz.mod.REGEN, 50)
	end
	
	if (hpp <= 90 and mightyStrikes == 0) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(806)
		mob:setLocalVar("MIGHTY_STRIKES", 1)
	elseif (hpp <= 70 and mightyStrikes == 1) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(806)
		mob:setLocalVar("MIGHTY_STRIKES", 2)
	elseif (hpp <= 50 and mightyStrikes == 2) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(806)
		mob:setLocalVar("MIGHTY_STRIKES", 3)
	elseif (hpp <= 40 and mightyStrikes == 3) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(806)
		mob:setLocalVar("MIGHTY_STRIKES", 4)
	elseif (hpp <= 30 and mightyStrikes == 4) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(806)
		mob:setLocalVar("MIGHTY_STRIKES", 5)
	elseif (hpp <= 20 and mightyStrikes == 5) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(806)
		mob:setLocalVar("MIGHTY_STRIKES", 6)
	elseif (hpp <= 10 and mightyStrikes == 6) then
		mob:setTP(0)
		mob:useMobAbility(688)
		mob:useMobAbility(806)
		mob:setLocalVar("MIGHTY_STRIKES", 7)
	end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("MAGIC_USED")
	tpz.abyssea.kiOnMobDeath(mob, player)
end