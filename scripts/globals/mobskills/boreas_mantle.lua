---------------------------------------------
--  Boreas Mantle
--
--  Description: Creates ghostly copies of the user.
--  Type: Magical (Wind)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if
        mob:getID() == 17051655 or
        mob:getID() == 17051661 or
        mob:getID() == 17051667
    then
        local mobID   = mob:getID()
        local targPos = {x = target:getXPos(), y = target:getYPos(), z = target:getZPos(), rot = target:getRotPos()}

        for i = 1, 4 do
            if not GetMobByID(mobID + i):isSpawned() then
                SpawnMob(mob:getID() + i):updateEnmity(target)

                local mirrorImage = GetMobByID(mobID + i)

                mirrorImage:setPos(targPos.x + math.random(1, 6), targPos.y + math.random(1, 6), targPos.z, targPos.rot)
                mirrorImage:setHP(mob:getHP())
                mirrorImage:addStatusEffect(tpz.effect.BLINK, 5, 0, 30)
                -- Wait 30 seconds and despawn adds
                mirrorImage:timer(30000, function(mob)
                    DespawnMob(mob:getID())
                end)
            end
        end
    end
end
