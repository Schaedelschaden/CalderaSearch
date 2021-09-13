-- Empty family mixin
-- mixins = {require("scripts/mixins/families/empty")}

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.empty = function(mob)
    mob:addListener("SPAWN", "EMPTY_SPAWN", function(mob)
        local element = math.random(1, 8)
		mob:setLocalVar("EMPTY_ELEMENT", element)
		
		if (element == 1) then -- Fire
			mob:AnimationSub(2)
			mob:setMod(tpz.mod.FIRE_ABSORB, 100)
		elseif (element == 2) then -- Ice
			mob:AnimationSub(1)
			mob:setMod(tpz.mod.ICE_ABSORB, 100)
		elseif (element == 3) then -- Wind
			mob:AnimationSub(2)
			mob:setMod(tpz.mod.WIND_ABSORB, 100)
		elseif (element == 4) then -- Earth
			mob:AnimationSub(1)
			mob:setMod(tpz.mod.EARTH_ABSORB, 100)
		elseif (element == 5) then -- Lightning
			mob:AnimationSub(2)
			mob:setMod(tpz.mod.LTNG_ABSORB, 100)
		elseif (element == 6) then -- Water
			mob:AnimationSub(1)
			mob:setMod(tpz.mod.WATER_ABSORB, 100)
		elseif (element == 7) then -- Light
			mob:AnimationSub(2)
			mob:setMod(tpz.mod.LIGHT_ABSORB, 100)
		elseif (element == 8) then -- Dark
			mob:AnimationSub(1)
			mob:setMod(tpz.mod.DARK_ABSORB, 100)
		end
    end)
end

return g_mixins.families.empty