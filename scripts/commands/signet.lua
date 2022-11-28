--------------------------------------------------------------
-- func: !signt
-- auth: Barthandalus
-- desc: Gives the player Signet/Sanction/Sigil/Ionis.
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    if
        -- ToAU Areas
        player:getCurrentRegion() >= 28 and
        player:getCurrentRegion() <= 32
    then
        player:delStatusEffect(tpz.effect.SIGNET)
        player:delStatusEffect(tpz.effect.SANCTION)
        player:delStatusEffect(tpz.effect.SIGIL)
        player:delStatusEffect(tpz.effect.IONIS)
        player:injectActionPacket(6, 254)
        player:addStatusEffect(tpz.effect.SANCTION, 1, 0, 28800) -- Adds Sanction, normal strength, 0 tick, 8 hours

    elseif
        -- WotG Areas
        player:getCurrentRegion() >= 33 and
        player:getCurrentRegion() <= 40
    then
        player:delStatusEffect(tpz.effect.SIGNET)
        player:delStatusEffect(tpz.effect.SANCTION)
        player:delStatusEffect(tpz.effect.SIGIL)
        player:delStatusEffect(tpz.effect.IONIS)
        player:injectActionPacket(6, 254)
        player:addStatusEffect(tpz.effect.SIGIL, 1, 0, 28800) -- Adds Sigil, normal strength, 0 tick, 8 hours

    elseif
        -- SoA Areas
        player:getCurrentRegion() >= 44 and
        player:getCurrentRegion() <= 45
    then
        player:delStatusEffect(tpz.effect.SIGNET)
        player:delStatusEffect(tpz.effect.SANCTION)
        player:delStatusEffect(tpz.effect.SIGIL)
        player:delStatusEffect(tpz.effect.IONIS)
        player:injectActionPacket(6, 254)
        player:addStatusEffect(tpz.effect.IONIS, 1, 0, 28800) -- Adds Ionis, normal strength, 0 tick, 8 hours

    else
        -- RoZ/CoP Areas
        player:delStatusEffect(tpz.effect.SIGNET)
        player:delStatusEffect(tpz.effect.SANCTION)
        player:delStatusEffect(tpz.effect.SIGIL)
        player:delStatusEffect(tpz.effect.IONIS)
        player:injectActionPacket(6, 254)
        player:addStatusEffect(tpz.effect.SIGNET, 1, 0, 28800) -- Adds Signet, normal strength, 0 tick, 8 hours
    end
end
