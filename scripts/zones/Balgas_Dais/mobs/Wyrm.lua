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
	mob:addMod(tpz.mod.PARALYZERES, 50) -- Resistance to Silence
    mob:addMod(tpz.mod.BINDRES, 100) -- Resistance to Bind
    mob:addMod(tpz.mod.SLOWRES, 30) -- Resistance to Slow
    mob:addMod(tpz.mod.SILENCERES, 80) -- Resistance to Silence
    mob:addMod(tpz.mod.SLEEPRES, 100) -- Resistance to Sleep
    mob:addMod(tpz.mod.LULLABYRES, 100) -- Resistance to Lullaby
    mob:setMod(tpz.mod.STUNRES, 100)
	mob:addMod(tpz.mod.EVA, 100)
	mob:addMod(tpz.mod.MEVA, 100)
	mob:addMod(tpz.mod.ATT, 200)
	mob:addMod(tpz.mod.ACC, 200)
	mob:addMod(tpz.mod.DEF, 700)
	mob:setMod(tpz.mod.MATT, 175)
	mob:addMod(tpz.mod.MDEF, 25)
	mob:addMod(tpz.mod.FASTCAST, 50)
	mob:addMod(tpz.mod.REGEN, 100)
	mob:addMod(tpz.mod.REFRESH, 100)
	mob:setMod(tpz.mod.REGAIN, 100)
end

function onAdditionalEffect(mob, target, damage)
	params = {}
	params.power = 100
	params.chance = 100
	
    return tpz.mob.onAddEffect(mob, target, damage, tpz.mob.ae.ENFIRE, params)
end

function onMobEngaged(mob, target)
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

	if mob:AnimationSub() == 1
		then mob:setMobMod(tpz.mobMod.DRAW_IN, 0)
	elseif mob:AnimationSub() == 0
		then mob:setMobMod(tpz.mobMod.DRAW_IN, 1)
	end
		
-- Return the selected spell ID.
function onMonsterMagicPrepare(mob, target)
    -- Suzaku uses     Burn, Fire IV, Firaga III, Flare
    -- Let's give -ga3 a higher distribution than the others.
    local rnd = math.random()

    if rnd < 0.5 then
        return 176 -- firaga 3
    elseif rnd < 0.7 then
        return 147 -- fire 4
    else
        return 204 -- flare
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