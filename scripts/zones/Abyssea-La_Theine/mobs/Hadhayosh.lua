-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Hadhayosh
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.STUNRES, 100)
	mob:setMod(tpz.mod.FASTCAST, 90)
end

function onMobFight(mob, target)
	local hpp = mob:getHPP()
	local isBusy = false

	if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or act == tpz.act.MAGIC_START
	   or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true -- Set to true if Hadhayosh is in any stage of using a mobskill or casting a spell
    end

	if (hpp <= 25 and isBusy == false and os.time() - mob:getLocalVar("LastCast") >= 60) then
		mob:castSpell(218)
		mob:setLocalVar("LastCast", os.time())
	end
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then -- Meteor
        spell:setAoE(tpz.magic.aoe.RADIAL)
--        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280) -- AoE Meteor Animation
		spell:setMPCost(0)
    end
end

function onMobDeath(mob, player, isKiller)
	local playerName = player:getName()
	local mobName = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

	player:addTitle(tpz.title.HADHAYOSH_HALTERER)
end