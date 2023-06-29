-----------------------------------
-- Raubahn
-----------------------------------
local ID = require("scripts/zones/Jade_Sepulcher/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to paralyze
    mob:addMod(tpz.mod.STUNRES, 30) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 100) -- Attack Stat (Compare to DEF)
	mob:addMod(tpz.mod.MATT, 100) -- Magic Attack (Compare to MDEF)
	mob:addMod(tpz.mod.EVA, 150) -- Evasion (Compare to ACC)
	mob:addMod(tpz.mod.DEF, 700) -- Defense (Compart to ATT)
	mob:addMod(tpz.mod.MEVA, 200) -- Magic Evasion (Compare to MACC)
	mob:addMod(tpz.mod.MDEF, 100) -- Magic Defense (Compare to MATT)
	mob:addMod(tpz.mod.STR, 130)
    mob:addMod(tpz.mod.DEX, 130)
    mob:addMod(tpz.mod.AGI, 130)
    mob:addMod(tpz.mod.VIT, 130)
    mob:addMod(tpz.mod.MND, 130)
    mob:addMod(tpz.mod.CHR, 130)
    mob:addMod(tpz.mod.INT, 130)
end

function onMobFight(mob, target)
    mob:removeListener("RAUBAHN_DEATH")
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        if mob:hasStatusEffect(tpz.effect.MIGHTY_GUARD) == true then
            mob:setMod(tpz.mod.REGEN, 500)
        else
            mob:setMod(tpz.mod.REGEN, 0)
        end
    
        if os.time() > mob:getLocalVar("BUFF_SPELL_DELAY") then
            if mob:hasStatusEffect(tpz.effect.HASTE) == false then
                mob:castSpell(710, mob)
            end
            
            if mob:hasStatusEffect(tpz.effect.ATTACK_BOOST) == false then
                mob:castSpell(700, mob)
            end
            
            if mob:hasStatusEffect(tpz.effect.BLINK) == false then
                mob:castSpell(679, mob)
            end
            
            if mob:hasStatusEffect(tpz.effect.STONESKIN) == false then
                mob:castSpell(632, mob)
            end
            mob:setLocalVar("BUFF_SPELL_DELAY", os.time() + 30)
        end
        
        if os.time() > mob:getLocalVar("HEAL_SPELL_DELAY") then
            if mob:getHPP() <= 50 then
                mob:castSpell(593, mob)
            end       
            mob:setLocalVar("HEAL_SPELL_DELAY", os.time() + 20)
        end
        
        if os.time() > mob:getLocalVar("NUKE_SPELL_DELAY") then
            local dmgSpell = math.random(1, 4)
            if dmgSpell == 1 then
                mob:castSpell(723, target)
            elseif dmgSpell == 2 then
                mob:castSpell(714, target)
            elseif dmgSpell == 3 then
                mob:castSpell(643, target)
            elseif dmgSpell == 4 then
                mob:castSpell(653, target)
            end
            mob:setLocalVar("NUKE_SPELL_DELAY", os.time() + 10)
        end   
        
        if os.time() > mob:getLocalVar("MG_CLEAR") then

            if (mob:getHPP() <= 80 and mob:getLocalVar("TERROR") == 0) then
                mob:castSpell(738, target)
                mob:setMod(tpz.mod.UDMGPHYS, -10)
                if mob:hasStatusEffect(tpz.effect.MIGHTY_GUARD) == false then
                    mob:castSpell(750, mob)
                end
                mob:setLocalVar("TERROR", 1)
            end
            
            if (mob:getHPP() <= 60 and mob:getLocalVar("TERROR") == 1) then
                mob:castSpell(738, target)
                mob:setMod(tpz.mod.UDMGPHYS, -20)
                if mob:hasStatusEffect(tpz.effect.MIGHTY_GUARD) == false then
                    mob:castSpell(750, mob)
                end
                mob:setLocalVar("TERROR", 2)
            end
            
            if (mob:getHPP() <= 40 and mob:getLocalVar("TERROR") == 2) then
                mob:castSpell(738, target)
                mob:setMod(tpz.mod.UDMGPHYS, -30)
                if mob:hasStatusEffect(tpz.effect.MIGHTY_GUARD) == false then
                    mob:castSpell(750, mob)
                end
                mob:setLocalVar("TERROR", 3)
            end
            
            if (mob:getHPP() <= 20 and mob:getLocalVar("TERROR") == 3) then
                mob:castSpell(738, target)
                mob:setMod(tpz.mod.UDMGPHYS, -40)
                if mob:hasStatusEffect(tpz.effect.MIGHTY_GUARD) == false then
                    mob:castSpell(750, mob)
                end
                mob:setLocalVar("TERROR", 4)
            end            
            mob:setLocalVar("MG_CLEAR", os.time() + 5)

        end            
        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 1)
    end 
end

function onSpellPrecast(mob, spell)
    if (spell:getID() == 738) then
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(20)
    end
end

function onMobDeath(mob, player, isKiller)
    local playerName   = player:getName()
	local mobName      = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local shortName    = mobName:sub(1, 18)
	local KillCounter  = player:getCharVar("KillCounter_"..shortName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..shortName, KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
    player:addSpell(973, true, true)
end

function onMobDespawn(mob)
end
