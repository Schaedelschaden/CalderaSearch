-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Snow Devil
-----------------------------------
local devils = {{16801818, 16801819, 16801820, 16801821, 16801822, 16801823},
			    {16801826, 16801827, 16801828, 16801829, 16801830, 16801831},
			    {16801834, 16801835, 16801836, 16801837, 16801838, 16801839}}

              
function onMobSpawn(mob)
    mob:addMod(tpz.mod.ICE_ABSORB, 100)
	mob:addMod(tpz.mod.ICE_NULL, 100)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 10)
    mob:addMod(tpz.mod.SILENCERES, 35)
    mob:addMod(tpz.mod.STUNRES, 35)
    mob:addMod(tpz.mod.LULLABYRES, 100)
    mob:addMod(tpz.mod.SLEEPRES, 100)
    mob:addMod(tpz.mod.MACC, 100)
    mob:addMod(tpz.mod.REGEN, 100)
    mob:setMobLevel(119)
    mob:setDropID(0)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.ACC, 1000)
    mob:setMod(tpz.mod.STR, 350)
    mob:setMod(tpz.mod.ATT, 1200)
  
    -- local battlefield = target:getBattlefield()
    -- local battlefieldID = battlefield:getID()
    -- local battlefieldArea = battlefield:getArea()
    -- local droplistCounter = 0
    
    -- for i = 1, #devils[battlefieldArea] do
        -- if (battlefieldID == 642 and GetMobByID(devils[battlefieldArea][i]):isDead()) then
            -- droplistCounter = droplistCounter + 1              
        -- end
    -- end
    
    local snowdev = target:getCharVar("SnowDevil")
    
    if (mob:getLocalVar("AGGRO") == 0) then
        mob:setPos(target:getXPos() - 5, target:getYPos(), target:getZPos())
        mob:updateEnmity(target)
        mob:setLocalVar("AGGRO", 1)
    end
    
    mob:setMod(tpz.mod.UDMGRANGE, 0 - (snowdev * 3))
    mob:setMod(tpz.mod.UDMGMAGIC, 0 - (snowdev * 3))
    mob:setMod(tpz.mod.UDMGPHYS, 0 - (snowdev * 3))
    mob:setMod(tpz.mod.UDMGBREATH, 0 - (snowdev * 3))
    
    if (mob:getLocalVar("DROPS") == 0) then
        if (target:getCharVar("SnowDevil") >= 14) then
            mob:setDropID(3731) -- Body seals
            mob:setLocalVar("DROPS", 1)
        end
    end
end


function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
    player:setCharVar("SnowDevil", player:getCharVar("SnowDevil") + 1)
    player:addGil(math.random(150000, 500000) / 18)
end

