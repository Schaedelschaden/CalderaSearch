-- Puk family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.puk = function(mob)
	mob:addListener("TAKE_DAMAGE", "ELEMENT_DAMAGE_TP", function(target, amount, attacker, attackType, damageType)
		local dayElement = VanadielDayElement()
		
		-- Day - Fire: 1 Ice: 2 Wind: 3 Earth: 4 Thunder: 5 Water: 6 Light: 7 Dark: 8
		-- Damage Type - Fire: 6 Ice: 7 Wind: 8 Earth: 9 Thunder: 10 Water: 11 Light: 12 Dark: 13
		if (damageType - 5 == dayElement) then
			target:addTP(1000)
		end
	end)

return g_mixins.families.puk