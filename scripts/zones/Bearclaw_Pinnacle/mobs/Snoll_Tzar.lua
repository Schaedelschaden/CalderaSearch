-----------------------------------
-- Area: Bearclaw Pinnacle
--  Mob: Snoll Tzar
-----------------------------------
function onMobSpawn(mob)
    -- Phase 0 sets start conditions at base anim sub and magic base
    mob:AnimationSub(0)
    mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:addMod(tpz.mod.ICE_ABSORB, 100)
	mob:addMod(tpz.mod.ICE_NULL, 100)
    mob:addMod(tpz.mod.DOUBLE_ATTACK, 20)
	mob:addMod(tpz.mod.TRIPLE_ATTACK, 8)
    mob:addMod(tpz.mod.SILENCERES, 35)
    mob:addMod(tpz.mod.STUNRES, 35)
    mob:addMod(tpz.mod.BINDRES, 35)
    mob:addMod(tpz.mod.SLOWRES, 35)
    mob:addMod(tpz.mod.ATT, 900)
    mob:addMod(tpz.mod.MACC, 100)
    mob:addMod(tpz.mod.REGEN, 100)
    mob:addMod(tpz.mod.REGAIN, 5)
    mob:setMobMod(tpz.mobMod.AUTO_SPIKES, 1)
	mob:addStatusEffect(tpz.effect.ICE_SPIKES, 50, 0, 0)
    mob:getStatusEffect(tpz.effect.ICE_SPIKES):setFlag(tpz.effectFlag.DEATH)
end

function onMobFight(mob, target)
    -- Only check onMobFight every 2 seconds to reduce LUA resource demand
    if os.time() > mob:getLocalVar("MOB_FIGHT_DELAY") then
        local boom = mob:getLocalVar("HypoBoom")

        -- Phase 1 will commence when he reaches the 75% threshold, increasing size and damage multipliers
        if mob:getHPP() <= 75 and mob:AnimationSub() == 0 then
            -- tzarLevelUp(mob, target, animation, strBonus, attBonus, regenBonus, regainBonus)
            tzarLevelUp(mob, target, 1, 50, 50, 100, 5)
        end

        -- Phase 2 will commence when he reaches the 50% threshold, increasing size and damage multiplier
        if mob:getHPP() <= 50 and mob:AnimationSub() == 1 then
            tzarLevelUp(mob, target, 2, 50, 100, 100, 10)
        end

        -- Phase 3 will commence when he reaches the 25% threshold, increasing size and damage multiplier
        if mob:getHPP() <= 25 and mob:AnimationSub() == 2 then
            tzarLevelUp(mob, target, 3, 50, 50, 100, 20)
        end

        -- Special
        if
            mob:getHPP() <= 20 and
            mob:AnimationSub() == 3 and
            boom == 0
        then
            mob:useMobAbility(1644)
            mob:resetEnmity(target)
            mob:setLocalVar("HypoBoom", 1)
        end

        mob:setLocalVar("MOB_FIGHT_DELAY", os.time() + 2)
    end
end

function onAdditionalEffect(mob, target, damage)
    params = {}
        params.power  = 75
        params.chance = 100

    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENBLIZZARD)
end

function onMobDespawn(mob)
end

function onMobDeath(mob, player, isKiller)
    local playerName   = player:getName()
	local mobName      = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
	local KillCounter  = player:getCharVar("KillCounter_"..fixedMobName)

	KillCounter = KillCounter + 1

	player:setCharVar("KillCounter_"..fixedMobName, KillCounter + 1)
	player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
end

function tzarLevelUp(mob, target, animation, strBonus, attBonus, regenBonus, regainBonus)
    -- Make him fancy, use the Berserk animation
    if target:getObjType() == tpz.objType.PC then
        target:injectActionPacket(11, 1598, 0, 0, 0)
    elseif
        target:getObjType() == tpz.objType.TRUST or
        target:getObjType() == tpz.objType.PET
    then
        local master = target:getMaster()

        master:injectActionPacket(11, 1598, 0, 0, 0)
    end

    -- Make him stronger
    mob:addMod(tpz.mod.STR, strBonus)
    mob:addMod(tpz.mod.ATT, attBonus)
    mob:addMod(tpz.mod.REGEN, regenBonus)
    mob:addMod(tpz.mod.REGAIN, regainBonus)

    -- Reset enmity and "upgrade" animation
    mob:resetEnmity(target)
    mob:AnimationSub(animation)
end
