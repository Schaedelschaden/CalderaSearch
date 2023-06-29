-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Bomb Queen
--  Vid: https://www.youtube.com/watch?v=AVsEbYjSAHM
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 180)
    mob:setMobMod(tpz.mobMod.HP_STANDBACK, -1)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
    mob:setMod(tpz.mod.STUNRES, 50)
    mob:setMod(tpz.mod.UDMGMAGIC, -100)
end

function onMobSpawn(mob)
    mob:setLocalVar("petCooldown", os.time() + 5) -- five seconds for first pet
    mob:setMobLevel(115)
end

function onMobFight(mob, target)
    -- every ~20 seconds after first pet, a new pet will spawn around queen's position.
    -- 49.5% (198/400) chance for Prince/Princess. 1% (4/400) chance for Bomb Bastard.
    if os.time() > mob:getLocalVar("petCooldown") then
        local petId = mob:getID() + 1 + math.floor(math.random(0, 399) / 99)
        local pet = GetMobByID(petId)

        if pet and not pet:isSpawned() then
            local pos = mob:getPos()
            pet:setSpawn(pos.x + math.random(-2, 2), pos.y, pos.z + math.random(-2, 2), pos.rot)
            pet:spawn()
            pet:updateEnmity(target)

            mob:setLocalVar("petCooldown", os.time() + 20)
        end
    end
    
    
    mob:delStatusEffect(tpz.effect.BLAZE_SPIKES)
    
    if target:getEquipID(tpz.slot.BODY) == 26965 then --Ta Moko
        target:setLocalVar("ANTIBURN", 1)
    end
    
    if target:getEquipID(tpz.slot.BODY) == 26967 and --Cossie Top
        target:getEquipID(tpz.slot.LEGS) == 27293 then
        target:setLocalVar("ANTIBURN", 1)
    end
    
    if target:getLocalVar("ANTIBURN") == 1 then
        target:setMod(tpz.mod.FIRE_ABSORB, 100)
        mob:delStatusEffect(tpz.effect.BLAZE_SPIKES)
    end
    
    target:addStatusEffect(tpz.effect.HUNDRED_FISTS, 1, 0, 4 )

    if mob:getLocalVar("ANTIBURN") == 0 then
        target:addStatusEffect(tpz.effect.BURN, 1, 0, 4 )
        if mob:getHPP() <= 100 and mob:getHPP() > 95 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(5, 10), 0, 0)
        end
        
        if mob:getHPP() < 95 and mob:getHPP() > 90 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(10, 15), 0, 0)
        end
        
        if mob:getHPP() < 90 and mob:getHPP() > 85 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(15, 20), 0, 0)
        end
        
        if mob:getHPP() < 85 and mob:getHPP() > 80 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(20, 25), 0, 0)
        end
        
        if mob:getHPP() < 80 and mob:getHPP() > 75 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(25, 30), 0, 0)
        end
        
        if mob:getHPP() < 75 and mob:getHPP() > 70 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(30, 35), 0, 0)
        end
        
        if mob:getHPP() < 70 and mob:getHPP() > 65 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(35, 40), 0, 0)
        end 

        if mob:getHPP() < 65 and mob:getHPP() > 60 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(40, 45), 0, 0)
        end
        
        if mob:getHPP() < 60 and mob:getHPP() > 55 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(45, 50), 0, 0)
        end
        
        if mob:getHPP() < 55 and mob:getHPP() > 50 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(50, 55), 0, 0)
        end
        
        if mob:getHPP() < 50 and mob:getHPP() > 45 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(55, 70), 0, 0)
        end
        
        if mob:getHPP() < 45 and mob:getHPP() > 40 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(75, 100), 0, 0)
        end
        
        if mob:getHPP() < 40 and mob:getHPP() > 35 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(100, 125), 0, 0)
        end
        
        if mob:getHPP() < 35 and mob:getHPP() > 30 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(125, 150), 0, 0)
        end
        
        if mob:getHPP() < 30 and mob:getHPP() > 25 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(150, 175), 0, 0)
        end
        
        if mob:getHPP() < 25 and mob:getHPP() > 20 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(175, 200), 0, 0)
        end
        
        if mob:getHPP() < 20 and mob:getHPP() > 15 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(200, 225), 0, 0)
        end
        
        if mob:getHPP() < 15 and mob:getHPP() > 10 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(225, 250), 0, 0)
        end
        
        if mob:getHPP() < 10 then
            mob:addStatusEffect(tpz.effect.BLAZE_SPIKES, math.random(250, 300), 0, 0)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    -- pets die with queen
    if isKiller then
        local mobId = mob:getID()
        for i = mobId + 1, mobId + 5 do
            local pet = GetMobByID(i)
            if pet:isAlive() then
                pet:setHP(0)
            end
        end
    end
    
    local target = mob:getTarget()
    target:delMod(tpz.mod.FIRE_ABSORB, 100)
    
    local playerName  = player:getName()
	local mobName     = mob:getName()
	local KillCounter = player:getCharVar("KillCounter_"..mobName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..mobName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
    player:PrintToPlayer(string.format("Go speak to the Bestiary bookshelf in the library for a seasonal prize!"), tpz.msg.channel.NS_LINKSHELL3)

    player:setCharVar("Seasonal_Reward", 1)
end
