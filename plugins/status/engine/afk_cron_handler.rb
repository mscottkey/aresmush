module AresMUSH
  module Status    
    class AfkCronHandler
      include CommandHandler
      
      def on_cron_event(event)
        config = Global.read_config("status")
        return if !Cron.is_cron_match?(config['afk_cron'], event.time)
        
        Engine.client_monitor.logged_in_clients.each do |client|
          minutes_before_idle_disconnect = config['minutes_before_idle_disconnect']
          if (minutes_before_idle_disconnect &&
            (client.idle_secs > minutes_before_idle_disconnect * 60))
            client.emit_ooc t('status.afk_disconnect')
            client.disconnect
          end
        end
      end
    end    
  end
end