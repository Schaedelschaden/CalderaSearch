-----------------------------------
-- Area: LaLoff Amphitheater
--  Mob: Ark Angel TT
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------



function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.SKILL_LIST, 0)
    mob:setMobMod(tpz.mobMod.MOBMOD_TELEPORT_CD, 3000)
    mob:setMobMod(tpz.mobMod.MAGIC_COOL, 10)
    tpz.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            {id = tpz.jsa.BLOOD_WEAPON},
            {
                id = tpz.jsa.MANAFONT,
                endCode = function(mob) -- "Uses Manafont and ... Will cast Sleepga followed by Meteor."
                    mob:castSpell(273) -- sleepga
--                    mob:castSpell(218) -- meteor
                end,
            },
        },
    })
	ob:addMod(tpz.mod.PARALYZERES, 30)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 30)
    mob:addMod(tpz.mod.SILENCERES, 30)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
	mob:addMod(tpz.mod.ATT, 250)
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
	mob:setMod(tpz.mod.QUICK_MAGIC, 35) -- Instant Cast in %
	mob:setMod(tpz.mod.FASTCAST, 15) -- Speeds spellcasting
	mob:addMod(tpz.mod.REFRESH, 100)
	mob:setMod(tpz.mod.REGEN, 250)
end

function onMobEngaged(mob, target)
    local mobid = mob:getID()

    for member = mobid-5, mobid+2 do
        local m = GetMobByID(member)
        if m:getCurrentAction() == tpz.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

function onMobFight(mob, target)
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        -- Amon Drive, Spinning Scythe, Guillotine
        local skills = {935, 944, 945}
        local tp = mob:getTP()
        
        if (tp == 3000) then
            if (mob:checkDistance(target) <= 7) then
                mob:setTP(0)
                mob:useMobAbility(skills[math.random(1, 3)])
            elseif (mob:checkDistance(target) > 7) then
                local enmityList = mob:getEnmityList()
                local PlayerName = {}
                
                for i, v in ipairs(enmityList) do		
                    PlayerName[i] = v.entity:getName()

                    local targ = GetPlayerByName(PlayerName[i])
                    
                    if (mob:checkDistance(targ) <= 7) then
                        mob:setTP(0)
                        mob:useMobAbility(skills[math.random(1, 3)], targ)
                    end
                end
            end
        end

        if (mob:hasStatusEffect(tpz.effect.BLOOD_WEAPON) and bit.band(mob:getBehaviour(), tpz.behavior.STANDBACK) > 0) then
            mob:setBehaviour(bit.band(mob:getBehaviour(), bit.bnot(tpz.behavior.STANDBACK)))
            mob:setMobMod(tpz.mobMod.TELEPORT_TYPE, 0)
            mob:setMobMod(tpz.mobMod.SPAWN_LEASH, 0)
            mob:setSpellList(0)
        end
        if (not mob:hasStatusEffect(tpz.effect.BLOOD_WEAPON) and bit.band(mob:getBehaviour(), tpz.behavior.STANDBACK) == 0) then
            mob:setBehaviour(bit.bor(mob:getBehaviour(), tpz.behavior.STANDBACK))
            mob:setMobMod(tpz.mobMod.TELEPORT_TYPE, 1)
            mob:setMobMod(tpz.mobMod.SPAWN_LEASH, 22)
            mob:setSpellList(39)
        end
        

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 2)
    end
end

function onMobDeath(mob, player, isKiller)
	
end