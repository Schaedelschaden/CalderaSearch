-----------------------------------------
-- ID: 20999
-- Item: Habukatana
-- Additional Effect: Stun
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 5
	
	if (VanadielDayOfTheWeek() == tpz.day.LIGHTNINGDAY) then
        chance = chance + 6
    end

    if (player:getWeather() == WEATHER_THUNDER) then
        chance = chance + 4
    elseif (player:getWeather() == tpz.weather.THUNDERSTORMS) then
        chance = chance + 6
    end

    if math.random(100) <= chance and applyResistanceAddEffect(player, target, tpz.magic.ele.LIGHTNING, 0) > 0.5 then
        target:addStatusEffect(tpz.effect.STUN, 1, 0, math.random(2,4))
        return tpz.subEffect.STUN, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.STUN
    end

    return 0, 0, 0
end