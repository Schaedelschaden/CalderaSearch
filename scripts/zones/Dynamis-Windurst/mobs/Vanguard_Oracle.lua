-----------------------------------
-- Area: Dynamis - Windurst
--  Mob: Vanguard Oracle
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
	
end

function onMobFight(mob, target)
	if (mob:hasPet() == false and mob:getLocalVar("DynaWindySMN") == 0) then
		mob:castSpell()
		mob:setLocalVar("DynaWindySMN", 1)
	end
end

function onMobDeath(mob, player, isKiller)
end