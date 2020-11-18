-----------------------------------
-- Attachment: Resister II
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.SLEEPRES, 'resister_ii_sleep_res', 0)
	updateModPerformance(pet, tpz.mod.POISONRES, 'resister_ii_poison_res', 0)
	updateModPerformance(pet, tpz.mod.PARALYZERES, 'resister_ii_paralyze_res', 0)
	updateModPerformance(pet, tpz.mod.BLINDRES, 'resister_ii_blind_res', 0)
	updateModPerformance(pet, tpz.mod.SILENCERES, 'resister_ii_silence_res', 0)
	updateModPerformance(pet, tpz.mod.VIRUSRES, 'resister_ii_virus_res', 0)
	updateModPerformance(pet, tpz.mod.PETRIFYRES, 'resister_ii_petrify_res', 0)
	updateModPerformance(pet, tpz.mod.BINDRES, 'resister_ii_bind_res', 0)
	updateModPerformance(pet, tpz.mod.CURSERES, 'resister_ii_curse_res', 0)
	updateModPerformance(pet, tpz.mod.GRAVITYRES, 'resister_ii_gravity_res', 0)
	updateModPerformance(pet, tpz.mod.SLOWRES, 'resister_ii_slow_res', 0)
	updateModPerformance(pet, tpz.mod.STUNRES, 'resister_ii_stun_res', 0)
	updateModPerformance(pet, tpz.mod.AMNESIARES, 'resister_ii_amnesia_res', 0)
	updateModPerformance(pet, tpz.mod.LULLABYRES, 'resister_ii_lullaby_res', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.SLEEPRES, 'resister_ii_sleep_res', 10)
		updateModPerformance(pet, tpz.mod.POISONRES, 'resister_ii_poison_res', 10)
		updateModPerformance(pet, tpz.mod.PARALYZERES, 'resister_ii_paralyze_res', 10)
		updateModPerformance(pet, tpz.mod.BLINDRES, 'resister_ii_blind_res', 10)
		updateModPerformance(pet, tpz.mod.SILENCERES, 'resister_ii_silence_res', 10)
		updateModPerformance(pet, tpz.mod.VIRUSRES, 'resister_ii_virus_res', 10)
		updateModPerformance(pet, tpz.mod.PETRIFYRES, 'resister_ii_petrify_res', 10)
		updateModPerformance(pet, tpz.mod.BINDRES, 'resister_ii_bind_res', 10)
		updateModPerformance(pet, tpz.mod.CURSERES, 'resister_ii_curse_res', 10)
		updateModPerformance(pet, tpz.mod.GRAVITYRES, 'resister_ii_gravity_res', 10)
		updateModPerformance(pet, tpz.mod.SLOWRES, 'resister_ii_slow_res', 10)
		updateModPerformance(pet, tpz.mod.STUNRES, 'resister_ii_stun_res', 10)
		updateModPerformance(pet, tpz.mod.AMNESIARES, 'resister_ii_amnesia_res', 10)
		updateModPerformance(pet, tpz.mod.LULLABYRES, 'resister_ii_lullaby_res', 10)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.SLEEPRES, 'resister_ii_sleep_res', 20)
		updateModPerformance(pet, tpz.mod.POISONRES, 'resister_ii_poison_res', 20)
		updateModPerformance(pet, tpz.mod.PARALYZERES, 'resister_ii_paralyze_res', 20)
		updateModPerformance(pet, tpz.mod.BLINDRES, 'resister_ii_blind_res', 20)
		updateModPerformance(pet, tpz.mod.SILENCERES, 'resister_ii_silence_res', 20)
		updateModPerformance(pet, tpz.mod.VIRUSRES, 'resister_ii_virus_res', 20)
		updateModPerformance(pet, tpz.mod.PETRIFYRES, 'resister_ii_petrify_res', 20)
		updateModPerformance(pet, tpz.mod.BINDRES, 'resister_ii_bind_res', 20)
		updateModPerformance(pet, tpz.mod.CURSERES, 'resister_ii_curse_res', 20)
		updateModPerformance(pet, tpz.mod.GRAVITYRES, 'resister_ii_gravity_res', 20)
		updateModPerformance(pet, tpz.mod.SLOWRES, 'resister_ii_slow_res', 20)
		updateModPerformance(pet, tpz.mod.STUNRES, 'resister_ii_stun_res', 20)
		updateModPerformance(pet, tpz.mod.AMNESIARES, 'resister_ii_amnesia_res', 20)
		updateModPerformance(pet, tpz.mod.LULLABYRES, 'resister_ii_lullaby_res', 20)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.SLEEPRES, 'resister_ii_sleep_res', 40)
		updateModPerformance(pet, tpz.mod.POISONRES, 'resister_ii_poison_res', 40)
		updateModPerformance(pet, tpz.mod.PARALYZERES, 'resister_ii_paralyze_res', 40)
		updateModPerformance(pet, tpz.mod.BLINDRES, 'resister_ii_blind_res', 40)
		updateModPerformance(pet, tpz.mod.SILENCERES, 'resister_ii_silence_res', 40)
		updateModPerformance(pet, tpz.mod.VIRUSRES, 'resister_ii_virus_res', 40)
		updateModPerformance(pet, tpz.mod.PETRIFYRES, 'resister_ii_petrify_res', 40)
		updateModPerformance(pet, tpz.mod.BINDRES, 'resister_ii_bind_res', 40)
		updateModPerformance(pet, tpz.mod.CURSERES, 'resister_ii_curse_res', 40)
		updateModPerformance(pet, tpz.mod.GRAVITYRES, 'resister_ii_gravity_res', 40)
		updateModPerformance(pet, tpz.mod.SLOWRES, 'resister_ii_slow_res', 40)
		updateModPerformance(pet, tpz.mod.STUNRES, 'resister_ii_stun_res', 40)
		updateModPerformance(pet, tpz.mod.AMNESIARES, 'resister_ii_amnesia_res', 40)
		updateModPerformance(pet, tpz.mod.LULLABYRES, 'resister_ii_lullaby_res', 40)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.SLEEPRES, 'resister_ii_sleep_res', 60)
		updateModPerformance(pet, tpz.mod.POISONRES, 'resister_ii_poison_res', 60)
		updateModPerformance(pet, tpz.mod.PARALYZERES, 'resister_ii_paralyze_res', 60)
		updateModPerformance(pet, tpz.mod.BLINDRES, 'resister_ii_blind_res', 60)
		updateModPerformance(pet, tpz.mod.SILENCERES, 'resister_ii_silence_res', 60)
		updateModPerformance(pet, tpz.mod.VIRUSRES, 'resister_ii_virus_res', 60)
		updateModPerformance(pet, tpz.mod.PETRIFYRES, 'resister_ii_petrify_res', 60)
		updateModPerformance(pet, tpz.mod.BINDRES, 'resister_ii_bind_res', 60)
		updateModPerformance(pet, tpz.mod.CURSERES, 'resister_ii_curse_res', 60)
		updateModPerformance(pet, tpz.mod.GRAVITYRES, 'resister_ii_gravity_res', 60)
		updateModPerformance(pet, tpz.mod.SLOWRES, 'resister_ii_slow_res', 60)
		updateModPerformance(pet, tpz.mod.STUNRES, 'resister_ii_stun_res', 60)
		updateModPerformance(pet, tpz.mod.AMNESIARES, 'resister_ii_amnesia_res', 60)
		updateModPerformance(pet, tpz.mod.LULLABYRES, 'resister_ii_lullaby_res', 60)
    end
end