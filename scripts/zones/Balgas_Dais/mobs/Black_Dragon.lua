-----------------------------------
-- Area: Balga's Dais
--  Mob: Black Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob, target)
    GetMobByID(17375237):setDropID(3774)
    GetMobByID(17375235):setDropID(3768)
    GetMobByID(17375233):setDropID(3771)
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
    
    if mob:getID() == 17375237 then
        mob:setModelId(3118)
        mob:renameEntity("Ygnas")
        mob:setSpellList(411)
    elseif mob:getID() == 17375235 then
        mob:setModelId(3103)
        mob:renameEntity("Teodor")
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:untargetable(true)
        mob:SetAutoAttackEnabled(false)
        mob:setSpellList(399)
    elseif mob:getID() == 17375233 then
        mob:setModelId(3085)
        mob:renameEntity("Arciela")
        mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
        mob:untargetable(true)
        mob:SetAutoAttackEnabled(false)
        mob:setSpellList(426)        
    end
    GetMobByID(17375234):setHP(0)
    mob:setLocalVar("skillRotate", 0)
end

function onMobFight(mob, target)
    if mob:getID() == 17375237 then
        if os.time() > mob:getLocalVar("Ygnas") then            
            if mob:getTP() >= 2000 then
                mob:useMobAbility(math.random(2979, 2980))
            end
            mob:setLocalVar("Ygnas", os.time() + 10)
        end 
        if mob:getLocalVar("Diaga") == 0 and mob:getHPP() < 50 then
            mob:castSpell(35, target) 
            mob:setLocalVar("Diaga", 1)
            mob:timer(30000, function(mobArg)
                mobArg:setLocalVar("Diaga", 0)
            end)
        end
        
    elseif mob:getID() == 17375235 then
        if GetMobByID(17375237):isAlive() then
            mob:disengage()
        end
        
        if os.time() > mob:getLocalVar("Teodor") then            
            if mob:getTP() >= 2500 then
                mob:useMobAbility(math.random(3381, 3384))
            end
            mob:setLocalVar("Teodor", os.time() + 10)
        end
        
        if mob:getLocalVar("Scratch") == 0 and mob:getTP() >= 1000 then
            mob:SetMobSkillAttack(1236) 
            mob:useMobAbility(3380) 
            mob:timer(5000, function(mobArg)
                mobArg:AnimationSub(1)
            end)
            mob:setLocalVar("Scratch", 1)
            mob:timer(60000, function(mobArg)
                mobArg:useMobAbility(3385)             
                mobArg:setLocalVar("Scratch", 0)
                mobArg:AnimationSub(0)
            end)
        end
        
        
    elseif mob:getID() == 17375233 then
        if GetMobByID(17375235):isAlive() then
            mob:disengage()
        end

        mob:SetMobSkillAttack(1235) 
        if os.time() > mob:getLocalVar("Arciela") then
            if mob:getTP() >= 2500 then
                mob:useMobAbility(math.random(3580, 3584))
            end
            mob:setLocalVar("Arciela", os.time() + 10)
        end         
        
        if mob:getLocalVar("Naakul") == 0 and mob:getHPP() < 50 and mob:getTP() >= 1000 then
            mob:AnimationSub(1)
            mob:useMobAbility(3585)
            
            SpawnMob(17375234)
            GetMobByID(17375234):setPos(mob:getXPos() + 5, mob:getYPos(), mob:getZPos())
            GetMobByID(17375234):updateEnmity(target)  
            local randNaakul = math.random(1, 6)
            if randNaakul == 1 then
                GetMobByID(17375234):setModelId(2500)
                GetMobByID(17375234):renameEntity("Colkhab")
                GetMobByID(17375234):useMobAbility(3007) -- Colkhab: Incisive Apotheosis
            elseif randNaakul == 2 then
                GetMobByID(17375234):setModelId(2505)
                GetMobByID(17375234):renameEntity("Tchakka")
                GetMobByID(17375234):useMobAbility(3016) -- Tchakka: Marine Mayhem
            elseif randNaakul == 3 then
                GetMobByID(17375234):setModelId(2515)
                GetMobByID(17375234):renameEntity("Achuka")
                GetMobByID(17375234):useMobAbility(3026) -- Achuka: Incinerating Lahar
            elseif randNaakul == 4 then
                GetMobByID(17375234):setModelId(2510)
                GetMobByID(17375234):renameEntity("Yumcax")
                GetMobByID(17375234):useMobAbility(3062) -- Yumcax: Tiiimbeeer
            elseif randNaakul == 5 then
                GetMobByID(17375234):setModelId(2580)
                GetMobByID(17375234):renameEntity("Hurkan")
                GetMobByID(17375234):useMobAbility(3078) -- Hurkan: Static Prison
            elseif randNaakul == 6 then
                GetMobByID(17375234):setModelId(2585)
                GetMobByID(17375234):renameEntity("Kumhau")
                GetMobByID(17375234):useMobAbility(3142) -- Kumhau: Glassy Nova
            end
            
            mob:timer(7000, function(mobArg)
                DespawnMob(17375234)
                DespawnMob(17375236)
                DespawnMob(17375238)
            end)
            
            mob:setLocalVar("Naakul", 1)
            mob:timer(90000, function(mobArg)
                mobArg:setLocalVar("Naakul", 0)
            end)
        end
    end
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 245) then
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setRadius(20)
    end
end

function onMobDeath(mob, player, isKiller)
    if mob:getID() == 17375237 then
        GetMobByID(17375235):setDropID(3768)
        player:addSpell(998, true, true)
        mob:timer(300000, function(mobArg)
            GetMobByID(17375235):setLocalVar("ROTATION", 0)
            GetMobByID(17375235):setMobMod(tpz.mobMod.NO_MOVE, 0)
            GetMobByID(17375235):untargetable(false)
            GetMobByID(17375235):SetAutoAttackEnabled(true)
        end)
    elseif mob:getID() == 17375235 then
        GetMobByID(17375233):setDropID(3771)
        player:addSpell(986, true, true)
        mob:timer(300000, function(mobArg)
            GetMobByID(17375233):setLocalVar("ROTATION", 0)        
            GetMobByID(17375233):setMobMod(tpz.mobMod.NO_MOVE, 0)
            GetMobByID(17375233):untargetable(false)
            GetMobByID(17375233):SetAutoAttackEnabled(true)
        end)
    elseif mob:getID() == 17375233 then
        player:addSpell(1017, true, true)
        --add a char var for being awesome.
    end
end
