defmodule EshopWeb.Schema.Mutations.ChatRoom do
  use Absinthe.Schema.Notation
  
  object :chat_room_mutations do
    @desc "Create a chat_room"
    field :create_chat_room, type: :chat_room do 
        arg :id, :integer
    	arg :shop_id, :id
    	arg :customer_id, :id
    	resolve &EshopWeb.Schema.Resolvers.ChatRoom.create_chat_room/3
    end
  end 
end
