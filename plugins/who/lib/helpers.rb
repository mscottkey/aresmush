module AresMUSH
  module Who
    # This is how the room name is displayed.  It is also used for
    # sorting purposes, so characters are sorted by area then individual rooms,
    # and unfindable characters are sorted together.
    def self.who_room_name(char)
      if (char.who_hidden)
        return t('who.hidden')
      end

      room_area = char.room.area
      area = !room_area ? "" : "#{room_area} - "
      "#{area}#{char.room.name}"
    end
  end
end
