-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Suzaku
-- ???'s located at:
-- !pos 107 -40 -432  (Portal 1 - Main island)
-- !pos -291 -42 -401 (Portal 2 - SW AA island)
-- !pos -471 42 153   (Portal 5 - NW AA island)
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
require("scripts/globals/keyitems")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:setLocalVar("BLOCK_HPMP_CHANGE_ON_LEVEL", 1)
    mob:setMobLevel(141)
    mob:addMod(tpz.mod.PARALYZERES, 30)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 30)
    mob:addMod(tpz.mod.SILENCERES, 80)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
	mob:addMod(tpz.mod.ATT, 250)
    mob:addMod(tpz.mod.MATT, 200)
	mob:addMod(tpz.mod.EVA, 175)
	mob:addMod(tpz.mod.DEF, 275)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MDEF, 50)
	mob:addMod(tpz.mod.STR, 110)
    mob:addMod(tpz.mod.DEX, 110)
    mob:addMod(tpz.mod.AGI, 110)
    mob:addMod(tpz.mod.VIT, 110)
    mob:addMod(tpz.mod.MND, 110)
    mob:addMod(tpz.mod.CHR, 110)
    mob:addMod(tpz.mod.INT, 110)
    mob:setMod(tpz.mod.FIRE_ABSORB, 100)
    mob:setLocalVar("CHAIN_SPELL_HP", 90)
    mob:setLocalVar("SCREAM_DELAY", os.time() + 30)
    mob:setMobMod(tpz.mobMod.SPELL_LIST, 511)

    mob:addListener("SKILLCHAIN_TAKE", "SKILLCHAIN_TAKEN", function(defender, attacker, element, chainLevel, chainCount) -- , resistance, damage)
        if
            defender:getMainLvl() > 130 and
            (element == 14 or element == 16)
        then
            defender:timer(5000, function(mobArg)
                mobArg:setMobLevel(mobArg:getMainLvl() - 1)
                mobArg:injectActionPacket(4, 509)
            end)
        end
    end)

    mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mobArg, skillID)
        if skillID == 923 and mobArg:getMainLvl() < 160 then -- Giga Scream
            mobArg:setMobLevel(mobArg:getMainLvl() + 1)
            mobArg:injectActionPacket(4, 510)
        end
    end)
end

function onMobFight(mob, target)
    local isBusy = false
    local act    = mob:getCurrentAction()

    if
        act == tpz.act.MOBABILITY_START or
        act == tpz.act.MOBABILITY_USING or
        act == tpz.act.MOBABILITY_FINISH or
        act == tpz.act.MAGIC_START or
        act == tpz.act.MAGIC_CASTING or
        act == tpz.act.MAGIC_START
    then
        isBusy = true
    end

    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        local cSpell = mob:getLocalVar("CHAIN_SPELL_HP")

        if
            mob:getHPP() > 10 and
            mob:getHPP() <= cSpell and
            mob:hasStatusEffect(tpz.effect.CHAINSPELL) == false
        then
            mob:useMobAbility(692)
            mob:setLocalVar("CHAIN_SPELL_HP", mob:getHPP() - math.random(5, 15))
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 3)
    end
    
    if os.time() > mob:getLocalVar("SCREAM_DELAY") and isBusy == false then
        mob:useMobAbility(923) -- Giga Scream
        mob:setLocalVar("SCREAM_DELAY", os.time() + math.random(25, 125))
    end
    
    mob:setMod(tpz.mod.MAIN_DMG_RATING, mob:getMainLvl() + 80)
    mob:setMod(tpz.mod.WSDMG_ALL_HITS, 100)
end  

function onMobDespawn(mob)
    mob:removeListener("SKILLCHAIN_TAKEN")
    mob:removeListener("MOBSKILL_USED")
end


-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
    -- Suzaku uses     Burn, Fire IV, Firaga III, Flare
    -- Let's give -ga3 a higher distribution than the others.
    -- local rnd = math.random()

    -- if rnd < 0.5 then
        -- return 496 -- firaja
    -- elseif rnd < 0.7 then
        -- return 148 -- fire 5
    -- elseif rnd < 0.9 then
        -- return 205 -- flare 2
    -- else
        -- return 235 -- burn
    -- end
end

function onAdditionalEffect(mob, target, damage)
	local damage = 1400

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE)
end

function onMobDeath(mob, player, isKiller)
	local KillCounter = player:getCharVar("KillCounter_EschaSuzaku")
	local playerName = player:getName()
	local mobName = mob:getName()
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_EschaSuzaku", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", mobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)

end