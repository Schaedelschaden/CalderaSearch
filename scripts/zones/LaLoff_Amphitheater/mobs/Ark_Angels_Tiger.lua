-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel's Tiger
-----------------------------------
require("scripts/globals/status")
-----------------------------------

-- TODO: Implement shared spawning and victory system with Ark Angel's Mandragora.

function onMobEngaged(mob, target)
    local mobid = mob:getID()

    for member = mobid-2, mobid+5 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
	-- mob:setMod(tpz.mod.ATT, 350) -- Attack Stat (Compare to DEF)
	-- mob:setMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
    -- mob:setMod(tpz.mod.ACC, 800) -- Accuracy (compare to EVA)
	-- mob:setMod(tpz.mod.MACC, 400) -- Magic ACC (Compare to MEVA)
	-- mob:setMod(tpz.mod.EVA, 800) -- Evasion (Compare to ACC)
	-- mob:setMod(tpz.mod.DEF, 500) -- Defense (Compart to ATT)
	-- mob:setMod(tpz.mod.MEVA, 100) -- Magic Evasion (Compare to MACC)
	-- mob:setMod(tpz.mod.MDEF, 100) -- Magic Defense (Compare to MATT)
end

function onMobFight(mob, target)

end

function onMobDeath(mob, player, isKiller)
end
