-----------------------------------
--  Area: Bearclaw Pinnacle
--  Mob: Bearclaw Rabbit
--  ENM: Follow the White Rabbit
-----------------------------------
require("scripts/globals/status")
local ID = require("scripts/zones/Bearclaw_Pinnacle/IDs")
-----------------------------------
local Leverets = {{16801797, 16801798, 16801799, 16801800, 16801801},
			      {16801804, 16801805, 16801806, 16801807, 16801808},
			      {16801811, 16801812, 16801813, 16801814, 16801815}}
function onMobInitialize(mob)

end

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
    mob:setMod(tpz.mod.UDMGRANGE, -100)
    mob:setMod(tpz.mod.UDMGMAGIC, -100)
    mob:setMod(tpz.mod.UDMGPHYS, -100)
    mob:setMod(tpz.mod.UDMGBREATH, -100)
end

function onMobFight(mob, target)
    if (mob:getLocalVar("DROPLIST_SET") == 0) then
        local battlefield = target:getBattlefield()
        local battlefieldID = battlefield:getID()
        local battlefieldArea = battlefield:getArea()
        local droplistCounter = 0
        
        for i = 1, #Leverets[battlefieldArea] do
            if (battlefieldID == 641 and GetMobByID(Leverets[battlefieldArea][i]):isDead()) then
                droplistCounter = droplistCounter + 1
            end
        end

        if droplistCounter >= 5 then
            mob:setMod(tpz.mod.UDMGRANGE, 0)
            mob:setMod(tpz.mod.UDMGMAGIC, 0)
            mob:setMod(tpz.mod.UDMGPHYS, 0)
            mob:setMod(tpz.mod.UDMGBREATH, 0)
            mob:setDropID(3730) -- Head seals
            mob:setLocalVar("DROPLIST_SET", 1)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    player:addGil(math.random(150000, 500000) / 6)
end