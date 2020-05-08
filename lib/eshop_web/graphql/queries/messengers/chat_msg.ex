defmodule EshopWeb.Schema.Queries.ChatMsg do 
  use Absinthe.Schema.Notation

  object :chat_msg_queries do
    @desc "Get all chat_msgs"
    field :chat_msgs, list_of(:chat_msg) do
      resolve &EshopWeb.Schema.Resolvers.ChatMsg.list_chat_msgs/3
    end
  end 
end
