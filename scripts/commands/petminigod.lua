---------------------------------------------------------------------------------------------------
-- func: !petminigod
-- desc: Toggles mini god mode on the player's pet. (Physical and Magical Immunity, High Regen and Refresh)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
	local pet = player:getPet()
    if (pet and pet:getLocalVar("MiniGodMode") == 0) then
        -- Toggle GodMode on..
        pet:setLocalVar("MiniGodMode", 1)

        -- Add bonus effects to the pet
        pet:addStatusEffect(tpz.effect.PHYSICAL_SHIELD,2,0,0)
        pet:addStatusEffect(tpz.effect.MAGIC_SHIELD,2,0,0)
        pet:addStatusEffect(tpz.effect.REGAIN,300,0,0)
        pet:addStatusEffect(tpz.effect.REFRESH,100,0,0)
        pet:addStatusEffect(tpz.effect.REGEN,2000,0,0)
    else
        -- Toggle GodMode off
        pet:setLocalVar("MiniGodMode", 0)

        -- Remove bonus effects
        pet:delStatusEffect(tpz.effect.PHYSICAL_SHIELD)
        pet:delStatusEffect(tpz.effect.MAGIC_SHIELD)
        pet:delStatusEffect(tpz.effect.REGAIN)
        pet:delStatusEffect(tpz.effect.REFRESH)
        pet:delStatusEffect(tpz.effect.REGEN)
    end
end