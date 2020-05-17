defmodule EshopWeb.Schema.Queries.ChatRoom do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ChatRoom, as: ChatRoom

  object :chat_room_queries do
    @desc "Get all chat_rooms"
    field :chat_rooms, list_of(:chat_room) do
      resolve(&ChatRoom.list_chat_rooms/3)
    end

    @desc "Get a chat_room by its id"
    field :chat_room, :chat_room do
      arg(:id, non_null(:id))
      resolve(&ChatRoom.get_chat_room/3)
    end
  end
end
