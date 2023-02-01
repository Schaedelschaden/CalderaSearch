-----------------------------------
-- Area: Jade Sepulcher
--  Mob: Phantom Puk
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 500) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
	mob:addMod(tpz.mod.EVA, 150) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 700) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 200) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 100) -- Magic Defense (Compare to MATT)
	mob:addMod(tpz.mod.STR, 130)
    mob:addMod(tpz.mod.DEX, 130)
    mob:addMod(tpz.mod.AGI, 130)
    mob:addMod(tpz.mod.VIT, 130)
    mob:addMod(tpz.mod.MND, 130)
    mob:addMod(tpz.mod.CHR, 130)
    mob:addMod(tpz.mod.INT, 130)
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
