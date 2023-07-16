-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Dark Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------

require("scripts/globals/titles")
require("scripts/globals/status")

function onMobInitialize(mob)
end

function onMobSpawn(mob, target)
    GetMobByID(17367045):setDropID(3770)
    GetMobByID(17367043):setDropID(3767) 
    GetMobByID(17367041):setDropID(3773)    
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
    
    if mob:getID() == 17367045 then
        mob:setModelId(3101)
        mob:renameEntity("Rosulatia")
        mob:setSpellList(13)
    elseif mob:getID() == 17367043 then
        mob:setModelId(3102)
        mob:renameEntity("Ingrid")
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:untargetable(true)
        mob:SetAutoAttackEnabled(false)
        mob:setSpellList(425)
    elseif mob:getID() == 17367041 then
        mob:setModelId(3100)
        mob:renameEntity("August")
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:untargetable(true)
        mob:SetAutoAttackEnabled(false)
        mob:setSpellList(397)        
    end
    GetMobByID(17367042):setHP(0)
    mob:setLocalVar("skillRotate", 0)
end

function onMobFight(mob, target)
    
    if mob:getID() == 17367045 then
    
        mob:setMod(tpz.mod.ATT, 2200)
    
        if os.time() > mob:getLocalVar("rose") then            
            if mob:getLocalVar("ROTATION") == 0 and mob:getTP() >= 1500 then
                mob:useMobAbility(3081) -- baneful blades
                mob:setLocalVar("ROTATION", 1)
            elseif mob:getLocalVar("ROTATION") == 1 and mob:getTP() >= 1500 then
                mob:useMobAbility(3092) -- wildwood indignation
                mob:setLocalVar("ROTATION", 2)               
            elseif mob:getLocalVar("ROTATION") == 2 and mob:getTP() >= 1500 then
                mob:useMobAbility(3093) -- dryads kiss
                mob:setLocalVar("ROTATION", 3)           
            elseif mob:getLocalVar("ROTATION") == 3 and mob:getTP() >= 1500 then
                mob:useMobAbility(math.random(3094, 3096))
                mob:setLocalVar("ROTATION", 0)          
            end
            mob:setLocalVar("rose", os.time() + 10)
        end
        
        if mob:getLocalVar("rose2hr") == 0 and mob:getHPP() < 50 then
            mob:useMobAbility(692) --chainspell
            mob:setLocalVar("rose2hr", 1)
            mob:timer(math.random(90000, 180000), function(mobArg)
                mobArg:setLocalVar("rose2hr", 0)
            end)
        end
 
    elseif mob:getID() == 17367043 then
        if GetMobByID(17367045):isAlive() then
            mob:disengage()
        end
        mob:setSpellList(425)
        
        mob:setMod(tpz.mod.ATT, 2200)
    
        if os.time() > mob:getLocalVar("ingrid") then            
            if mob:getLocalVar("ROTATION") == 0 and mob:getTP() >= 1500 then
                mob:useWeaponskill(167, target) --judgement
                mob:setLocalVar("ROTATION", 1)
            elseif mob:getLocalVar("ROTATION") == 1 and mob:getTP() >= 1500 then
                mob:useWeaponskill(172, target) -- flashnova
                mob:setLocalVar("ROTATION", 2)               
            elseif mob:getLocalVar("ROTATION") == 2 and mob:getTP() >= 1500 then
                mob:useWeaponskill(174, target) -- realmrazer
                mob:setLocalVar("ROTATION", 3)    
            elseif mob:getLocalVar("ROTATION") == 3 and mob:getTP() >= 1500 then
                mob:useMobAbility(3646) -- ruthlessness
                mob:setLocalVar("ROTATION", 0)                           
            end
            mob:setLocalVar("ingrid", os.time() + 10)
        end
        
        if os.time() > mob:getLocalVar("ingridBuff") and mob:getHPP() < 50 then
            if not mob:hasStatusEffect(tpz.effect.REGEN) then 
                mob:useMobAbility(3644) --self-aggrandizement
                mob:setMod(tpz.mod.REGEN, 500)
            end
            mob:setLocalVar("ingridBuff", os.time() + 60)
        end
        

        
    elseif mob:getID() == 17367041 then
        if GetMobByID(17367043):isAlive() then
            mob:disengage()
        end
        mob:SetMobSkillAttack(1228) 
        mob:setMod(tpz.mod.DEF, 2250)
        if os.time() > mob:getLocalVar("DBdelay") and mob:getHPP() < 50 and mob:getLocalVar("DAYBREAK") == 0 then
            mob:useMobAbility(3652)
            mob:timer(5200, function(mobArg)
                mobArg:AnimationSub(1)
            end)
            mob:setLocalVar("DAYBREAK", 1)
            mob:setLocalVar("ROTATION", 0)
        end

        if os.time() > mob:getLocalVar("august") then
            local daybreak = mob:getLocalVar("DAYBREAK")
            local rotation = mob:getLocalVar("ROTATION")
            if mob:getLocalVar("ROTATION") == 0 and mob:getTP() >= 2000 then
                mob:useMobAbility(3653) -- Tartaric Sigil
                mob:setLocalVar("ROTATION", 1)            
            elseif mob:getLocalVar("ROTATION") == 1 and mob:getTP() >= 2000 then
                mob:useMobAbility(3654) -- Null Field
                mob:setLocalVar("ROTATION", 2)   
            elseif mob:getLocalVar("ROTATION") == 2 and mob:getTP() >= 2000 then
                mob:useMobAbility(3655) -- Alabaster Burst
                mob:setLocalVar("ROTATION", 3)   
            elseif mob:getLocalVar("ROTATION") == 3 and mob:getTP() >= 2000 then
                mob:useMobAbility(3656) -- Noble Frenzy
                mob:setLocalVar("ROTATION", 4)    
            elseif mob:getLocalVar("ROTATION") == 4 and mob:getTP() >= 2000 then
                mob:useMobAbility(3657) -- Fulminous Fury
                mob:setLocalVar("ROTATION", 5)     
            elseif mob:getLocalVar("DAYBREAK") == 1 and mob:getLocalVar("ROTATION") == 5 and mob:getTP() >= 2000 then
                mob:useMobAbility(3658) -- No Quarter
                mob:timer(6450, function(mobArg)
                    mobArg:AnimationSub(0)
                end)
                mob:setLocalVar("DAYBREAK", 0) 
                mob:setLocalVar("DBdelay", os.time() + 180)
            elseif mob:getLocalVar("DAYBREAK") == 0 and mob:getLocalVar("ROTATION") == 5 and mob:getTP() >= 2000 then
                mob:setLocalVar("ROTATION", 0)
            end
            mob:setLocalVar("august", os.time() + 10)
        end 
        
        if mob:getLocalVar("august2hr") == 0 and mob:getHPP() < 50 then
            mob:useMobAbility(694) --invincible
            mob:setLocalVar("august2hr", 1)
            mob:timer(math.random(90000, 180000), function(mobArg)
                mobArg:setLocalVar("august2hr", 0)
            end)
        end

    end
end

function onSpellPrecast(mob, spell)

    if (spell:getID() == 112) then
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(20)
    end
end

function onMobDeath(mob, player, isKiller)
    if mob:getID() == 17367045 then
        GetMobByID(17367043):setDropID(3767)
        player:addSpell(985, true, true)
        mob:timer(300000, function(mobArg)
            GetMobByID(17367043):setLocalVar("ROTATION", 0)
            GetMobByID(17367043):setMobMod(tpz.mobMod.NO_MOVE, 0)
            GetMobByID(17367043):untargetable(false)
            GetMobByID(17367043):SetAutoAttackEnabled(true)
        end)
    elseif mob:getID() == 17367043 then
        player:addSpell(1016, true, true)
        GetMobByID(17367041):setDropID(3773)
        mob:timer(300000, function(mobArg)
            GetMobByID(17367041):setLocalVar("ROTATION", 0)        
            GetMobByID(17367041):setMobMod(tpz.mobMod.NO_MOVE, 0)
            GetMobByID(17367041):untargetable(false)
            GetMobByID(17367041):SetAutoAttackEnabled(true)
        end)
    elseif mob:getID() == 17367041 then
        player:addSpell(984, true, true)
        --add a char var for being awesome.
    end
end
