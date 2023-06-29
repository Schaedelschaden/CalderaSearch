-----------------------------------
-- Area: Horlais Peak
--  Mob: Dread Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob, target)
    GetMobByID(17346565):setDropID(3766)
    GetMobByID(17346563):setDropID(3769)
    GetMobByID(17346561):setDropID(3772)
    
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 0)
	mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 50) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 50) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 50) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 50) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 50) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 50) -- Resistance to Poison	
	mob:addMod(tpz.mod.MATT, 200)	
	mob:addMod(tpz.mod.DEF, 700)
	mob:addMod(tpz.mod.ATT, 200)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 500)
	mob:setMobMod(tpz.mobMod.MOBMOD_NO_REST)
	mob:addMod(tpz.mod.DOUBLE_ATTACK, 25)
    
    if mob:getID() == 17346565 then
        mob:setModelId(3109)
        mob:renameEntity("Darrcuiln")
        mob:setSpellList(0)
    elseif mob:getID() == 17346563 then
        mob:setModelId(3108)
        mob:renameEntity("Morimar")
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:untargetable(true)
        mob:SetAutoAttackEnabled(false)
        mob:setSpellList(0)
    elseif mob:getID() == 17346561 then
        mob:AnimationSub(1)
        mob:setModelId(2635)
        mob:renameEntity("Sajj'aka")
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:untargetable(true)
        mob:SetAutoAttackEnabled(false)
        mob:setSpellList(425)        
    end
    GetMobByID(17346562):setHP(0)
    mob:setLocalVar("skillRotate", 0)
end


function onMobFight(mob, target)
    mob:setMod(tpz.mod.ATT, 2200)
    
    if mob:getID() == 17346565 then
        if os.time() > mob:getLocalVar("Darrcuiln") then            
            if mob:getTP() >= 2000 then
                mob:useMobAbility(math.random(3168, 3172))
            end
            mob:setLocalVar("Darrcuiln", os.time() + 10)
        end 
    elseif mob:getID() == 17346563 then
        if GetMobByID(17346565):isAlive() then
            mob:disengage()
        end
        
        if os.time() > mob:getLocalVar("Morimar") then            
            if mob:getTP() >= 2500 then
                mob:useMobAbility(math.random(3161, 3164))
            end
            mob:setLocalVar("Morimar", os.time() + 10)
        end
        
        if mob:getLocalVar("Vehement") == 0 and mob:getHPP() < 50 then
            mob:useMobAbility(3160) --vehement resolution
            mob:timer(5000, function(mobArg)
                mobArg:AnimationSub(1)
            end)
            mob:setLocalVar("Vehement", 1)
            mob:timer(math.random(60000, 90000), function(mobArg)
                mobArg:setLocalVar("Vehement", 0)
                mobArg:AnimationSub(0)
            end)
        end
        
        
    elseif mob:getID() == 17346561 then
        if GetMobByID(17346563):isAlive() then
            mob:disengage()
        end
        mob:SetMobSkillAttack(1234) 
        if os.time() > mob:getLocalVar("Saj") then
            if mob:getTP() >= 2500 then
                mob:useMobAbility(math.random(3602, 3607))
            end
            mob:setLocalVar("Saj", os.time() + 10)
        end 
        
        mob:addListener("TAKE_DAMAGE", "SAJJAKA_TAKE_DAMAGE", function(mobArg1, damage, attacker, attackType, damageType, instance)
            local accumulatedDarkness = mobArg1:getLocalVar("darkness")
            
            
            if damageType == tpz.damageType.DARK then
                accumulatedDarkness = accumulatedDarkness + damage
                
                if accumulatedDarkness > mobArg1:getMaxHP() * 0.1 then
                    mobArg1:AnimationSub(0) -- breaks scale
                    mobArg1:setMod(tpz.mod.DMGPHYS, 50)               
                    
                    mobArg1:timer(300000, function(mobArg2)
                        mobArg2:setLocalVar("darkness", 0)
                        accumulatedDarkness = 0
                        mobArg2:AnimationSub(1) -- restores scale
                        mobArg2:setMod(tpz.mod.DMGPHYS, -25)
                    end)
                end
                mobArg1:setLocalVar("darkness", accumulatedDarkness)
            end
        end)    
        
        
        if mob:getLocalVar("Denounce") == 0 and mob:getHPP() < 50 then
            mob:useMobAbility(3608) --denounce
            mob:setLocalVar("Denounce", 1)
            mob:timer(math.random(30000, 90000), function(mobArg)
                mobArg:setLocalVar("Denounce", 0)
            end)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    if mob:getID() == 17346565 then
        GetMobByID(17346563):setDropID(3769)
        player:addSpell(991, true, true)
        mob:timer(300000, function(mobArg)
            GetMobByID(17346563):setLocalVar("ROTATION", 0)
            GetMobByID(17346563):setMobMod(tpz.mobMod.NO_MOVE, 0)
            GetMobByID(17346563):untargetable(false)
            GetMobByID(17346563):SetAutoAttackEnabled(true)
        end)
    elseif mob:getID() == 17346563 then
        GetMobByID(17346561):setDropID(3772)
        player:addSpell(990, true, true)
        mob:timer(300000, function(mobArg)
            GetMobByID(17346561):setLocalVar("ROTATION", 0)        
            GetMobByID(17346561):setMobMod(tpz.mobMod.NO_MOVE, 0)
            GetMobByID(17346561):untargetable(false)
            GetMobByID(17346561):SetAutoAttackEnabled(true)
        end)
    elseif mob:getID() == 17346561 then
        --add a char var for being awesome.
    end
    
    mob:removeListener("SAJJAKA_TAKE_DAMAGE")
end
