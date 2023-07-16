-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Apis
--  ENM: Holy Cow
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
    -- mob:setDropID(3733)
    mob:setMod(tpz.mod.UDMGRANGE, -5)
    mob:setMod(tpz.mod.UDMGMAGIC, -5)
    mob:setMod(tpz.mod.UDMGPHYS, -5)
    mob:setMobMod(tpz.mobMod.SIGHT_RANGE, 35)
    mob:addMod(tpz.mod.STUNRES, 35)
    mob:addMod(tpz.mod.BINDRES, 35)
    mob:addMod(tpz.mod.SLOWRES, 35)
    mob:addMod(tpz.mod.REGEN, 500)
    mob:hideName(false)
    mob:untargetable(false)
end

function onMobEngaged(mob, target)
    mob:setLocalVar("colorChange", os.time() + 60)
    mob:setLocalVar("currentColor", math.random(1, 3))
end

function onMobFight(mob, target)
    mob:hideName(false)
    mob:untargetable(false)
    -- local indicies = { 1, 2, 3 }
    -- local currentColor = mob:getLocalVar("currentColor")
    -- local abilities = { 624, 625, 627 }

    -- if os.time() > mob:getLocalVar("colorChange") then
        -- mob:setLocalVar("colorChange", os.time() + math.random(60, 90))
        -- mob:setLocalVar("twohour_tp", mob:getTP())
        -- table.remove(indicies, currentColor)
        -- local index = indicies[math.random(#indicies)]
        -- mob:useMobAbility(abilities[index])
        -- mob:setLocalVar("currentColor", index)
    -- end
    
    if mob:getHPP() <= 90 and mob:getLocalVar("turtle") == 0 then
        mob:setMod(tpz.mod.UDMGRANGE, -10)
        mob:setMod(tpz.mod.UDMGMAGIC, -10)
        mob:setMod(tpz.mod.UDMGPHYS, -10)
        mob:setMod(tpz.mod.UDMGBREATH, -10)
        mob:addMod(tpz.mod.ATT, 200)
        mob:setMod(tpz.mod.REGEN, 450)
        mob:setLocalVar("turtle", 1)
    end
    
    if mob:getHPP() <= 80 and mob:getLocalVar("turtle") == 1 then
        mob:setMod(tpz.mod.UDMGRANGE, -20)
        mob:setMod(tpz.mod.UDMGMAGIC, -20)
        mob:setMod(tpz.mod.UDMGPHYS, -20)
        mob:setMod(tpz.mod.UDMGBREATH, -20)
        mob:addMod(tpz.mod.ATT, 200)
        mob:setMod(tpz.mod.REGEN, 400)
        mob:setLocalVar("turtle", 2)
    end
    
    if mob:getHPP() <= 70 and mob:getLocalVar("turtle") == 2 then
        mob:setMod(tpz.mod.UDMGRANGE, -30)
        mob:setMod(tpz.mod.UDMGMAGIC, -30)
        mob:setMod(tpz.mod.UDMGPHYS, -30)
        mob:setMod(tpz.mod.UDMGBREATH, -30)
        mob:addMod(tpz.mod.ATT, 200)
        mob:setMod(tpz.mod.REGEN, 350)
        mob:setLocalVar("turtle", 3)
    end
    
    if mob:getHPP() <= 60 and mob:getLocalVar("turtle") == 3 then
        mob:setMod(tpz.mod.UDMGRANGE, -40)
        mob:setMod(tpz.mod.UDMGMAGIC, -40)
        mob:setMod(tpz.mod.UDMGPHYS, -40)
        mob:setMod(tpz.mod.UDMGBREATH, -40)
        mob:addMod(tpz.mod.ATT, 200)
        mob:setMod(tpz.mod.REGEN, 300)
        mob:setLocalVar("turtle", 4)
    end
    
    if mob:getHPP() <= 50 and mob:getLocalVar("turtle") == 4 then
        mob:setMod(tpz.mod.UDMGRANGE, -50)
        mob:setMod(tpz.mod.UDMGMAGIC, -50)
        mob:setMod(tpz.mod.UDMGPHYS, -50)
        mob:setMod(tpz.mod.UDMGBREATH, -50)
        mob:addMod(tpz.mod.ATT, 200)
        mob:setMod(tpz.mod.REGEN, 250)
        mob:setLocalVar("turtle", 5)
    end
    
    if mob:getHPP() <= 40 and mob:getLocalVar("turtle") == 5 then
        mob:setMod(tpz.mod.UDMGRANGE, -60)
        mob:setMod(tpz.mod.UDMGMAGIC, -60)
        mob:setMod(tpz.mod.UDMGPHYS, -60)
        mob:setMod(tpz.mod.UDMGBREATH, -60)
        mob:addMod(tpz.mod.ATT, 200)
        mob:setMod(tpz.mod.REGEN, 200)
        mob:setLocalVar("turtle", 6)
    end
    
    if mob:getHPP() <= 30 and mob:getLocalVar("turtle") == 6 then
        mob:setMod(tpz.mod.UDMGRANGE, -70)
        mob:setMod(tpz.mod.UDMGMAGIC, -70)
        mob:setMod(tpz.mod.UDMGPHYS, -70)
        mob:setMod(tpz.mod.UDMGBREATH, -70)
        mob:addMod(tpz.mod.ATT, 200)
        mob:setMod(tpz.mod.REGEN, 100)
        mob:setLocalVar("turtle", 7)
    end
    
    if mob:getHPP() <= 20 and mob:getLocalVar("turtle") == 7 then
        mob:setMod(tpz.mod.UDMGRANGE, -80)
        mob:setMod(tpz.mod.UDMGMAGIC, -80)
        mob:setMod(tpz.mod.UDMGPHYS, -80)
        mob:setMod(tpz.mod.UDMGBREATH, -80)
        mob:setLocalVar("turtle", 8)
    end

    if mob:getHPP() <= 20 and mob:getLocalVar("turtle") == 8 then
        mob:setMod(tpz.mod.UDMGRANGE, -85)
        mob:setMod(tpz.mod.UDMGMAGIC, -85)
        mob:setMod(tpz.mod.UDMGPHYS, -85)
        mob:setMod(tpz.mod.UDMGBREATH, -85)
        mob:setLocalVar("turtle", 9)
    end
    
    if mob:getHPP() <= 10 and mob:getLocalVar("turtle") == 9 then
        mob:setMod(tpz.mod.UDMGRANGE, -90)
        mob:setMod(tpz.mod.UDMGMAGIC, -90)
        mob:setMod(tpz.mod.UDMGPHYS, -90)
        mob:setMod(tpz.mod.UDMGBREATH, -90)
        mob:setLocalVar("turtle", 10)
    end

    
end

function onMobWeaponSkill(target, mob, skill)
    -- if skill:getID() == 624 then -- blue: High ATK, double and triple attack. High magic immunity
        -- mob:setMod(tpz.mod.DOUBLE_ATTACK, 35)
        -- mob:setMod(tpz.mod.TRIPLE_ATTACK, 35)
        -- mob:setMod(tpz.mod.ATT, 2000)
        -- mob:setMod(tpz.mod.UDMGRANGE, 0)
        -- mob:setMod(tpz.mod.UDMGMAGIC, -98)
        -- mob:setMod(tpz.mod.UDMGPHYS, 0)
        -- mob:addTP(mob:getLocalVar("twohour_tp"))
        -- mob:setLocalVar("twohour_tp", 0)
    -- end

    -- if skill:getID() == 625 then -- yellow: Moderate ATK, takes lowered phys and magic damage
        -- mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        -- mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        -- mob:setMod(tpz.mod.ATT, 1000)
        -- mob:setMod(tpz.mod.UDMGRANGE, -30)
        -- mob:setMod(tpz.mod.UDMGMAGIC, 0)
        -- mob:setMod(tpz.mod.UDMGPHYS, -30)
        -- mob:addTP(mob:getLocalVar("twohour_tp"))
        -- mob:setLocalVar("twohour_tp", 0)
    -- end

    -- if skill:getID() == 627 then -- green: Low ATK, High physical immune.
        -- mob:setMod(tpz.mod.DOUBLE_ATTACK, 0)
        -- mob:setMod(tpz.mod.TRIPLE_ATTACK, 0)
        -- mob:setMod(tpz.mod.ATT, 500)
        -- mob:setMod(tpz.mod.UDMGRANGE, -98)
        -- mob:setMod(tpz.mod.UDMGMAGIC, 40)
        -- mob:setMod(tpz.mod.UDMGPHYS, -98)
        -- mob:addTP(mob:getLocalVar("twohour_tp"))
        -- mob:setLocalVar("twohour_tp", 0)
    -- end
end

function onMobDeath(mob, player, optParams)
    player:addGil(math.random(150000, 500000))
end
