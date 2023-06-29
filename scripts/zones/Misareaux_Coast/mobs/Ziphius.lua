------------------------------
-- Area: Misareaux Coast
--   NM: Ziphius
------------------------------
require("scripts/globals/hunts")
------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 10)
    mob:setMod(tpz.mod.UDMGPHYS, -75)
    mob:setMod(tpz.mod.UDMGBREATH, -70)
    mob:setMod(tpz.mod.UDMGMAGIC, -75)
    mob:setMod(tpz.mod.UDMGRANGE, -75)
    mob:setMobLevel(155)
end


function onMobFight(mob, mob)
    if mob:getObjType() == tpz.objType.PC and mob:getLocalVar("lock") == 0 then
        local redux = mob:getSkillLevel(tpz.skill.FISHING)
        if redux > 0 and redux <= 20 then
            mob:setMobLevel(150)
            mob:setMod(tpz.mod.UDMGPHYS, -50)
            mob:setMod(tpz.mod.UDMGBREATH, -50)
            mob:setMod(tpz.mod.UDMGMAGIC, -50)
            mob:setMod(tpz.mod.UDMGRANGE, -50)
        elseif redux > 20 and redux <= 50 then
            mob:setMobLevel(145)
            mob:setMod(tpz.mod.UDMGPHYS, -40)
            mob:setMod(tpz.mod.UDMGBREATH, -40)
            mob:setMod(tpz.mod.UDMGMAGIC, -40)
            mob:setMod(tpz.mod.UDMGRANGE, -40)
        elseif redux > 50 and redux <= 70 then
            mob:setMobLevel(140)
            mob:setMod(tpz.mod.UDMGPHYS, -30)
            mob:setMod(tpz.mod.UDMGBREATH, -30)
            mob:setMod(tpz.mod.UDMGMAGIC, -30)
            mob:setMod(tpz.mod.UDMGRANGE, -30)
        elseif redux > 70 and redux <= 90 then
            mob:setMobLevel(130)
            mob:setMod(tpz.mod.UDMGPHYS, -20)
            mob:setMod(tpz.mod.UDMGBREATH, -20)
            mob:setMod(tpz.mod.UDMGMAGIC, -20)
            mob:setMod(tpz.mod.UDMGRANGE, -20)
        elseif redux > 90 then
            mob:setMobLevel(120)
            mob:setMod(tpz.mod.UDMGPHYS, -10)
            mob:setMod(tpz.mod.UDMGBREATH, -10)
            mob:setMod(tpz.mod.UDMGMAGIC, -10)
            mob:setMod(tpz.mod.UDMGRANGE, -10)
        end
        mob:setLocalVar("lock", 1)
    end
end

function onMobDeath(mob, player, isKiller)
    local redux = player:getSkillLevel(tpz.skill.FISHING)    
    local chance = math.random(redux, 110)
    player:addItem(13095)
    player:PrintToPlayer(string.format("The monster dropped a Sand Charm for the Ebisu Rod Quest!"), tpz.msg.channel.NS_SAY)
    if chance > 100 then
        player:addItem(17011)
        player:delGil(50000)
        player:PrintToPlayer(string.format("Congratulations! You got the rod too!"), tpz.msg.channel.NS_SAY)
    end
end
