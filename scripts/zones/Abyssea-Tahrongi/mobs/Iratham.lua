-----------------------------------
-- Area: Abyssea - Tahrongi
--   NM: Iratham
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
	mob:setMod(tpz.mod.MOVE, 100)
	mob:setMod(tpz.mod.BINDRES, 100)
	mob:setMod(tpz.mod.GRAVITYRES, 100)
	mob:setMod(tpz.mod.SLEEPRES, 100)
	mob:addMod(tpz.mod.MATT, 111)
	mob:addMod(tpz.mod.REFRESH, 20)
	mob:setMod(tpz.mod.DOUBLE_ATTACK, 65)
	
	mob:addListener("WEAPONSKILL_STATE_EXIT", "MOBSKILL_USED", function(mob, skillID)
		-- local hpp = mob:getHPP()
	
		-- if (hpp <= 50 and mob:getLocalVar("PREVENT_MOBSKILL_SPAM") == 0) then
			-- mob:useMobAbility()
			-- mob:setLocalVar("PREVENT_MOBSKILL_SPAM", os.time())
		-- end
		
		if (skillID == 2571) then
			mob:setLocalVar("MAGIC_SHIELD_REMOVE", math.random(4, 6))
		end
    end)
	
	mob:addListener("TAKE_DAMAGE", "IRATHAM_MAGIC_TAKE", function(mob, damage, caster, attackType, damageType)
		local magicShieldRemove = mob:getLocalVar("MAGIC_SHIELD_REMOVE")
	
		if (attackType == 2 and mob:hasStatusEffect(tpz.effect.MAGIC_SHIELD)) then
			mob:setLocalVar("MAGIC_SHIELD_COUNTER", mob:getLocalVar("MAGIC_SHIELD_COUNTER") + 1)
		end
		
		if (mob:getLocalVar("MAGIC_SHIELD_COUNTER") >= magicShieldRemove) then
			mob:delStatusEffect(tpz.effect.MAGIC_SHIELD)
			mob:setLocalVar("MAGIC_SHIELD_COUNTER", 0)
		end
        -- printf("Iratham.lua LISTENER MAGIC_TAKE  MOB: [%s]  DAMAGE: [%i]  CASTER: [%s]  ATTACKTYPE: [%i]  DAMAGETYPE: [%i]", mob:getName(), damage, caster:getName(), attackType, damageType)
    end)
end

function onMobFight(mob, target)
	local hpp = mob:getHPP()

	if (hpp > 50) then
		mob:setSpellList(153)
	elseif (hpp <= 50) then
		mob:setSpellList(154)
    elseif (hpp <= 20) then
		mob:setSpellList(155)
    end
	
	mob:setMod(tpz.mod.STORETP, 20 + math.floor(utils.clamp(100 - hpp, 0, 75) * 2.4))
	
	-- if (os.time() - mob:getLocalVar("PREVENT_MOBSKILL_SPAM") >= 10) then
		-- mob:setLocalVar("PREVENT_MOBSKILL_SPAM", 0)
	-- end
end

function onMobDeath(mob, player, isKiller)
	mob:removeListener("MOBSKILL_USED")
	mob:removeListener("IRATHAM_MAGIC_TAKE")
    player:addTitle(tpz.title.IRATHAM_CAPTURER)
end