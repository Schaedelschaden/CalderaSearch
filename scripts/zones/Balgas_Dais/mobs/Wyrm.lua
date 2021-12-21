-----------------------------------
-- Area: Balga's Dais
-- Mob: Wyrm
-- KSNM: Early Bird Catches the Wyrm
-- For future reference: Trusts are not allowed in this fight 
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(tpz.mobMod.DRAW_IN, 1) -- has a bug during flight, like Tiamat
    mob:setTP(3000) -- opens fight with a skill
	mob:setMod(tpz.mod.STUNRES, 100)
	mob:setMod(tpz.mod.SILENCERES, 100)
--	mob:addMod(tpz.mod.ADDITIONAL_EFFECT, 1)
	mob:setMod(tpz.mod.DMGPHYS, 20)
	mob:setMod(tpz.mod.STUNRES, 100)
--	mob:addMod(tpz.mod.EVA, 100)
	mob:addMod(tpz.mod.MEVA, 100)
	-- mob:addMod(tpz.mod.MACC, 900)
	mob:addMod(tpz.mod.MATT, 350)
	mob:addMod(tpz.mod.MDEF, 75)
	mob:addMod(tpz.mod.REGEN, 100)
	mob:addMod(tpz.mod.REFRESH, 100)
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 200
	params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE, params)
end

function onMobEngaged(mob, target)
    mob:setMod(tpz.mod.REGAIN, 100) -- very close to the capture by comparing stop watch measures
    mob:setMod(tpz.mod.REGEN, 500) -- might be higher: capture showed no change in HP with Poison II and Bio III procced
end

local function notBusy(mob)
    local action = mob:getCurrentAction()
    if
        action == tpz.act.MOBABILITY_START or
        action == tpz.act.MOBABILITY_USING or
        action == tpz.act.MOBABILITY_FINISH
    then
        return false -- when the Wyrm is in any stage of using a mobskill
    else
        return true
    end
end

function onMobFight(mob, target)

-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
    -- Suzaku uses     Burn, Fire IV, Firaga III, Flare
    -- Let's give -ga3 a higher distribution than the others.
    local rnd = math.random()

    if rnd < 0.5 then
        return 176 -- firaga 3
    elseif rnd < 0.7 then
        return 147 -- fire 4
    elseif rnd < 0.9 then
        return 204 -- flare
    else
        return 235 -- burn
    end
end

    -- Return to ground at 33% HP
    if
        mob:AnimationSub() == 1 and -- is flying
        mob:getHPP() <= 33 and
        notBusy(mob)
    then
        mob:useMobAbility(954)
        -- Touchdown will set the following for us in the skill script:
        -- lifted wings model stance: mob:AnimationSub(2)
        -- reset default attack:      mob:SetMobSkillAttack(0)
        -- reset melee attacks:       mob:delStatusEffect(tpz.effect.TOO_HIGH)
        mob:addStatusEffect(tpz.effect.EVASION_BOOST, 75, 0, 0)
        mob:addStatusEffect(tpz.effect.DEFENSE_BOOST, 75, 0, 0)
        mob:addStatusEffect(tpz.effect.MAGIC_DEF_BOOST, 75, 0, 0)
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 262) -- restore standard ground skill set
        mob:setBehaviour(1024) -- reset behavior to not face target
		mob:setMod(tpz.mod.DMGMAGIC, 0)

    -- Go airborne at 66% HP, gets only called once
    -- TODO: Should move physically to center/origin before taking off; maybe with pathTo()?
    elseif
        mob:getHPP() > 33 and
        mob:getHPP() <= 66 and
        mob:AnimationSub() == 0 and -- is on ground
        notBusy(mob)
    then
        mob:AnimationSub(1) -- flying model stance
        mob:addStatusEffectEx(tpz.effect.TOO_HIGH, 0, 1, 0, 0) -- melee attacks miss now
        mob:SetMobSkillAttack(1146) -- change default attack to ranged fire magic damage
        mob:setMobMod(tpz.mobMod.SKILL_LIST, 1147) -- change skill set to flying moves
        mob:setBehaviour(0) -- face target while flying
		mob:delMod(tpz.mod.DMGMAGIC, -50)
    end
end

function onMobDeath(mob, player, isKiller)
end