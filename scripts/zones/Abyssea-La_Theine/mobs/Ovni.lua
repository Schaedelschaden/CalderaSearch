-----------------------------------
-- Area: Abyssea - La Theine
--  Mob: Nguruvilu
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.THUNDERRES, 500)
	mob:addMod(tpz.mod.BINDRES, 100)
	mob:addMod(tpz.mod.GRAVITYRES, 100)
	mob:addMod(tpz.mod.PARALYZERES, 100)
	mob:addMod(tpz.mod.SLEEPRES, 100)
	mob:setMod(tpz.mod.MOVE, 100)
	mob:AnimationSub(1)
	mob:hideName(true)
    mob:untargetable(true)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "FLUORESCENCE_USED", function(mob, skillID)
		if (skillID == 1377) then
			local mobSkills = {1371, 1372, 1373}
			mob:useMobAbility(mobSkills[math.random(1, 3)])
		end
    end)
end

function onMobRoam(mob)
	if (mob:AnimationSub() == 2) then
		mob:hideName(true)
        mob:untargetable(true)
		mob:AnimationSub(1)
		mob:setAggressive(1)
	end
end

function onMobFight(mob)
	if (mob:AnimationSub() == 1) then
		mob:AnimationSub(2)
		mob:hideName(false)
        mob:untargetable(false)
	end
	
	local hpp = mob:getHPP()
	local invincible = mob:getLocalVar("OvniInvincible")
	
	if (hpp <= 80 and invincible == 0) then
		mob:useMobAbility(694)
		mob:setMod(tpz.mod.UDMGPHYS, -30)
		mob:setMod(tpz.mod.UDMGBREATH, -30)
		mob:setMod(tpz.mod.UDMGMAGIC, -30)
		mob:setMod(tpz.mod.UDMGRANGE, -30)
		mob:setLocalVar("OvniInvincible", 1)
	elseif (hpp <= 60 and invincible == 1) then
		mob:useMobAbility(694)
		mob:setMod(tpz.mod.UDMGPHYS, -45)
		mob:setMod(tpz.mod.UDMGBREATH, -45)
		mob:setMod(tpz.mod.UDMGMAGIC, -45)
		mob:setMod(tpz.mod.UDMGRANGE, -45)
		mob:setLocalVar("OvniInvincible", 2)
	elseif (hpp <= 40 and invincible == 2) then
		mob:useMobAbility(694)
		mob:setMod(tpz.mod.UDMGPHYS, -60)
		mob:setMod(tpz.mod.UDMGBREATH, -60)
		mob:setMod(tpz.mod.UDMGMAGIC, -60)
		mob:setMod(tpz.mod.UDMGRANGE, -60)
		mob:setLocalVar("OvniInvincible", 3)
	elseif (hpp <= 20 and invincible == 3) then
		mob:useMobAbility(694)
		mob:setMod(tpz.mod.UDMGPHYS, -75)
		mob:setMod(tpz.mod.UDMGBREATH, -75)
		mob:setMod(tpz.mod.UDMGMAGIC, -75)
		mob:setMod(tpz.mod.UDMGRANGE, -75)
		mob:setLocalVar("OvniInvincible", 4)
	end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("FLUORESCENCE_USED")
end