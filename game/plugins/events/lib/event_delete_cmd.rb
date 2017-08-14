module AresMUSH

  module Events
    class EventDeleteCmd
      include CommandHandler
      
      attr_accessor :num

      def help
        "`event/delete <#>`"
      end
      
      def parse_args
        self.num = integer_arg(cmd.args)
      end
      
      def required_args
        [ self.num ]
      end
      
      def handle
        Events.with_an_event(self.num, client, enactor) do |event| 
          
           if (Events.can_manage_events?(enactor) || enactor == event.character)
             event.delete
             Global.client_monitor.emit_all_ooc t('events.event_deleted', :title => event.title,
                :starts => event.start_time_standard, :name => enactor_name)
             
           else
             client.emit_failure t('dispatcher.not_allowed')
           end 
        end
      end
    end
  end
end