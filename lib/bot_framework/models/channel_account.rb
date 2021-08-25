module BotFramework
  # Channel account information needed to route a message
  class ChannelAccount < Base
    # Channel id for the user or bot on this channel (Example: joe@smith.com, or @joesmith or 123456)
    attr_accessor :id

    # Display friendly name
    attr_accessor :name

    attr_accessor :aad_object_id

    # Attribute type mapping.
    def self.swagger_types
      {
        id: :String,
        name: :String,
        aad_object_id: :String
      }
    end
  end
end
