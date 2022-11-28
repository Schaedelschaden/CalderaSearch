-----------------------------------
-- Area: Abyssea-Attohwa
--   NM: Tunga
-----------------------------------
mixins = {require("scripts/mixins/families/chigoe")}
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)  
    mob:addStatusEffect(tpz.effect.ENLIGHT, 100, 0, 30000)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
	mob:addMod(tpz.mod.STR, 250)
	mob:addMod(tpz.mod.EVA, 100)
	mob:setMod(tpz.mod.MACC, 650)
	mob:setMod(tpz.mod.MATT, 200)
	mob:setMod(tpz.mod.REGEN, 250)
end

function onMobFight(mob, target)
	
	--CHAINSPELL until death. 
    if (mob:getHP() < ((mob:getMaxHP() / 10) * 1.0)) then 
		if (mob:hasStatusEffect(tpz.effect.CHAINSPELL) == false) then
		mob:useMobAbility(692)
	    mob:addStatusEffect(tpz.effect.CHAINSPELL, 1, 0, 0)
		mob:getStatusEffect(tpz.effect.CHAINSPELL):setFlag(tpz.effectFlag.DEATH)
		end
    end
end    

function onMobDespawn(mob)
   
end

function onMobDeath(mob, player, isKiller)
end
