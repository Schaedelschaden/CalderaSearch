---------------------------------------------------
-- Flame Breath
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/ability")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(pet, target, skill, action)
    local master = pet:getMaster()
    ---------- Deep Breathing ----------
    -- 0 for none
    -- 1 for first merit
    -- 0.25 for each merit after the first
    -- TODO: 0.1 per merit for augmented AF2 (10663 *w/ augment*)
    local deep = 1
    if (pet:hasStatusEffect(tpz.effect.MAGIC_ATK_BOOST) == true) then
        deep = deep + 1 + (master:getMerit(tpz.merit.DEEP_BREATHING) - 1) * 0.25
        pet:delStatusEffect(tpz.effect.MAGIC_ATK_BOOST)
    end

    local gear = 1 + (master:getMod(tpz.mod.WYVERN_BREATH)/256) + (pet:getMod(tpz.mod.PET_BREATH) / 100) -- Gear that enhances breath

    local dmgmod = MobBreathMove(pet, target, 0.185, pet:getMainLvl() * 15, tpz.magic.ele.FIRE) -- Works out to (hp/6) + 15, as desired
    dmgmod = (dmgmod * gear) * deep
    pet:setTP(0)

    local dmg = AbilityFinalAdjustments(dmgmod,pet,skill,target,tpz.attackType.BREATH,tpz.damageType.FIRE,MOBPARAM_IGNORE_SHADOWS)
	
	local petLvl = pet:getMainLvl()
	
	-- Retail breath damage calc is underwhelming, juice it up!
	if (petLvl <= 75) then
		dmg = dmg * 2
	elseif (petLvl > 75 and petLvl <= 90) then
		dmg = dmg * 2.5
	elseif (petLvl > 90 and petLvl <= 100) then
		dmg = dmg * 3
	elseif (petLvl > 100 and petLvl <= 110) then
		dmg = dmg * 3.5
	elseif (petLvl > 110 and petLvl <= 119) then
		dmg = dmg * 4
	end
	
    target:takeDamage(dmg, pet, tpz.attackType.BREATH, tpz.damageType.FIRE)
	
    return dmg
end