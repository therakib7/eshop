defmodule EshopWeb.Schema.Mutations.ChatRoom do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ChatRoom, as: ChatRoom

  object :chat_room_mutations do
    @desc "Create a chat_room"
    field :create_chat_room, type: :chat_room do
      arg(:id, :integer)
      arg(:shop_id, :id)
      arg(:customer_id, :id)

      resolve(&ChatRoom.create_chat_room/3)
    end

    @desc "Update a chat_room"
    field :update_chat_room, type: :chat_room do
      arg(:id, non_null(:id))
      arg(:chat_room_params, :chat_room_params)

      resolve(&ChatRoom.update_chat_room/2)
    end

    @desc "Delete a chat_room"
    field :delete_chat_room, type: :chat_room do
      arg(:id, non_null(:id))
      resolve(&ChatRoom.delete_chat_room/2)
    end
  end
end
