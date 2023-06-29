-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Ullegore
-----------------------------------
local ID = require("scripts/zones/QuBia_Arena/IDs")
-----------------------------------


function onMobSpawn(mob)
    mob:setSpellList(164)
    mob:addMod(tpz.mod.PARALYZERES, 30) -- Resistance to Silence
    mob:addMod(tpz.mod.STUNRES, 50) -- Resistance to Stun
    mob:addMod(tpz.mod.BINDRES, 30) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 100) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
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

end


function onMobFight(mob, target)
    local mumor = GetMobByID(17621562)
    mumor:updateEnmity(mob)
    local player = mob:getTarget()
    local heals = mob:getLocalVar("heals")
    mob:setMobMod(tpz.mobMod.SKILL_LIST, 74)

    local casterJobs =
    {
        tpz.job.WHM,
        tpz.job.RDM,
        tpz.job.SCH,
        tpz.job.BRD,
        tpz.job.BLM,
        tpz.job.SMN,
        tpz.job.GEO,
    }

    local meleeJobs =
    {
        tpz.job.WAR,
        tpz.job.MNK,
        tpz.job.THF,
        tpz.job.DRK,
        tpz.job.BST,
        tpz.job.RNG,
        tpz.job.SAM,
        tpz.job.DRG,
        tpz.job.BLU,
        tpz.job.COR,
        tpz.job.PUP,
        tpz.job.DNC,
    }

    local tanks =
    {
        tpz.job.PLD,
        tpz.job.RUN,
        tpz.job.NIN,
    }

    for i = 1, #casterJobs do
        local player  = mob:getTarget()
        if player:getMainJob() == casterJobs[i] then
            mob:setLocalVar("DPS", 1)
            mumor:setSpellList(22)
            mumor:setMod(tpz.mod.STR, 500)
            mumor:setMod(tpz.mod.MACC, 500)
            mumor:delStatusEffect(tpz.effect.ACCESSION)
            -- mumor:addStatusEffect(tpz.effect.ASPIR_SAMBA, 2, 0, 0)
            -- player:addStatusEffect(tpz.effect.ASPIR_SAMBA, 2, 0, 0)
            mumor:setMod(tpz.mod.REGAIN, 100)
        end
    end

    for i = 1, #meleeJobs do
        local player  = mob:getTarget()
        if player:getMainJob() == meleeJobs[i] then
            mob:setLocalVar("DPS", 0)
            mumor:setSpellList(420)
            mumor:setMod(tpz.mod.AGI, 300)
            mumor:delStatusEffect(tpz.effect.ACCESSION)
            -- mumor:addStatusEffect(tpz.effect.DRAIN_SAMBA, 3, 0, 0)
            -- player:addStatusEffect(tpz.effect.DRAIN_SAMBA, 3, 0, 0)
        end
    end

    for i = 1, #tanks do
        local player  = mob:getTarget()
        if player:getMainJob() == tanks[i] then
            mumor:setSpellList(452)
            mumor:setMod(tpz.mod.VIT, 300)
            -- mumor:addStatusEffect(tpz.effect.HASTE_SAMBA, 1, 0, 0)
            mumor:addStatusEffect(tpz.effect.ACCESSION, 1, 0, 0)
            -- player:addStatusEffect(tpz.effect.HASTE_SAMBA, 1, 0, 0)
        end
    end
    
    mob:setMod(tpz.mod.ENH_DRAIN_ASPIR, 100)
    if os.time() > mob:getLocalVar("drain") and mob:getHPP() <= 50 then
        mob:castSpell(245, target)
        mob:setLocalVar("drain", os.time() + 30)
    end
    
    if os.time() > mob:getLocalVar("2hr") and mob:getHPP() <= 50 then
        mob:useMobAbility(691)
        mob:setLocalVar("2hr", os.time() + math.random(60, 180))
    end
    


    if player:getHPP() <= 50 and heals == 0 then
        mumor:castSpell(4, player)
        mob:setLocalVar("heals", 1)
        mob:timer(15000, function(mobArg)
            mobArg:setLocalVar("heals", 0)
        end)
    end
end

function onSpellPrecast(mob, spell)
    if (spell:getID() ~= 0) then
        spell:setAoE(tpz.magic.aoe.RADIAL)
        spell:setFlag(tpz.magic.spellFlag.HIT_ALL)
        spell:setRadius(15)
    end
end

function onMobDeath(mob, player, isKiller)
    -- player:addItem(tpz.items.MUMOR_STATUE)
    player:addItem(3728)
    -- player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.MUMOR_STATUE)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 3728)
    GetMobByID(17621562):setHP(0)
    player:delStatusEffect(tpz.effect.HASTE_SAMBA)
    player:delStatusEffect(tpz.effect.DRAIN_SAMBA)
    player:delStatusEffect(tpz.effect.ASPIR_SAMBA)
end

