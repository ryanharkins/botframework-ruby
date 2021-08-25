module BotFramework
  # Channel account information for a conversation
  class ConversationAccount < Base
    # Is this a reference to a group
    attr_accessor :is_group

    # Channel id for the user or bot on this channel (Example: joe@smith.com, or @joesmith or 123456)
    attr_accessor :id
    attr_accessor :conversation_type
    attr_accessor :tenant_id

    # Display friendly name
    attr_accessor :name

    # Attribute type mapping.
    def self.swagger_types
      {
        is_group: :BOOLEAN,
        id: :String,
        name: :String,
        conversation_type: :String,
        tenant_id: :String
      }
    end
  end
end
