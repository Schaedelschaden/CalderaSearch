-----------------------------------
-- Area: Al'Taieu
--  HNM: Absolute Virtue
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs");
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/magic");
-----------------------------------

function onMobSpawn(mob)
    -- setMod
	mob:setMod(tpz.mod.WINDRES, -64);
    mob:setMod(tpz.mod.SILENCERES, 85);
	mob:setMod(tpz.mod.SLEEPRES, 85);
	mob:setMod(tpz.mod.PETRIFYRES, 85);
	mob:setMod(tpz.mod.BINDRES, 85);
	mob:setMod(tpz.mod.CHARMRES, 85);
	mob:setMod(tpz.mod.DEATHRES, 85);
	mob:setMod(tpz.mod.PARALYZERES, 20);
    mob:setMod(tpz.mod.STUNRES, 35);
    mob:setMod(tpz.mod.BINDRES, 50);
    mob:setMod(tpz.mod.GRAVITYRES, 30);
    mob:setMod(tpz.mod.HPP, 500);
	mob:setMod(tpz.mod.DMG, -95);
	mob:setMod(tpz.mod.DMGPHYS, -95);
	mob:setMod(tpz.mod.DMGMAGIC, -95);
	mob:addMod(tpz.mod.ACC, 3000);
	mob:addMod(tpz.mod.MACC, 3000);
	mob:addMod(tpz.mod.EARTHATT, 500);
	mob:addMod(tpz.mod.EARTHACC, 1000);
	mob:addMod(tpz.mod.MATT, 500);
	mob:addMod(tpz.mod.HASTE_GEAR, 1300)
	mob:addStatusEffect(tpz.effect.REGEN,1000);
    mob:setLocalVar("numAdds", 1);
	
	mob:setHP(999999999);

    local JoL = GetMobByID(ID.mob.JAILER_OF_LOVE);
    -- Special check for regen modification by JoL pets killed
    if (JoL:getLocalVar("JoL_Qn_xzomit_Killed") == 9) then
        mob:addMod(tpz.mod.REGEN, -130)
    end
    if (JoL:getLocalVar("JoL_Qn_hpemde_Killed") == 9) then
        mob:addMod(tpz.mod.REGEN, -130)
    end
end;

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then -- Meteor
        spell:setAoE(tpz.magic.aoe.RADIAL);
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL);
        spell:setRadius(30);
        spell:setAnimation(280); -- AoE Meteor Animation
        spell:setMPCost(1);
    end
end;

function onMagicHit(caster, target, spell)
    local REGEN = target:getMod(tpz.mod.REGEN);
    local DAY = VanadielDayElement();
    local ELEM = spell:getElement();
    if (GetServerVariable("AV_Regen_Reduction") < 60) then
        -- Had to serverVar the regen instead of localVar because localVar reset on claim loss.
        if (ELEM == DAY and (caster:isPC() or caster:isPet())) then
            SetServerVariable("AV_Regen_Reduction", 1+GetServerVariable("AV_Regen_Reduction"));
            target:addMod(tpz.mod.REGEN, -2);
        end
    end
    return 1;
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.VIRTUOUS_SAINT);
end;