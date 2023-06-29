-----------------------------------
-- Area: Navukgo Execution Chamber
--  Mob: Shamarhaan
-----------------------------------
local ID = require("scripts/zones/Navukgo_Execution_Chamber/IDs")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to paralyze
    mob:addMod(tpz.mod.STUNRES, 100) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 30) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 30) -- Resistance to Lullaby
    mob:addMod(tpz.mod.PETRIFYRES, 30) -- Resistance to Pertrify
    mob:addMod(tpz.mod.POISONRES, 30) -- Resistance to Poison
	mob:addMod(tpz.mod.ATT, 500) -- Attack Stat (Compare to DEF)
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
    mob:addMod(tpz.mod.COUNTER, 20)
    local valk = GetMobByID(mob:getID() + 5)
    valk:setPos(mob:getXPos() - 5, mob:getYPos(), mob:getZPos())
    mob:setLocalVar("engage", 0)
    mob:hideName(true)
    mob:untargetable(true)
end

function onMobFight(mob, target)
    local valk = GetMobByID(mob:getID() + 5)
    
    if valk:isAlive() == true and mob:getLocalVar("engage") == 0 then
        mob:setMod(tpz.mod.UDMGPHYS, -100)
        mob:SetAutoAttackEnabled(false)
    elseif valk:isAlive() == false and mob:getHPP() > 0 then
        mob:setMod(tpz.mod.UDMGPHYS, 0)
        mob:SetAutoAttackEnabled(true) 
        mob:hideName(false)
        mob:untargetable(false)       
        mob:setLocalVar("engage", 1)        
    end
    
    if mob:isEngaged() == true and valk:isEngaged() == false then
        valk:updateEnmity(target)
    end
    
    if mob:getHPP() <= 10 and mob:getLocalVar("overdrive") == 0 then
        mob:useJobAbility(135, mob)
        SpawnMob(mob:getID() + 5)
        valk:setHP(12000)
        valk:addMod(tpz.mod.HASTE_MAGIC, 2500)
        valk:addMod(tpz.mod.ACC, 100)
        valk:addMod(tpz.mod.RACC, 100)
        valk:addMod(tpz.mod.EVA, 50)
        valk:addMod(tpz.mod.MEVA, 50)
        valk:addMod(tpz.mod.REVA, 50)
        valk:addMod(tpz.mod.UDMGPHYS, -87.5)
        valk:setMod(tpz.mod.UDMGMAGIC, -87.5)
        mob:setLocalVar("overdrive", 1)
    end
    
    if os.time() > mob:getLocalVar("SKILL_ROTATE") then
        local target = mob:getTarget()
        if mob:getTP() == 3000 then
            mob:useMobAbility(521)
        end
        if mob:getHPP() <= 50 and mob:getLocalVar("2hr") == 0 then
            mob:useMobAbility(1485) -- hundred fists
            mob:setLocalVar("2hr", 1)
        end     
        mob:setLocalVar("SKILL_ROTATE", os.time() + 10)
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
    player:addSpell(923, true, true)
    player:addSpell(925, true, true)
    player:addSpell(926, true, true)
end

function onMobDespawn(mob)
end
