-----------------------------------
-- Area: Abyssea-Misareaux
--   NM: Gukumatz
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.PARALYZERES, -15)
    mob:addMod(tpz.mod.SLOWRES, -15)
    mob:addMod(tpz.mod.BINDRES, 100)
    mob:addMod(tpz.mod.BLINDRES, 100)
    mob:addMod(tpz.mod.GRAVITYRES, 100)
    mob:addMod(tpz.mod.POISONRES, 80)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)
    mob:addMod(tpz.mod.MAIN_DMG_RATING, 75)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if
            skillID == 2153 and -- Regurgitation
            math.random(1, 100) <= 50
        then
            mobArg:useMobAbility(2156) -- Grim Glower
        end

        if skillID == 2156 then -- Grim Glower
            mobArg:addMod(tpz.mod.REGEN, 35)

            -- Remove the glowing eyes and terminate the Petrification gaze
            mobArg:timer(60000, function(mobArg2)
                mobArg2:delMod(tpz.mod.REGEN, 35)
                mobArg2:AnimationSub(0)
            end)
        end
    end)
end

function onMobFight(mob, target)
    local allianceList = target:getAlliance()
	local playerName   = {}
	local targ
	
	if mob:AnimationSub() == 1 then
		for i, v in ipairs(allianceList) do
			if v:isPC() then
				playerName[i] = v:getName()
				targ          = GetPlayerByName(playerName[i])
				-- Grim Glower - Eyes glow yellow
				if mob:AnimationSub() == 1 and targ:isFacing(mob) and targ:isInfront(mob, 80) then
					targ:addStatusEffectEx(tpz.effect.PETRIFICATION, tpz.effect.PETRIFICATION, 1, 0, 30)
                    mob:resetEnmity(targ)
				end
			elseif v:getObjType() == tpz.objType.TRUST then
				-- Grim Glower - Eyes glow yellow
				if mob:AnimationSub() == 1 and v:isFacing(mob) and v:isInfront(mob, 80) then
					v:addStatusEffectEx(tpz.effect.PETRIFICATION, tpz.effect.PETRIFICATION, 1, 0, 30)
                    mob:resetEnmity(v)
				end
			end
		end
	end
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_USED")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_USED")
end
