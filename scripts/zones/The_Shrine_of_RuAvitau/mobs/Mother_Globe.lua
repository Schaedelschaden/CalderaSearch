-----------------------------------
-- Area: The Shrine of Ru'Avitau
--   NM: Mother Globe
-- TODO: Looked like pets had an additional effect: stun with an unknown proc rate
-- TODO: "Links with Slave Globes, and Slave Globes link with Defenders. Defenders do not link with Slave Globes or Mother Globe."
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.REFRESH, 10)
    mob:addStatusEffectEx(tpz.effect.SHOCK_SPIKES,0,60,0,0) -- ~60 damage
    -- TODO: Effect can be stolen, giving a THF (Aura Steal) or BLU (Voracious Trunk) a 60 minute shock spikes effect (unknown potency).
    -- If effect is stolen, he will recast it instantly.
end

function onMobFight(mob, target)
    local motherGlobe = mob:getID()

    -- Keep pets linked
    for i = motherGlobe + 1, motherGlobe + 6 do
        local pet = GetMobByID(i)
        if pet:getCurrentAction() == tpz.act.ROAMING then
            pet:updateEnmity(target)
        end
    end

    -- Summons a single orb every 30 seconds.  Needs to be last, so other code runs.
    -- TODO: Should have a SMN casting effect for ~3-5 seconds while calling.
    if mob:getBattleTime() % 30 == 0 and mob:getBattleTime() > 3 then
        for i = motherGlobe + 1, motherGlobe + 6 do
            local pet = GetMobByID(i)
            if not pet:isSpawned() then
                pet:setSpawn(mob:getXPos() + 1, mob:getYPos(), mob:getZPos() + 1)
                pet:spawn()
                pet:updateEnmity(target)
                return
            end
        end
    end
end

function onAdditionalEffect(mob,target,damage)
    -- TODO: Additional Effect for ~100 damage (theme suggests enthunder)
    -- Unknown if this can be stolen/dispelled like spikes.  Isn't mentioned, probably not.
end

function onMobDeath(mob, player, isKiller)
    local motherGlobe = mob:getID()

    for i = motherGlobe + 1, motherGlobe + 6 do
        local pet = GetMobByID(i)
        if pet:isSpawned() then
            DespawnMob(i)
        end
    end
	
	local KillCounter = player:getCharVar("KillCounter_MotherGlobe")
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	
	KillCounter = KillCounter + 1
	
	player:setCharVar("KillCounter_MotherGlobe", KillCounter)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(6900, 7500)) -- 115-125 minutes
end