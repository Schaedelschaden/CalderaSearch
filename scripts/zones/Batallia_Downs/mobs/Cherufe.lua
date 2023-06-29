-----------------------------------
-- Area: Battalia Downs
--  Mob: Cherufe
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
	mob:setMod(tpz.mod.FRONTAL_DMG_REDUCTION, 75)
	mob:setMod(tpz.mod.SIDE_DMG_REDUCTION, 37)
	mob:setMod(tpz.mod.SILENCERES, 35)
    mob:setMod(tpz.mod.STUNRES, 100)
    mob:setMod(tpz.mod.BINDRES, 35)
    mob:setMod(tpz.mod.SLOWRES, 50)
	mob:setMod(tpz.mod.PETRIFYRES, 100)
	mob:addMod(tpz.mod.ATT, 400)
	mob:addMod(tpz.mod.MATT, 100)
    mob:addMod(tpz.mod.ACC, 190)
	mob:addMod(tpz.mod.MACC, 200)
    -- mob:addMod(tpz.mod.EVA, 167)
	mob:addMod(tpz.mod.DEF, 900)
	mob:addMod(tpz.mod.VIT, 120)
	-- mob:addMod(tpz.mod.STR, 150)
	mob:addMod(tpz.mod.REGEN, 300)
	mob:setMod(tpz.mod.COUNTER, 15)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
end

function onAdditionalEffect(mob, target, damage)
	target:dispelStatusEffect()
end


function onMobEngaged(mob, target)

end

function onMobFight(mob, target)
	if (target:isBehind(mob, 48) and mob:getLocalVar("PREVENT_CLOBBER_SPAM") == 0) then
		mob:useMobAbility(2100) --Make him not turn around?
		mob:setLocalVar("PREVENT_CLOBBER_SPAM", 1)
		mob:setLocalVar("CLOBBER_TIME", os.time() + 6)
	end
	
	if (os.time() > mob:getLocalVar("CLOBBER_TIME")) then
		mob:setLocalVar("PREVENT_CLOBBER_SPAM", 0)
	end
end

function onMobDeath(mob, player, isKiller)
	local celaenoKills     = player:getCharVar("KillCounter_Celaeno")
    local hahavaKills      = player:getCharVar("KillCounter_Hahava")
    local voidwroughtKills = player:getCharVar("KillCounter_Voidwrought")

    if celaenoKills > 0 and hahavaKills > 0 and voidwroughtKills > 0 then
        local playerName  = player:getName()
        local mobName     = mob:getName()
        local KillCounter = player:getCharVar("KillCounter_"..mobName)
        
        KillCounter = KillCounter + 1
        
        player:setCharVar("KillCounter_"..mobName, KillCounter)
        player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
    elseif celaenoKills == 0 or hahavaKills == 0 or voidwroughtKills == 0 then
        player:PrintToPlayer(string.format("You are missing previous progression kills and will not receive credit for this kill."), tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Required kills:"), tpz.msg.channel.NS_LINKSHELL3)
        player:PrintToPlayer(string.format("Celaeno: [%i]  Hahava: [%i]  Voidwrought: [%i]", celaenoKills, hahavaKills, voidwroughtKills), tpz.msg.channel.NS_LINKSHELL3)
    end
end

function onMobDespawn(mob)

end