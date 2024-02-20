module AresMUSH
  module Scenes
    
    def self.custom_char_card_fields(char, viewer)
      {
        items: char.items.map { |name| { name: name, desc: Website.format_markdown_for_html(Simpleinventory.item_desc(name)) } }
      }
    end
  end
end
