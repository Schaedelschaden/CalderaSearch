-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Tunga
-----------------------------------
mixins = {require("scripts/mixins/families/chigoe")}
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
end

entity.onMobSpawn = function(mob)  
    mob:addStatusEffect(xi.effect.ENLIGHT, 100, 0, 30000)
	mob:addMod(xi.mod.DOUBLE_ATTACK, 50)
	mob:addMod(xi.mod.STR, 250)
	mob:addMod(xi.mod.EVA, 100)
	mob:setMod(xi.mod.MACC, 650)
	mob:setMod(xi.mod.MATT, 200)
	mob:setMod(xi.mod.REGEN, 250)
end    

entity.onMobFight = function(mob, target)
	
	--CHAINSPELL until death. 
    if (mob:getHP() < ((mob:getMaxHP() / 10) * 1.0)) then 
		if (mob:hasStatusEffect(xi.effect.CHAINSPELL) == false) then
		mob:useMobAbility(692)
	    mob:addStatusEffect(xi.effect.CHAINSPELL, 1, 0, 0)
		mob:getStatusEffect(xi.effect.CHAINSPELL):setFlag(xi.effectFlag.DEATH)
		end
    end
end    

entity.onMobDespawn = function(mob)
   
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
