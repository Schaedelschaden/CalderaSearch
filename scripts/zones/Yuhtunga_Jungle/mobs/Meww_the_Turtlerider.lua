-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Meww the Turtlerider
-----------------------------------
mixins = {require("scripts/mixins/rage")}
-----------------------------------

function onMobInitialize(mob)

end

function onMobSpawn(mob, target)
    mob:setMobLevel(143)
    mob:setLocalVar("[rage]timer", 1800) -- 30 minutes
    mob:setModelId(3026)
    mob:renameEntity("Lehko Habhoka")
    mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Paralyze
    mob:addMod(tpz.mod.STUNRES, 60) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 60) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 50) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 50) -- Resistance to Lullaby
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
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 50)    
    mob:addMod(tpz.mod.TRIPLE_ATTACK, 25)    
    mob:addMod(tpz.mod.QUAD_ATTACK, 20)
    mob:addMod(tpz.mod.FASTCAST, 50)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
    mob:setSpellList(0)
    mob:setMod(tpz.mod.DMG, 0)
    mob:addMod(tpz.mod.MAGIC_DAMAGE, 40)
end

function onMobFight(mob, target)

    if os.time() > mob:getLocalVar("combat_delay") then
        if mob:getTP() >= 3000 then
            mob:useMobAbility(math.random(3231, 3233))
        end 
        mob:setLocalVar("combat_delay", os.time() + 3)
    end
    
    -- Magic script.
    if os.time() > mob:getLocalVar("magic_cooldown") and not mob:hasStatusEffect(tpz.effect.CHAINSPELL) then
        local mLvl = mob:getMainLvl()
        local spells = { 145, 150, 155, 160, 165, 170 }
        mob:castSpell(spells[math.random(1, 6)], target)
        mob:setLocalVar("magic_cooldown", os.time() + 30)
    end    
    
    if mob:hasStatusEffect(tpz.effect.PERFECT_DODGE) then
        mob:setTP(0)
    end    
    
    if os.time() > mob:getLocalVar("magic_cooldown") and mob:hasStatusEffect(tpz.effect.CHAINSPELL) then
        mob:setTP(0)
        local mLvl = mob:getMainLvl()
        local spells = { 145, 150, 155, 160, 165, 170 }
        mob:castSpell(spells[math.random(1, 6)], target)
        mob:setLocalVar("magic_cooldown", os.time() + 1)
    end    

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
                mob:useMobAbility(693) --perfect dodge
                mob:useMobAbility(3233)
                -- mob:setMobLevel(mob:getMainLvl() + 1)
                -- mob:injectActionPacket(4, 510)
                mob:setMod(tpz.mod.DMG, -5)
                mob:setLocalVar("2hr", 1)
            end
            
            if mob:getLocalVar("2hr") == 1 and mob:getHPP() <= 80 then 
                mob:useMobAbility(692) --chainspell
                mob:useMobAbility(3233)
                -- mob:setMobLevel(mob:getMainLvl() + 1)
                -- mob:injectActionPacket(4, 510)
                mob:setMod(tpz.mod.DMG, -10)
                mob:setLocalVar("2hr", 2)
            end
           
            if mob:getLocalVar("2hr") == 2 and mob:getHPP() <= 70 then 
                mob:useMobAbility(693) --perfect dodge
                mob:useMobAbility(3233)
                -- mob:setMobLevel(mob:getMainLvl() + 1)
                -- mob:injectActionPacket(4, 510)
                mob:setMod(tpz.mod.DMG, -20)
                mob:setLocalVar("2hr", 3)
            end

            if mob:getLocalVar("2hr") == 3 and mob:getHPP() <= 60 then 
                mob:useMobAbility(692) --chainspell
                mob:useMobAbility(3233)
                -- mob:setMobLevel(mob:getMainLvl() + 1)
                -- mob:injectActionPacket(4, 510)
                mob:setMod(tpz.mod.DMG, -30)
                mob:setLocalVar("2hr", 4)
            end
            
            if mob:getLocalVar("2hr") == 4 and mob:getHPP() <= 50 then 
                mob:useMobAbility(693) --perfect dodge
                mob:useMobAbility(3233)
                -- mob:setMobLevel(mob:getMainLvl() + 1)
                -- mob:injectActionPacket(4, 510)
                mob:setMod(tpz.mod.DMG, -35)
                mob:setLocalVar("2hr", 5)
            end
            
            if mob:getLocalVar("2hr") == 5 and mob:getHPP() <= 40 then 
                mob:useMobAbility(692) --chainspell
                mob:useMobAbility(3233)
                -- mob:setMobLevel(mob:getMainLvl() + 1)
                -- mob:injectActionPacket(4, 510)
                mob:setMod(tpz.mod.DMG, -40)
                mob:setLocalVar("2hr", 6)
            end
            
            if mob:getLocalVar("2hr") == 6 and mob:getHPP() <= 30 then 
                mob:useMobAbility(693) --Perfect dodge
                mob:useMobAbility(3233)
                -- mob:setMobLevel(mob:getMainLvl() + 3)
                -- mob:injectActionPacket(4, 510)
                -- mob:injectActionPacket(4, 510)
                -- mob:injectActionPacket(4, 510)
                mob:setMod(tpz.mod.DMG, -50)
                mob:setLocalVar("2hr", 7)
            end
            mob:setLocalVar("special", os.time() + 1)
        end
    end

    if mob:getHPP() <= 50 then 
        mob:setMod(tpz.mod.MAGIC_DAMAGE, 150)
        if os.time() > mob:getLocalVar("restore") then
            mob:useMobAbility(3230)
            mob:setLocalVar("restore", os.time() + 90)
        end
    end
end

function onMobDisengage(mob)
    mob:setLocalVar("2hr", 0)
    mob:setMod(tpz.mod.DMG, 0)
    mob:setMod(tpz.mod.SILENCERES, 60)
end

function onMobRoam(mob)
end

function onMobDeath(mob, player, isKiller)
    mob:setLocalVar("2hr", 0)
    mob:setMod(tpz.mod.DMG, 0)
    player:addSpell(922, true, true)
end

function onMobDespawn(mob, player, isKiller)
    mob:setLocalVar("2hr", 0)
    mob:setMod(tpz.mod.DMG, 0)
end
