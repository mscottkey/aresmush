module AresMUSH
  module FS3Combat
    class PoseEventHandler
      def on_event(event)
        enactor = event.enactor
        combatant = enactor.combatant
        return if !combatant
        
        combatant.update(posed: true)
        combat = combatant.combat
        
        if (!combat.scene && enactor.room.scene)
          combat.update(scene: enactor.room.scene)
        end

        slackers = combat.active_combatants.select { |c| !c.is_npc? && !c.posed && !c.is_ko && !c.idle }
        if (slackers.empty? && !combat.everyone_posed)
          FS3Combat.emit_to_organizer combat, t('fs3combat.everyone_posed')
          combat.update(everyone_posed: true)
        end
      end
    end
  end
end