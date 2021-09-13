-- Amphiptere family mixin

require("scripts/globals/mixins")

g_mixins = g_mixins or {}
g_mixins.families = g_mixins.families or {}

g_mixins.families.amphiptere = function(mob)
    mob:addListener("ROAM_TICK", "AMPHIPTERE_ROAM", function(mob)
        mob:hideName(true)
        mob:untargetable(true)
        mob:AnimationSub(1)
    end)
    mob:addListener("ENGAGE", "AMPHIPTERE_ENGAGE", function(mob, target)
        mob:hideName(false)
        mob:untargetable(false)
        mob:AnimationSub(0)
    end)
    mob:addListener("DISENGAGE", "AMPHIPTERE_DISENGAGE", function(mob, target)
        mob:hideName(true)
        mob:untargetable(true)
        mob:AnimationSub(1)
    end)
	mob:addListener("COMBAT_TICK", "AMPHIPTERE_REAVINGWIND_END", function(mob, target)
        if (os.time() - mob:getLocalVar("Amphiptere_ReavingWind") > 60) then
			mob:setMod(tpz.mod.WIND_ABSORB, 0)
			mob:AnimationSub(0)
		end
    end)
end

return g_mixins.families.amphiptere
