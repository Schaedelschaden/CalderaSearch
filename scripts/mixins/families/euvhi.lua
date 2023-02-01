require("scripts/globals/mixins")
require("scripts/globals/status")
-----------------------------------

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.euvhi = function(mob)
    -- Select an open (1) or closed (2) animation at spawn
    mob:addListener("SPAWN", "EUVHI_SPAWN", function(mobArg)
        local animSub = math.random(1, 2)

        mobArg:AnimationSub(animSub)

        if animSub == 1 then
            mobArg:setMod(tpz.mod.DMG, -50)
            mobArg:setMod(tpz.mod.MAIN_DMG_RATING, 50)
        elseif animSub == 2 then
            mobArg:setMod(tpz.mod.DMG, 0)
            mobArg:setMod(tpz.mod.MAIN_DMG_RATING, 0)
        end
    end)

    mob:addListener("COMBAT_TICK", "EUVHI_CTICK", function(mobArg)
        -- Euvhi convert between open and closed every 60s while in combat
        if
            mobArg:AnimationSub() == 1 and
            mobArg:getBattleTime() >= mobArg:getLocalVar("[euvhi]changeTime")
        then
            -- Flower closed, move to open
            -- Euvhi deal less damage and take more damage when open
            mobArg:AnimationSub(2)
            mobArg:setMod(tpz.mod.DMG, 0)
            mobArg:setMod(tpz.mod.MAIN_DMG_RATING, 0)
            mobArg:setLocalVar("[euvhi]changeTime", mobArg:getBattleTime() + 60)
        elseif
            mobArg:AnimationSub() == 2 and
            mobArg:getBattleTime() >= mobArg:getLocalVar("[euvhi]changeTime")
        then
            -- Flower open, move to closed
            -- Euvhi deal more damage and take less damage when closed
            mobArg:AnimationSub(1)
            mobArg:setMod(tpz.mod.DMG, -50)
            mobArg:setMod(tpz.mod.MAIN_DMG_RATING, 50)
            mobArg:setLocalVar("[euvhi]changeTime", mobArg:getBattleTime() + 60)
        end
    end)

    mob:addListener("TAKE_DAMAGE", "EUVHI_DAMAGE_TAKE", function(mobArg, amount, attacker, attackType, damageType)
		-- Euvhi convert from open to closed if they take a large amount of damage while open
        if mobArg:AnimationSub() == 2 then
            local openDamage = mobArg:getLocalVar("[euvhi]openDamage") + amount

            if openDamage >= mobArg:getMaxHP() * 0.15 then
                mobArg:AnimationSub(1) -- Move to closed
                mobArg:setMod(tpz.mod.DMG, -50)
                mobArg:setMod(tpz.mod.MAIN_DMG_RATING, 50)
                mobArg:setLocalVar("[euvhi]openDamage", 0)
                mobArg:setLocalVar("[euvhi]changeTime", mobArg:getBattleTime() + 60)
            else
                mobArg:setLocalVar("[euvhi]openDamage", openDamage)
            end
		end
	end)
end

return g_mixins.families.euvhi
