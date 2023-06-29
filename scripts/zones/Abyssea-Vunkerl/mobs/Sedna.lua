-----------------------------------
-- Area: Abyssea-Vunkerl
--   NM: Sedna
-----------------------------------
mixins = {require("scripts/mixins/abyssea_weakness")}
require("scripts/globals/abyssea")
require("scripts/globals/mobs")
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.SPECIAL_SKILL, 2437) -- Sets the mob's "ranged" attack to Aqua Blast
    mob:setMobMod(tpz.mobMod.SPECIAL_COOL, 8)     -- Reduces the time between special attacks to 8 seconds

    mob:addMod(tpz.mod.WATERRES, 150)

    mob:addListener("WEAPONSKILL_STATE_ENTER", "MOBSKILL_START", function(mobArg, skillID)
		mobArg:setMod(tpz.mod.WATER_ABSORB, 100)
        mobArg:setLocalVar("WATER_ABSORB_TIMER", os.time() + 30)
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 2437 then -- Aqua Blast
            local target = mobArg:getTarget()

            mobArg:lowerEnmity(target, 20)
        end
    end)

    mob:addListener("EFFECT_GAIN", "AQUAVEIL_GAIN", function(mobArg, effect)
		if effect:getType() == tpz.effect.AQUAVEIL then
			mobArg:addMod(tpz.mod.FASTCAST, 80)
		end
    end)

    mob:addListener("EFFECT_LOSE", "AQUAVEIL_LOSE", function(mobArg, effect)
		if effect:getType() == tpz.effect.AQUAVEIL then
			mobArg:delMod(tpz.mod.FASTCAST, 80)
        elseif effect:getType() == tpz.effect.MAGIC_SHIELD then
			mobArg:AnimationSub(0)
		end
    end)
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("WATER_ABSORB_TIMER") then
        mob:setMod(tpz.mod.WATER_ABSORB, 0)
    end

    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        -- Handle aura
        if mob:AnimationSub() == 0 then
            local allianceList = target:getAlliance()
            local playerName   = {}
            local targ

            for i, v in ipairs(allianceList) do
                local distance = mob:checkDistance(v)

                if distance <= 15 then
                    v:delStatusEffectSilent(tpz.effect.SILENCE)
                    v:addStatusEffectEx(tpz.effect.SILENCE, tpz.effect.SILENCE, 15, 0, 4)
                end
            end
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 214 then -- Flood
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(20)
    end
end

function onMobDespawn(mob)
    mob:removeListener("MOBSKILL_START")
    mob:removeListener("MOBSKILL_USED")
    mob:removeListener("AQUAVEIL_GAIN")
    mob:removeListener("AQUAVEIL_LOSE")
end

function onMobDeath(mob, player, isKiller)
    mob:removeListener("MOBSKILL_START")
    mob:removeListener("MOBSKILL_USED")
    mob:removeListener("AQUAVEIL_GAIN")
    mob:removeListener("AQUAVEIL_LOSE")

    local playerName   = player:getName()
	local mobName      = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local shortName    = mobName:sub(1, 18)
	local KillCounter  = player:getCharVar("KillCounter_"..shortName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..shortName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end
