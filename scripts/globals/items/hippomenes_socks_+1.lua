-----------------------------------------
-- ID: Hippomenes Socks +1
-- Equip: 27410
-- Latent Effect: "Flee" when taking damage
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target, item, itemCheck, caster)
    if itemCheck == 1 then -- Equip
        target:addListener("TAKE_DAMAGE", "LATENT_FLEE_ON_DAMAGE", function(targetArg, amount, attacker, attackType, damageType)
            local chance   = 10 -- Chance to activate when hit by physical damage
            local activate = math.random(100)

            if attackType == tpz.attackType.PHYSICAL and activate <= chance then
                targetArg:addStatusEffect(tpz.effect.FLEE, 100, 0, 30)
            end
        end)
    end

    if itemCheck == 2 then -- Unequip
        target:removeListener("LATENT_FLEE_ON_DAMAGE")
    end
end
