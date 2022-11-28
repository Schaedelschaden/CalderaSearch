-----------------------------------
-- Area: Jade Sepulcher
--  Mob: Phantom Puk
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	-- mob:setMod(tpz.mod.SILENCERES, 35)
    -- mob:setMod(tpz.mod.STUNRES, 35)
    -- mob:setMod(tpz.mod.BINDRES, 35)
    -- mob:setMod(tpz.mod.SLOWRES, 35)
	-- mob:addMod(tpz.mod.ATT, 150)
	-- mob:addMod(tpz.mod.MATT, 165)
    -- mob:addMod(tpz.mod.ACC, 500)
    -- mob:addMod(tpz.mod.EVA, 100)
	-- mob:addMod(tpz.mod.DEF, 800)
	-- mob:setMod(tpz.mod.MDEF, 100)
	-- mob:setMod(tpz.mod.DMGPHYS, 50)
	-- mob:setMod(tpz.mod.DOUBLE_ATTACK, 40)
	-- mob:addMod(tpz.mod.LIGHT_ABSORB, 50)
	-- mob:addMod(tpz.mod.REGEN, 250)
	-- mob:addMod(tpz.mod.REFRESH, 200)
	-- mob:addMod(tpz.mod.REGAIN, 100)
    mob:removeListener("GEARS_CTICK")
end

function onMobEngaged(mob, target)
    mob:setLocalVar("BOREAS_MANTLE", os.time() + 90)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("ONMOBFIGHT_PAUSE_TIME") then
        local mobID = mob:getID()
-- printf("Phantom_Puk.lua onMobFight  BATTLE TIME: [%i]", mob:getBattleTime())
        if
            mob:getLocalVar("BOREAS_MANTLE") == 0 and
            (mobID == 17051655 or
             mobID == 17051661 or
             mobID == 17051667)
        then
            mob:setLocalVar("BOREAS_MANTLE", os.time() + 90)
            mob:useMobAbility(1980) -- Boreas Mantle every 90 seconds
        end

        if os.time() >= mob:getLocalVar("BOREAS_MANTLE") then
            mob:setLocalVar("BOREAS_MANTLE", 0)
        end

        mob:setLocalVar("ONMOBFIGHT_PAUSE_TIME", os.time() + 15)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
