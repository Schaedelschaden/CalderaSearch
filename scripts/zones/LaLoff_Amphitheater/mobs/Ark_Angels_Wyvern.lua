-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel's Wyvern
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:setMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
	mob:setMod(tpz.mod.MATT, 100)
	mob:setMod(tpz.mod.REGAIN, 100)
	mob:setMod(tpz.mod.DMG, -30)
end

function onMobEngaged(mob, target)
    local mobid = mob:getID()

    for member = mobid-7, mobid do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

function onMobFight(mob, target)

end

function onMobDeath(mob, player, isKiller)
end
