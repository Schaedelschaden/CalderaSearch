-----------------------------------
-- Area: Abyssea - Konschtat (15)
--   NM: Turul
-----------------------------------
mixins = {require("scripts/mixins/families/amphiptere")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.NO_TURN))
	mob:setSpellList(0)
	mob:AnimationSub(1)
	mob:setMod(tpz.mod.LTNG_ABSORB, 100)
	mob:setMod(tpz.mod.SILENCERES, 100)
	mob:setMod(tpz.mod.SLOWRES, 100)
	mob:setMod(tpz.mod.REFRESH, 20)
	mob:setMod(tpz.mod.FASTCAST, 55)
	-- mob:delMod(tpz.mod.MATT, 40)
end

function onMobEngaged(mob)
	mob:AnimationSub(0)
end

function onMobFight(mob, target)
    -- Aero IV, Thunder IV, Thunder V, Aeroga III, Thundaga III, Thundaga IV, Silencga
	local spellsAbove50 = {157, 167, 168, 186, 196, 197, 359}
	-- Aero V, Thunder IV, Thunder V, Tornado, Burst, Aeroga III, Aeroga IV, Thundaga III, Thundaga IV, Stun, Silencga
	local spellsBelow50 = {158, 167, 168, 208, 212, 186, 187, 196, 197, 252, 359}
	
	local hpp = mob:getHPP()
	local lastCast = mob:getLocalVar("LAST_CAST")
	
	if (os.time() - lastCast > 35) then
		if (hpp > 50) then
			mob:castSpell(spellsAbove50[math.random(#spellsAbove50)])
		elseif (hpp <= 50) then
			mob:castSpell(spellsBelow50[math.random(#spellsBelow50)])
		end
		mob:setLocalVar("LAST_CAST", os.time())
    end
end

function onSpellPrecast(mob, spell)
    --[[
    Todo:
    "Turul will often cast Thunder based spells on itself to recover HP."
    One way of handling this would be treating ele nuke heals like we do melee special (use its own list)
    and setting absorb element 100% chance. This would let us use the AI's already existing "heal chance"
    ]]
	-- Tornado, Burst, Stun
	if (mob:getHPP() <= 50 and (spell:getID() == 208 or spell:getID() == 212 or spell:getID() == 252)) then
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(15)
    end
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end