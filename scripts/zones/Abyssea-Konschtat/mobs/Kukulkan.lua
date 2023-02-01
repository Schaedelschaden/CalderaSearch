-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Kukulkan
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.BLINDRES, 80)
	mob:setMod(tpz.mod.BINDRES, 80)
	mob:setMod(tpz.mod.GRAVITYRES, 80)
	mob:setMod(tpz.mod.REGEN, 100)
	mob:setMod(tpz.mod.TRIPLE_ATTACK, 25)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	
end

function onMobFight(mob, target)
	local allianceList = target:getAlliance()
	local playerName = {}
	local targ
	
	if mob:AnimationSub() > 0 then
		for i, v in ipairs(allianceList) do
			if v:isPC() then
				playerName[i] = v:getName()
				targ = GetPlayerByName(playerName[i])
				-- Eyes glow yellow
				if mob:AnimationSub() == 1 and targ:isFacing(mob) and targ:isInfront(mob, 80) then
					targ:addStatusEffectEx(tpz.effect.PETRIFICATION, tpz.effect.PETRIFICATION, 1, 0, 30)
				end
				
				-- Eyes glow blue
				if mob:AnimationSub() == 2 and targ:isFacing(mob) and targ:isInfront(mob, 80) then
					targ:addStatusEffectEx(tpz.effect.TERROR, tpz.effect.TERROR, 1, 0, 5)
					targ:addStatusEffectEx(tpz.effect.CURSE_II, tpz.effect.CURSE_II, 1, 0, 120)
				end
			elseif v:getObjType() == tpz.objType.TRUST then
				-- Eyes glow yellow
				if mob:AnimationSub() == 1 and v:isFacing(mob) and v:isInfront(mob, 80) then
					v:addStatusEffectEx(tpz.effect.PETRIFICATION, tpz.effect.PETRIFICATION, 1, 0, 30)
				end
				
				-- Eyes glow blue
				if mob:AnimationSub() == 2 and v:isFacing(mob) and v:isInfront(mob, 80) then
					v:addStatusEffectEx(tpz.effect.TERROR, tpz.effect.TERROR, 1, 0, 5)
					v:addStatusEffectEx(tpz.effect.CURSE_II, tpz.effect.CURSE_II, 1, 0, 120)
				end
			end
		end
	end
	
	if mob:AnimationSub() == 1 and os.time() - mob:getLocalVar("Kukulkan_YellowEyes") > 60 then
		mob:AnimationSub(0)
	elseif mob:AnimationSub() == 2 and os.time() - mob:getLocalVar("Kukulkan_BlueEyes") > 60 then
		mob:AnimationSub(0)
	end
end

function onAdditionalEffect(mob, target, damage)
	local params = {}
		params.chance = 100
		params.power = 100
		
	if mob:AnimationSub() == 2 and os.time() - mob:getLocalVar("Kukulkan_BlueEyes") < 60 then
		params.power = 200
	end
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.POISON)
end

function onMobDeath(mob, player, isKiller)
	local playerName  = player:getName()
	local mobName     = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	tpz.abyssea.kiOnMobDeath(mob, player)
end