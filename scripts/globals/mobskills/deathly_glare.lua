---------------------------------------------------
-- Deathly Glare
-- Deals AoE dark elemental damage. Frontal gaze instant KO if unresisted.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getHPP() < 50) then
        return 0
	else
		return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.2
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARKNESS, MOBPARAM_IGNORE_SHADOWS)
	
	if (target:isFacing(mob) and target:isInfront(mob, 90)) then
		if target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) or math.random(0, 99) < target:getMod(tpz.mod.DEATHRES) then
			skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
			-- if (mob:getID() == 17531126 or 17531127 or 17531128) then
				-- mob:PrintToArea(string.format("Akvan: You dare defy me?"), tpz.msg.channel.NS_SAY, tpz.msg.area.SAY)
			-- end
            return 0
		else
			target:setHP(0)
			-- if (mob:getID() == 17531126 or 17531127 or 17531128) then
				-- mob:PrintToArea(string.format("Akvan: I see your death."), tpz.msg.channel.NS_SAY, tpz.msg.area.SAY)
			-- end
		end
	end
	
	return dmg
end