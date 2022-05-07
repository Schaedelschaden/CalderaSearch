-----------------------------------
-- Area: Abyssea - Attohwa
--  Mob: Itzpapalotl
-----------------------------------

function onMobSpawn(mob)
	mob:setLocalVar("MOBSKILL_INCREASED_POTENCY", 1) -- 04/26/22 - Needs to be set up
	mob:setMod(tpz.mod.WATERRES, -500)
	mob:addMod(tpz.mod.DEF, 500)
	mob:setMod(tpz.mod.REGEN, 75)
	
	mob:addListener("WEAPONSKILL_STATE_ENTER", "ITZPAPALOTL_MOBSKILL_START", function(mob, skill)
        mob:setLocalVar("ITZPAPALOTL_BLAZE_SPIKES", 1)
		mob:setLocalVar("BLAZE_SPIKES_TIMER", os.time() + 5)
		mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 300, 0, 0)
		mob:getStatusEffect(tpz.effect.BLAZE_SPIKES):setFlag(tpz.effectFlag.DEATH)
    end)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "ITZPAPALOTL_MOBSKILL_END", function(mob, skill)
		mob:setLocalVar("ITZPAPALOTL_BLAZE_SPIKES", 0)
		mob:delStatusEffect(tpz.effect.BLAZE_SPIKES)
    end)
	
	mob:addListener("MAGIC_START", "ITZPAPALOTL_MAGIC_CASTING", function(mob, spell, action)
		mob:setLocalVar("ITZPAPALOTL_BLAZE_SPIKES", 1)
		mob:setLocalVar("BLAZE_SPIKES_TIMER", os.time() + 10)
		mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, 300, 0, 0)
		mob:getStatusEffect(tpz.effect.BLAZE_SPIKES):setFlag(tpz.effectFlag.DEATH)
    end)
	
	mob:addListener("MAGIC_STATE_EXIT", "ITZPAPALOTL_MAGIC_END", function(mob, spell)
		mob:setLocalVar("ITZPAPALOTL_BLAZE_SPIKES", 0)
		mob:delStatusEffect(tpz.effect.BLAZE_SPIKES)
    end)
end

function onMobFight(mob, target)
	if (os.time() >= mob:getLocalVar("BLAZE_SPIKES_TIMER") and mob:getLocalVar("ITZPAPALOTL_BLAZE_SPIKES") == 1) then
		mob:setLocalVar("ITZPAPALOTL_BLAZE_SPIKES", 0)
		mob:delStatusEffect(tpz.effect.BLAZE_SPIKES)
	end
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	mob:removeListener("ITZPAPALOTL_MOBSKILL_START")
	mob:removeListener("ITZPAPALOTL_MOBSKILL_END")
	mob:removeListener("ITZPAPALOTL_MAGIC_CASTING")
	mob:removeListener("ITZPAPALOTL_MAGIC_END")
end