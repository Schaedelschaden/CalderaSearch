-----------------------------------
-- Area: Navukgo Execution Chamber
--  Mob: Valken
-----------------------------------
local ID = require("scripts/zones/Navukgo_Execution_Chamber/IDs")
require("scripts/globals/mobs")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
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
    mob:addMod(tpz.mod.COUNTER, 15)
    mob:addMod(tpz.mod.HASTE_MAGIC, 500)
    
    local sham = GetMobByID(mob:getID() - 5)
    if sham:getHPP() < 100 then
        mob:setLocalVar("heady", 3)  
    end        

end

function onMobFight(mob, target)
    local heady = mob:getLocalVar("heady")
    local sham = GetMobByID(mob:getID() - 5)
    
    if os.time() > mob:getLocalVar("SKILL_ROTATE") then
        if mob:getTP() == 3000 then
            mob:useMobAbility(2743) -- string shredder
        end
        
        if mob:getHPP() <= 80 and mob:getLocalVar("heady") == 0 then
            mob:useMobAbility(688) --mighty strikes
            mob:setLocalVar("heady", 1)
        elseif mob:getHPP() <= 60 and mob:getLocalVar("heady") == 1 then
            mob:useMobAbility(738) --EES
            mob:setLocalVar("heady", 2)
        elseif mob:getHPP() <= 50 and mob:getLocalVar("heady") == 2 then
            mob:useMobAbility(689) --benediction
            mob:setLocalVar("heady", 3)        
        elseif mob:getHPP() <= 10 and mob:getLocalVar("heady") == 3 then
            mob:useMobAbility(694) --invincible
            sham:updateEnmity(target)
            sham:hideName(false)
            mob:setLocalVar("heady", 4)
        end
        mob:setLocalVar("SKILL_ROTATE", os.time() + 1)
    end
end

function onMobDeath(mob, player, isKiller)
    
end

function onMobDespawn(mob)
end
