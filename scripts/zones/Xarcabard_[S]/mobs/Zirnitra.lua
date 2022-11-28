------------------------------
-- Area: Xarcabard [S]
--   NM: Zirnitra
-- MobID: 17338585
-- POS: 133 -36 139
------------------------------
mixins = {require("scripts/mixins/rage"),
          require("scripts/mixins/families/amphiptere")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
require("scripts/globals/mobs")
------------------------------

-- Not targetable when fighting

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 1200) -- 20 minutes
    mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 100) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
    mob:addMod(tpz.mod.ATT, 300)
    mob:addMod(tpz.mod.MATT, 75)
    mob:addMod(tpz.mod.DEF, 600)
    mob:addMod(tpz.mod.EVA, 80)
    mob:addMod(tpz.mod.MEVA, 80)
    mob:addMod(tpz.mod.MACC, 100)
    mob:addMod(tpz.mod.REGEN, 300)
    mob:addMod(tpz.mod.REFRESH, 50)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 10)
    mob:hideName(false)
    mob:untargetable(false)
    mob:AnimationSub(0)
end

function onMobFight(mob)
end

function onMobDeath(mob)
end
