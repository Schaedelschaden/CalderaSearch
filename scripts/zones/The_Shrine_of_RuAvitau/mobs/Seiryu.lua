-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Seiryu (Pet version)
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERES, 35);
    mob:setMod(tpz.mod.STUNRES, 35);
    mob:setMod(tpz.mod.BINDRES, 35);
    mob:setMod(tpz.mod.GRAVITYRES, 35);
	mob:setMod(tpz.mod.DMGPHYS, -25);
	mob:setMod(tpz.mod.DMGMAGIC, -50);
	mob:addMod(tpz.mod.ACC, 2000);
	mob:addMod(tpz.mod.MACC, 2000);
	mob:addMod(tpz.mod.MATT, 500);
	mob:useMobAbility(690);
end

function onMobFight( mob, target )
    -- Link Kirin and other pet gods if aggro'd
--    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
--        local god = GetMobByID(i);
--        if (god:getCurrentAction() == tpz.act.ROAMING) then
--            god:updateEnmity(target);
--        end
--    end
end

function onMonsterMagicPrepare(mob,target)
    if (mob:hasStatusEffect(tpz.effect.HUNDRED_FISTS,0) == false) then
        local rnd = math.random();
        if (rnd < 0.3) then
            return 188; -- Aeroga V
		elseif (rnd < 0.4) then
            return 359; -- Silencega
        elseif (rnd < 0.6) then
            return 158; -- Aero V
        elseif (rnd < 0.8) then
            return 209; -- Tornado II
        else
            return 237; -- Choke
        end
    end
    return 0; -- Still need a return, so use 0 when not casting
end;

function onMobDeath(mob, player, isKiller)
end;