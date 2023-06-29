-----------------------------------
-- Area: Full Moon Fountain
--  Mob: Carbuncle Prime
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------


function onMobDeath(mob, player, isKiller)
    player:addSpell(970, true, true)
end
