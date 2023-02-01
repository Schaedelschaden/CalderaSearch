-----------------------------------
-- Area: Apollyon SW
--  Mob: Jidra
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobSpawn(mob)
	local mobID = mob:getID()
	
	if (mobID == ID.mob.APOLLYON_SW_MOB[2]) then
		mob:setLocalVar("ENHANCED_TP_MOVES", 1)
	end
    function onMobSpawn(mob)
    mob:addMod(tpz.mod.PARALYZERES, 30)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 30)
    mob:addMod(tpz.mod.SILENCERES, 30)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
	mob:addMod(tpz.mod.ATT, 250)
	mob:addMod(tpz.mod.EVA, 175)
	mob:addMod(tpz.mod.DEF, 275)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MDEF, 50)
	mob:addMod(tpz.mod.STR, 110)
    mob:addMod(tpz.mod.DEX, 110)
    mob:addMod(tpz.mod.AGI, 110)
    mob:addMod(tpz.mod.VIT, 110)
    mob:addMod(tpz.mod.MND, 110)
    mob:addMod(tpz.mod.CHR, 110)
    mob:addMod(tpz.mod.INT, 110)
end
end

function onMobDeath(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
        local mobID = mob:getID()
		
        if mobID == ID.mob.APOLLYON_SW_MOB[2] then
            local battlefield = mob:getBattlefield()
            local players = battlefield:getPlayers()
			
            for i, member in pairs(players) do
                member:messageSpecial(ID.text.GATE_OPEN)
                member:messageSpecial(ID.text.TIME_LEFT, battlefield:getRemainingTime()/60)
            end
			
            GetNPCByID(ID.npc.APOLLYON_SW_PORTAL[2]):setAnimation(8)
        else
            local mobX = mob:getXPos()
            local mobY = mob:getYPos()
            local mobZ = mob:getZPos()
            local add_mob = GetMobByID(mobID + 7)
			
            add_mob:setPos(mobX, mobY, mobZ)
            add_mob:setSpawn(mobX, mobY, mobZ)
            add_mob:spawn()
			
            if player then
                add_mob:updateEnmity(player)
            end
        end
    end
end