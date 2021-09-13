-----------------------------------
-- Ability: Ready
-- Commands the pet to make a special attack. 
-- Obtained: Beastmaster Level 25
-- Recast Time: 00:30 (per charge (base))
-- Duration: N/A
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	printf("ready.lua onAbilityCheck")
    -- if (player:getPet() == nil) then
        -- return tpz.msg.basic.REQUIRES_A_PET, 0
    -- else
        -- if (player:getPet():getHP() == 0) then
            -- return tpz.msg.basic.UNABLE_TO_USE_JA, 0
        -- elseif (player:getPet():getTarget() == nil) then
            -- return tpz.msg.basic.PET_CANNOT_DO_ACTION, 0
        -- elseif (not player:getPet():hasTPMoves()) then
            -- return tpz.msg.basic.UNABLE_TO_USE_JA, 0
        -- else
            -- return 0,0
        -- end
    -- end
end

-- function onUseAbility(player, target, ability)
	-- printf("ready.lua onUseAbility")
    -- local function doSic(mob)
        -- if mob:getTP() >= 1000 then
			-- printf("ready.lua doSic TP >= 1000")
            -- mob:useMobAbility()
        -- elseif mob:hasSpellList() then
			-- printf("ready.lua doSic CAST SPELL")
            -- mob:castSpell()
        -- else
            -- mob:queue(0, doSic)
        -- end

    -- end
	
	-- if player:hasStatusEffect(tpz.effect.UNLEASH) then
        -- ability:setRecast(utils.clamp(0, 0, 0))
	-- end

    -- player:getPet():queue(0, doSic)
-- end