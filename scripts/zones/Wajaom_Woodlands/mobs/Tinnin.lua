-----------------------------------
-- Area: Wajaom Woodlands
--  ZNM: Dark Bart (Tinnin)
-- !pos 276 0 -694
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
-----------------------------------



function onMobSpawn(mob)
    mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Paralyze
    mob:addMod(tpz.mod.STUNRES, 60) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 50) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 60) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 60) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 60) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 60) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 60) -- Resistance to Poison	
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
    mob:addMod(tpz.mod.FASTCAST, 100)
    mob:setMobMod(tpz.mobMod.DUAL_WIELD, 1)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
    mob:setUnkillable(true)
end

function onMobFight(mob, target)
    mob:renameEntity("Dark Bart")
    if mob:getHP() == 1 then
        target:setCharVar("DARKBART", 1)       
        local target = mob:getTarget()
        local party  = target:getAlliance()
        for _, v in ipairs(party) do
            v:addStatusEffect(tpz.effect.TERROR, 1, 0, 30)
            v:disengage()
            mob:resetEnmity(v)
            if v:getObjType() == tpz.objType.PC then
                v:injectActionPacket(11, 2490, 0, 0, 0)
                mob:setHP(1500000)                
                mob:disengage()
                mob:timer(5000, function(mobArg)
                    v:PrintToPlayer(string.format("Dark Bart: I grow tired of these games... Take what you came for and be out of my sight before I crash the server."), tpz.msg.channel.NS_SAY)
                    v:PrintToPlayer(string.format("You have obtained Bart's Essence."), tpz.msg.channel.SYSTEM_3)
                end)
                mob:timer(30000, function(mobArg)
                    v:warp()
                end)
            end
        end
    end
    
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
    mob:setSpellList(0)
    mob:setMod(tpz.mod.ALL_WSDMG_ALL_HITS, -50)
    
    if os.time() > mob:getLocalVar("COMBAT_DELAY") then
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
            if os.time() > mob:getLocalVar("Buffs") then
                if not mob:hasStatusEffect(tpz.effect.MULTI_STRIKES) then
                    mob:castSpell(493, mob)
                end
                
                if not mob:hasStatusEffect(tpz.effect.HASTE) then
                    mob:castSpell(511, mob)
                end
                
                if not mob:hasStatusEffect(tpz.effect.ENDARK) then
                    mob:castSpell(311, mob)
                end
                
                if not mob:hasStatusEffect(tpz.effect.MIGHTY_GUARD) then
                    mob:castSpell(750, mob)
                end
                
                if not mob:hasStatusEffect(tpz.effect.DEFENSE_BOOST) then
                    mob:castSpell(547, mob)
                end
                
                if not mob:hasStatusEffect(tpz.effect.GEO_POISON) then
                    mob:castSpell(769, mob)
                end
                
                if not mob:hasStatusEffect(tpz.effect.FOIL) then
                    mob:castSpell(840, mob)
                end
                
                if not mob:hasStatusEffect(tpz.effect.PROTECT) then
                    mob:castSpell(47, mob)
                end
                
                if not mob:hasStatusEffect(tpz.effect.SHELL) then
                    mob:castSpell(52, mob)
                end
                
                if not mob:hasStatusEffect(tpz.effect.REPRISAL) then
                    mob:castSpell(97, mob)
                end
                
                if not mob:hasStatusEffect(tpz.effect.MARCH) then
                    mob:castSpell(420, mob)
                end
                mob:setLocalVar("buffs", os.time() + 60)
            end            
        end
        if mob:getTP() >= 2000 then
            -- local onionKnight = mob:getLocalVar("OnionKnight")
            mob:useWeaponskill(math.random(1, 240), target)
            -- mob:setLocalVar("OnionKnight", mob:getLocalVar("OnionKnight") + 1)
        end
        
        -- if mob:getLocalVar("OnionKnight") >= 241 then
            -- mob:setLocalVar("OnionKnight", 0)
        -- end
        
        if os.time() > mob:getLocalVar("bloodrake") then
            mob:castSpell(743, target)
            mob:setLocalVar("bloodrake", os.time() + 60)
        end
        
        if mob:hasStatusEffect(tpz.effect.SILENCE) then
            mob:addStatusEffect(tpz.effect.HUNDRED_FISTS, 1, 0, 0)
            mob:addStatusEffect(tpz.effect.MIGHTY_STRIKES, 1, 0, 0)
        else
            mob:delStatusEffect(tpz.effect.HUNDRED_FISTS)
            mob:delStatusEffect(tpz.effect.MIGHTY_STRIKES)
        end         
            
        mob:setLocalVar("COMBAT_DELAY", os.time() + 3)
    end
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller)
    mob:setRespawnTime(20)
end

function onMobDespawn(mob)
end
