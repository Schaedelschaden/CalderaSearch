-----------------------------------
-- Area: Phomiuna Aqueducts
--  Mob: Minotaur
-----------------------------------
mixins = {require("scripts/mixins/rage")}
-----------------------------------

function onMobSpawn(mob, target)
    mob:setLocalVar("[rage]timer", 1800) -- 30 minutes
    mob:setModelId(3094)
    mob:renameEntity("Selh'teus")
    mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Paralyze
    mob:addMod(tpz.mod.STUNRES, 60) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 80) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 80) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 80) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 50) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 50) -- Resistance to Poison	
	mob:addMod(tpz.mod.STR, 130)	
	mob:addMod(tpz.mod.DEX, 130)	
	mob:addMod(tpz.mod.VIT, 130)	
	mob:addMod(tpz.mod.CHR, 130)	
	mob:addMod(tpz.mod.MND, 130)	
	mob:addMod(tpz.mod.INT, 130)	
	mob:addMod(tpz.mod.MATT, 300)	
	mob:addMod(tpz.mod.MDEF, 100)
	mob:addMod(tpz.mod.DEF, 600)
	mob:addMod(tpz.mod.ATT, 900)
	mob:addMod(tpz.mod.MEVA, 250)
	mob:addMod(tpz.mod.MACC, 100)
	mob:addMod(tpz.mod.REGEN, 200)
    mob:addMod(tpz.mod.FASTCAST, 50)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
    mob:setSpellList(0)
    mob:setMod(tpz.mod.DMG, 0)
    mob:addMod(tpz.mod.MAGIC_DAMAGE, 40)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 1)
end

function onMobFight(mob, target)
    mob:setMod(tpz.mod.LIGHTATT, 100)
    mob:setMobMod(tpz.mobMod.NO_MOVE, 0)
    -- TP Moves
    local shuffle = math.random(1, 2)
    if os.time() > mob:getLocalVar("combat_delay") then
        if mob:getTP() >= 2000 then
            if shuffle == 1 then
                mob:useMobAbility(1508) -- luminous lance
            elseif shuffle == 2 then
                mob:useMobAbility(1510) -- Revelation
            end
            mob:setLocalVar("combat_delay", os.time() + 3)
        end
    end
    
    -- Magic script.
    if os.time() > mob:getLocalVar("magic_cooldown") then
        local spells = { 38, 22, 112 } --Banishaga / Holy II / Flash
        mob:castSpell(spells[math.random(1, 3)], target)
        mob:setLocalVar("magic_cooldown", os.time() + 30)
    end  
    
    -- Buffage
    if os.time() > mob:getLocalVar("Buffs") then
        if not mob:hasStatusEffect(tpz.effect.REPRISAL) then
            mob:castSpell(97, mob)
        end
        
        if not mob:hasStatusEffect(tpz.effect.PROTECT) then
            mob:castSpell(47, mob)
        end
        
        if not mob:hasStatusEffect(tpz.effect.SHELL) then
            mob:castSpell(51, mob)
        end
        
        if not mob:hasStatusEffect(tpz.effect.PHALANX) then
            mob:castSpell(106, mob)
        end
        mob:setLocalVar("Buffs", os.time() + 10)        
    end
    
    -- Specials
    if os.time() > mob:getLocalVar("special") then
        local isBusy = false
        local act    = mob:getCurrentAction()

        if
            act == tpz.act.WEAPONSKILL_START or
            act == tpz.act.WEAPONSKILL_FINISH or
            act == tpz.act.MOBABILITY_START or
            act == tpz.act.MOBABILITY_USING or
            act == tpz.act.MOBABILITY_FINISH or
            act == tpz.act.MAGIC_START or
            act == tpz.act.MAGIC_CASTING or
            act == tpz.act.MAGIC_FINISH
        then
            isBusy = true
        end

        if isBusy == false and mob:actionQueueEmpty() == true then
            if mob:getLocalVar("2hr") == 0 and mob:getHPP() <= 90 then 
                mob:useMobAbility(1014) --Invincible
                mob:setMod(tpz.mod.DMG, -5)
                mob:setLocalVar("2hr", 1)
            end
            
            if mob:getLocalVar("2hr") == 1 and mob:getHPP() <= 80 then 
                mob:useMobAbility(1014) --Invincible
                mob:setMod(tpz.mod.DMG, -10)
                mob:setLocalVar("2hr", 2)
            end
           
            if mob:getLocalVar("2hr") == 2 and mob:getHPP() <= 70 then 
                mob:useMobAbility(1014) --Invincible
                mob:setMod(tpz.mod.DMG, -20)
                mob:setLocalVar("2hr", 3)
            end

            if mob:getLocalVar("2hr") == 3 and mob:getHPP() <= 60 then 
                mob:useMobAbility(1014) --Invincible
                mob:setMod(tpz.mod.DMG, -30)
                mob:setLocalVar("2hr", 4)
            end
            
            if mob:getLocalVar("2hr") == 4 and mob:getHPP() <= 50 then 
                mob:useMobAbility(1014) --Invincible
                mob:setMod(tpz.mod.DMG, -35)
                mob:setLocalVar("2hr", 5)
            end
            
            if mob:getLocalVar("2hr") == 5 and mob:getHPP() <= 40 then 
                mob:useMobAbility(1014) --Invincible
                mob:setMod(tpz.mod.DMG, -40)
                mob:setLocalVar("2hr", 6)
            end
            
            if mob:getLocalVar("2hr") == 6 and mob:getHPP() <= 30 then 
                mob:useMobAbility(1014) --Invincible
                mob:setMod(tpz.mod.DMG, -50)
                mob:setLocalVar("2hr", 7)
            end
            mob:setLocalVar("special", os.time() + 1)
        end
    end
    
    -- Rejuvination
    if mob:getHPP() <= 50 then 
        mob:setMod(tpz.mod.MAGIC_DAMAGE, 150)
        if os.time() > mob:getLocalVar("restore") then
            mob:useMobAbility(1509)
            mob:resetEnmity(target)
            mob:setLocalVar("restore", os.time() + 120)
        end
    end
end


function onMobDisengage(mob)
    mob:setLocalVar("2hr", 0)
    mob:setMod(tpz.mod.DMG, 0)
end

function onMobRoam(mob)
end

function onMobDeath(mob, player, isKiller)
    mob:setLocalVar("2hr", 0)
    mob:setMod(tpz.mod.DMG, 0)
    player:addSpell(979, true, true)
end

function onMobDespawn(mob, player, isKiller)
    mob:setLocalVar("2hr", 0)
    mob:setMod(tpz.mod.DMG, 0)
end
