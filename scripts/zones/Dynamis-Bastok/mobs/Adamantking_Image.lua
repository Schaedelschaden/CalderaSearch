-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Adamantking Image
-- Notes: Provide Time Extensions
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

local imageID = {17539142, 17539148, 17539149, 17539253, 17539306}

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.LINK_RADIUS, 6)
	mob:setMobMod(tpz.mobMod.SOUND_RANGE, 6)
end

function onMobDeath(mob, player, isKiller)
    dynamis.timeExtensionOnDeath(mob, player, isKiller)
end