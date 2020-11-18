---------------------------------------------------
-- Eagle Eye Shot
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0,0
end

function onPetAbility(target, automaton, skill, master, action)	
    local params = {
        numHits = 1,
        atkmulti = 1.5,
        ftp100 = 5.0,
        ftp200 = 5.0,
        ftp300 = 5.0,
        acc100 = 0.0,
        acc200 = 0.0,
        acc300 = 0.0,
        str_wsc = 0.0,
        dex_wsc = 0.0,
        vit_wsc = 0.0,
        agi_wsc = 1.0,
        int_wsc = 0.0,
        mnd_wsc = 0.0,
        chr_wsc = 0.0
    }

    local damage = doAutoRangedWeaponskill(automaton, target, 0, params, 1000, true, skill, action)
	
	automaton:delStatusEffectSilent(tpz.effect.HEADY_ARTIFICE)

    return damage
end