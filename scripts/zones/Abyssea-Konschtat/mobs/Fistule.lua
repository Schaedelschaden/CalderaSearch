-----------------------------------
-- Area: Abyssea - Konschtat
--  Mob: Fistule
-----------------------------------

function onMobSpawn(mob)
    mob:untargetable(false)
    mob:setLocalVar("Fistule_PetSpawns", 0)
end

function onMobFight(mob)
    local isBusy = false
    local act = mob:getCurrentAction()

    if act == tpz.act.MOBABILITY_START or act == tpz.act.MOBABILITY_USING or act == tpz.act.MOBABILITY_FINISH or
       act == tpz.act.MAGIC_START or act == tpz.act.MAGIC_CASTING or act == tpz.act.MAGIC_START then
        isBusy = true
    end

    if mob:getHPP() <= 83 and isBusy == false and mob:getLocalVar("CYTOKINESIS") == 0 then
        mob:useMobAbility(2514)
        mob:setLocalVar("CYTOKINESIS", 1)
    elseif mob:getHPP() <= 66 and isBusy == false and mob:getLocalVar("CYTOKINESIS") == 1 then
        mob:useMobAbility(2514)
        mob:setLocalVar("CYTOKINESIS", 2)
    elseif mob:getHPP() <= 49 and isBusy == false and mob:getLocalVar("CYTOKINESIS") == 2 then
        mob:useMobAbility(2514)
        mob:setLocalVar("CYTOKINESIS", 3)
    elseif mob:getHPP() <= 33 and isBusy == false and mob:getLocalVar("CYTOKINESIS") == 3 then
        mob:useMobAbility(2514)
        mob:setLocalVar("CYTOKINESIS", 4)
    elseif mob:getHPP() <= 16 and isBusy == false and mob:getLocalVar("CYTOKINESIS") == 4 then
        mob:useMobAbility(2514)
        mob:setLocalVar("CYTOKINESIS", 5)
    end
end

function onMobDeath(mob, player, isKiller)
    local playerName = player:getName()
    local mobName = mob:getName()
    local KillCounter = player:getCharVar("KillCounter_"..mobName)

    KillCounter = KillCounter + 1

    player:setCharVar("KillCounter_"..mobName, KillCounter)
    player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

    tpz.abyssea.kiOnMobDeath(mob, player)
end
