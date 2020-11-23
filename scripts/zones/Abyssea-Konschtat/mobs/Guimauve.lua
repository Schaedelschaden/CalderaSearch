-----------------------------------
-- Area: Abyssea - Konschtat
--   NM: Guimauve
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REFRESH, 10);
end

function onMobFight(mob, target)
	local LastCast = mob:getLocalVar("LAST_CAST")
	local Spells = {148, 153, 158, 163, 168, 173, 182}
	local RandomSpell = math.random(1,7)
	
	if (mob:getBattleTime() - LastCast > 20) then
		mob:castSpell(Spells[RandomSpell])
		mob:setLocalVar("LAST_CAST", target:getBattleTime())
    end
end

function onMagicHit(caster, target, spell)
    -- caster:setLocalVar("LAST_CAST", target:getBattleTime())

    -- return 1
end

function onMobDeath(mob, player, isKiller)
	
end