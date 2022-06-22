-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Snoll Tzar
-----------------------------------
function onMobSpawn(mob)
    -- phase 0 sets start conditions at base anim sub and magic base
    mob:setAnimationSub(0)  
    mob:addMod(tpz.mod.ICE_ABSORB, 100)	
	mob:addMod(tpz.mod.ICE_NULL, 100)
	mob:addMod(tpz.mod.MACC, 150)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 2)
end 
   
function onMobFight(mob, target)
    --phase 1 will commence when he reaches the 75% threshold, increasing size and damage multipliers   
    if (mob:getHPP() <= 75) and mob:getAnimationSub() == 0 then
        mob:setAnimationSub(1) 
        mob:addMod(tpz.mod.STR, 100) 
        mob:addMod(tpz.mod.MATT, 10)	
    end
    --phase 2 will commence when he reaches the 50% threshold, increasing size and damage multiplier	
    if (mob:getHPP() <= 50) and mob:getAnimationSub() == 1 then
	    mob:setAnimationSub(2)
		mob:delMod(tpz.mod.STR, 100)
        mob:delMod(tpz.mod.MATT, 10)
		mob:addMod(tpz.mod.STR, 150)
		mob:addMod(tpz.mod.MATT, 20)
    end
	--phase 3 will commence when he reaches the 25% threshold, increasing size and damage multiplier
    if (mob:getHPP() <= 25) and mob:getAnimationSub() == 2 then 
	    mob:setAnimationSub(3)
	    mob:delMod(tpz.mod.STR, 150)
	    mob:delMod(tpz.mod.MATT, 20) 
		mob:addMod(tpz.mod.STR, 200)
		mob:addMod(tpz.mod.MATT, 25)		
    end
end