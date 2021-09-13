-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  Mob: Suzaku (Pet version)
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 35)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.GRAVITYRES, 35)
	mob:setMod(tpz.mod.DMGPHYS, -25)
	mob:setMod(tpz.mod.DMGRANGE, -25)
	mob:setMod(tpz.mod.DMGMAGIC, -30)
--	mob:addMod(tpz.mod.ACC, 500)
--	mob:addMod(tpz.mod.MACC, 500)
	mob:addMod(tpz.mod.MATT, 150)
end

function onMobFight( mob, target )
    -- Link Kirin and other pet gods if aggro'd
--    for i = ID.mob.KIRIN + 1, ID.mob.KIRIN + 4 do
--        local god = GetMobByID(i);
--        if (god:getCurrentAction() == tpz.act.ROAMING) then
--            god:updateEnmity(target);
--        end
--    end

	local isBusy = false
	local has2Hrd = mob:getLocalVar("has2Hrd")
	local act = mob:getCurrentAction()
	
	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true -- Set to true if Suzaku is in any stage of using a mobskill or casting a spell
    end
	
	if (mob:getHPP() <= 50 and isBusy == false and has2Hrd ~= 1) then
		mob:useMobAbility(692)
		mob:setLocalVar("has2Hrd", 1)
	end
end

function onMonsterMagicPrepare(mob,target)
    if (mob:hasStatusEffect(tpz.effect.CHAINSPELL,0) == false) then
        local rnd = math.random();
        if (rnd < 0.3) then
            return 178; -- Firaga V
		elseif (rnd < 0.4) then
            return 286; -- Addle
        elseif (rnd < 0.6) then
            return 148; -- Fire V
        elseif (rnd < 0.8) then
            return 205; -- Flare II
        else
            return 235; -- Burn
        end
    end
    return 0; -- Still need a return, so use 0 when not casting
end;

function onMobDeath(mob, player, isKiller)
end;