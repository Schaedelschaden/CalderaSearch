---------------------------------------------------
-- Death Prophet
-- Deals dark elemental damage. Instant KO if unresisted.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getLocalVar("DeathProphet") == 1) then
		mob:setLocalVar("DeathProphet", 0)
        return 0
	else
		return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARKNESS, MOBPARAM_IGNORE_SHADOWS)
	
    if target:hasStatusEffect(tpz.effect.MAGIC_SHIELD) or math.random(0, 99) < target:getMod(tpz.mod.DEATHRES) then
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
		-- if (mob:getID() == 17293648 or 17293649) then
			-- target:PrintToArea(string.format("Kaggen: THE INSOLENCE!"), tpz.msg.channel.NS_SAY, tpz.msg.area.SAY)
		-- end
	else
		target:setHP(0)
		-- if (mob:getID() == 17293648 or 17293649) then
			-- target:PrintToArea(string.format("Kaggen: Pathetic."), tpz.msg.channel.NS_SAY, tpz.msg.area.SAY)
		-- end
    end	
	
	return dmg
end