-----------------------------------
-- Area: Al'Taieu
--   NM: Jailer of Prudence
-- AnimationSubs: 0 - Normal, 3 - Mouth Open
-----------------------------------
local ID = require("scripts/zones/AlTaieu/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(tpz.mobMod.NO_DROPS, 1)
end

function onMobSpawn(mob)
    tpz.mix.jobSpecial.config(mob, {
        specials =
        {
            {
                id = tpz.jsa.PERFECT_DODGE,
                cooldown = 120, -- "Both can use Perfect Dodge multiple times, and will do so almost incessantly." (guessing a 2 minute cooldown)
                hpp = 95,
                endCode = function(mob)
                    mob:addStatusEffectEx(tpz.effect.FLEE, 0, 100, 0, 30) -- "Jailer of Prudence will however gain Flee speed during Perfect Dodge."
                end,
            },
        },
    })

    mob:AnimationSub(0); -- Mouth closed
    mob:addStatusEffectEx(tpz.effect.FLEE,0,100,0,60);
    mob:setMod(tpz.mod.TRIPLE_ATTACK, 20);
    mob:addMod(tpz.mod.PARALYZERES, 30)
    mob:addMod(tpz.mod.STUNRES, 30)
    mob:addMod(tpz.mod.BINDRES, 30)
    mob:addMod(tpz.mod.SLOWRES, 30)
    mob:addMod(tpz.mod.SILENCERES, 30)
    mob:addMod(tpz.mod.SLEEPRES, 30)
    mob:addMod(tpz.mod.LULLABYRES, 30)
    mob:addMod(tpz.mod.PETRIFYRES, 30)
    mob:addMod(tpz.mod.POISONRES, 30)
	mob:addMod(tpz.mod.ATT, 250)
	mob:addMod(tpz.mod.EVA, 175)
	mob:addMod(tpz.mod.DEF, 275)
	mob:addMod(tpz.mod.MEVA, 200)
	mob:addMod(tpz.mod.MDEF, 50)
	mob:addMod(tpz.mod.STR, 110)
    mob:addMod(tpz.mod.DEX, 110)
    mob:addMod(tpz.mod.AGI, 110)
    mob:addMod(tpz.mod.VIT, 110)
    mob:addMod(tpz.mod.MND, 110)
    mob:addMod(tpz.mod.CHR, 110)
    mob:addMod(tpz.mod.INT, 110)
end

function onMobDisEngage(mob, target)
end

--[[ onMobskill -- When this functionlity is added, this should work.
function onUseAbility(mob,target,ability)
    local mobId = mob:getID()
    local pOne = GetMobByID(ID.mob.WARDER_OF_PRUDENCE_1)
    local pTwo = GetMobByID(ID.mob.WARDER_OF_PRUDENCE_2)
    local pOneAct = pOne:getCurrentAction()
    local pTwoAct = pTwo:getCurrentAction()

    if ability:getID() == 437 then -- Perfect Dodge
        mob:addStatusEffectEx(tpz.effect.FLEE,0,100,0,30)
    elseif mobId == ID.mob.WARDER_OF_PRUDENCE_1 and pTwoAct > 0 and pTwoAct ~= tpz.act.SLEEP and pTwoAct ~= tpz.act.STUN and pTwo:checkDistance(mob) <= 10 then
        pTwo:useMobAbility(ability:getID())
    elseif mobId == ID.mob.WARDER_OF_PRUDENCE_2 and pOneAct > 0 and pOneAct ~= tpz.act.SLEEP and pOneAct ~= tpz.act.STUN and pOne:checkDistance(mob) <= 10 then
        pOne:useMobAbility(ability:getID())
    end
end
--]]

function onMobDeath(mob, player, isKiller)
	local firstPrudence     = GetMobByID(ID.mob.WARDER_OF_PRUDENCE_1)
    local secondPrudence    = GetMobByID(ID.mob.WARDER_OF_PRUDENCE_2)
    if (mob:getID() == ID.mob.WARDER_OF_PRUDENCE_1) then
        secondPrudence:setMobMod(tpz.mobMod.NO_DROPS, 0)
        secondPrudence:AnimationSub(3); -- Mouth Open
        secondPrudence:addMod(tpz.mod.ATTP, 100)
        secondPrudence:delMod(tpz.mod.DEFP, -50)
    else
        firstPrudence:setMobMod(tpz.mobMod.NO_DROPS, 0)
        firstPrudence:AnimationSub(3); -- Mouth Open
        firstPrudence:addMod(tpz.mod.ATTP, 100)
        firstPrudence:delMod(tpz.mod.DEFP, -50)
    end

	local KillCounter = player:getCharVar("KillCounter_WardOfPrud")
	local playerName = player:getName()
	local mobName = mob:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")

	if (firstPrudence:isDead() and secondPrudence:isDead()) then
		KillCounter = KillCounter + 1

		player:setCharVar("KillCounter_WardOfPrud", KillCounter)
		player:PrintToPlayer(string.format("Lifetime << %s >> kills: %i", fixedMobName, KillCounter), tpz.msg.channel.NS_LINKSHELL3)
	end
end

function onMobDespawn(mob)
end