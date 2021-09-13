-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Vanguard Undertaker
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    -- require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
	mob:setMobMod(tpz.mobMod.LINK_RADIUS, 6)
	mob:setMobMod(tpz.mobMod.SOUND_RANGE, 6)
end

function onMobDeath(mob, player, isKiller)
end
