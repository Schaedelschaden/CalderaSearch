-----------------------------------
-- Attachment: Resister
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.SLEEPRES, 'resister_sleep_res', 0)
	updateModPerformance(pet, tpz.mod.POISONRES, 'resister_poison_res', 0)
	updateModPerformance(pet, tpz.mod.PARALYZERES, 'resister_paralyze_res', 0)
	updateModPerformance(pet, tpz.mod.BLINDRES, 'resister_blind_res', 0)
	updateModPerformance(pet, tpz.mod.SILENCERES, 'resister_silence_res', 0)
	updateModPerformance(pet, tpz.mod.VIRUSRES, 'resister_virus_res', 0)
	updateModPerformance(pet, tpz.mod.PETRIFYRES, 'resister_petrify_res', 0)
	updateModPerformance(pet, tpz.mod.BINDRES, 'resister_bind_res', 0)
	updateModPerformance(pet, tpz.mod.CURSERES, 'resister_curse_res', 0)
	updateModPerformance(pet, tpz.mod.GRAVITYRES, 'resister_gravity_res', 0)
	updateModPerformance(pet, tpz.mod.SLOWRES, 'resister_slow_res', 0)
	updateModPerformance(pet, tpz.mod.STUNRES, 'resister_stun_res', 0)
	updateModPerformance(pet, tpz.mod.AMNESIARES, 'resister_amnesia_res', 0)
	updateModPerformance(pet, tpz.mod.LULLABYRES, 'resister_lullaby_res', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.SLEEPRES, 'resister_sleep_res', 5)
		updateModPerformance(pet, tpz.mod.POISONRES, 'resister_poison_res', 5)
		updateModPerformance(pet, tpz.mod.PARALYZERES, 'resister_paralyze_res', 5)
		updateModPerformance(pet, tpz.mod.BLINDRES, 'resister_blind_res', 5)
		updateModPerformance(pet, tpz.mod.SILENCERES, 'resister_silence_res', 5)
		updateModPerformance(pet, tpz.mod.VIRUSRES, 'resister_virus_res', 5)
		updateModPerformance(pet, tpz.mod.PETRIFYRES, 'resister_petrify_res', 5)
		updateModPerformance(pet, tpz.mod.BINDRES, 'resister_bind_res', 5)
		updateModPerformance(pet, tpz.mod.CURSERES, 'resister_curse_res', 5)
		updateModPerformance(pet, tpz.mod.GRAVITYRES, 'resister_gravity_res', 5)
		updateModPerformance(pet, tpz.mod.SLOWRES, 'resister_slow_res', 5)
		updateModPerformance(pet, tpz.mod.STUNRES, 'resister_stun_res', 5)
		updateModPerformance(pet, tpz.mod.AMNESIARES, 'resister_amnesia_res', 5)
		updateModPerformance(pet, tpz.mod.LULLABYRES, 'resister_lullaby_res', 5)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.SLEEPRES, 'resister_sleep_res', 10)
		updateModPerformance(pet, tpz.mod.POISONRES, 'resister_poison_res', 10)
		updateModPerformance(pet, tpz.mod.PARALYZERES, 'resister_paralyze_res', 10)
		updateModPerformance(pet, tpz.mod.BLINDRES, 'resister_blind_res', 10)
		updateModPerformance(pet, tpz.mod.SILENCERES, 'resister_silence_res', 10)
		updateModPerformance(pet, tpz.mod.VIRUSRES, 'resister_virus_res', 10)
		updateModPerformance(pet, tpz.mod.PETRIFYRES, 'resister_petrify_res', 10)
		updateModPerformance(pet, tpz.mod.BINDRES, 'resister_bind_res', 10)
		updateModPerformance(pet, tpz.mod.CURSERES, 'resister_curse_res', 10)
		updateModPerformance(pet, tpz.mod.GRAVITYRES, 'resister_gravity_res', 10)
		updateModPerformance(pet, tpz.mod.SLOWRES, 'resister_slow_res', 10)
		updateModPerformance(pet, tpz.mod.STUNRES, 'resister_stun_res', 10)
		updateModPerformance(pet, tpz.mod.AMNESIARES, 'resister_amnesia_res', 10)
		updateModPerformance(pet, tpz.mod.LULLABYRES, 'resister_lullaby_res', 10)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.SLEEPRES, 'resister_sleep_res', 20)
		updateModPerformance(pet, tpz.mod.POISONRES, 'resister_poison_res', 20)
		updateModPerformance(pet, tpz.mod.PARALYZERES, 'resister_paralyze_res', 20)
		updateModPerformance(pet, tpz.mod.BLINDRES, 'resister_blind_res', 20)
		updateModPerformance(pet, tpz.mod.SILENCERES, 'resister_silence_res', 20)
		updateModPerformance(pet, tpz.mod.VIRUSRES, 'resister_virus_res', 20)
		updateModPerformance(pet, tpz.mod.PETRIFYRES, 'resister_petrify_res', 20)
		updateModPerformance(pet, tpz.mod.BINDRES, 'resister_bind_res', 20)
		updateModPerformance(pet, tpz.mod.CURSERES, 'resister_curse_res', 20)
		updateModPerformance(pet, tpz.mod.GRAVITYRES, 'resister_gravity_res', 20)
		updateModPerformance(pet, tpz.mod.SLOWRES, 'resister_slow_res', 20)
		updateModPerformance(pet, tpz.mod.STUNRES, 'resister_stun_res', 20)
		updateModPerformance(pet, tpz.mod.AMNESIARES, 'resister_amnesia_res', 20)
		updateModPerformance(pet, tpz.mod.LULLABYRES, 'resister_lullaby_res', 20)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.SLEEPRES, 'resister_sleep_res', 30)
		updateModPerformance(pet, tpz.mod.POISONRES, 'resister_poison_res', 30)
		updateModPerformance(pet, tpz.mod.PARALYZERES, 'resister_paralyze_res', 30)
		updateModPerformance(pet, tpz.mod.BLINDRES, 'resister_blind_res', 30)
		updateModPerformance(pet, tpz.mod.SILENCERES, 'resister_silence_res', 30)
		updateModPerformance(pet, tpz.mod.VIRUSRES, 'resister_virus_res', 30)
		updateModPerformance(pet, tpz.mod.PETRIFYRES, 'resister_petrify_res', 30)
		updateModPerformance(pet, tpz.mod.BINDRES, 'resister_bind_res', 30)
		updateModPerformance(pet, tpz.mod.CURSERES, 'resister_curse_res', 30)
		updateModPerformance(pet, tpz.mod.GRAVITYRES, 'resister_gravity_res', 30)
		updateModPerformance(pet, tpz.mod.SLOWRES, 'resister_slow_res', 30)
		updateModPerformance(pet, tpz.mod.STUNRES, 'resister_stun_res', 30)
		updateModPerformance(pet, tpz.mod.AMNESIARES, 'resister_amnesia_res', 30)
		updateModPerformance(pet, tpz.mod.LULLABYRES, 'resister_lullaby_res', 30)
    end
end