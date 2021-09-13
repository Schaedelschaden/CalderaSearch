---------------------------------------------
-- Healing Breath IV
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(pet, target, skill, action)

   -- Info:
   -- Breath Formula: http://www.bluegartr.com/threads/108543-Wyvern-Breath-Testing?p=5357018&viewfull=1#post5357018

   -- TODO:
   -- Wyvern Exp Bonus is +6% HP per 200 exp gained until 1,000 exp cap, granting a max 30% (0.3 works in the formula)
      -- Exp bonus wears off at zone, dismiss, etc, and shouldn't be handled here, as it also adds to other stats.
   -- Wyvern HP or HP% gear has no effect (Not handled here)

   ---------- Deep Breathing ----------
   -- 0 for none
   -- 50 for first merit
   -- 5 for each merit after the first
   -- TODO: 5 per merit for augmented AF2 (10663 *w/ augment*)
    local master = pet:getMaster()
    local deep = 0
	if (pet:hasStatusEffect(tpz.effect.MAGIC_ATK_BOOST) == true) then
		deep = 50 + (master:getMerit(tpz.merit.DEEP_BREATHING)-1)*5
		pet:delStatusEffect(tpz.effect.MAGIC_ATK_BOOST)
	end

    local gear = (master:getMod(tpz.mod.WYVERN_BREATH)/256) + (pet:getMod(tpz.mod.PET_BREATH) / 100) -- Gear that enhances breath

    local tp = math.floor(pet:getTP()/200)/1.165 -- HP only increases for every 20% TP
	pet:setTP(0)

    local base = math.floor(((53+tp+gear+deep)/256)*(pet:getMaxHP())+42)
	if (target:getHP()+base > target:getMaxHP()) then
		base = target:getMaxHP() - target:getHP() --cap it
	end
	skill:setMsg(tpz.msg.basic.JA_RECOVERS_HP)
	
   -- Curse II prevents restoring HP
	if not (target:hasStatusEffect(20)) then
		target:addHP(base)
	else
		base = 0
	end
	
	return base
end