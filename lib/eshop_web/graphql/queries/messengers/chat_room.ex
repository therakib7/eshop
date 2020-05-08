defmodule EshopWeb.Schema.Queries.ChatRoom do 
  use Absinthe.Schema.Notation

  object :chat_room_queries do
    @desc "Get all chat_rooms"
    field :chat_rooms, list_of(:chat_room) do
      resolve &EshopWeb.Schema.Resolvers.ChatRoom.list_chat_rooms/3
    end
  end 
end
