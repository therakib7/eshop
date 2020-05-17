defmodule EshopWeb.Schema.Queries.ChatMsg do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ChatMsg, as: ChatMsg

  object :chat_msg_queries do
    @desc "Get all chat_msgs"
    field :chat_msgs, list_of(:chat_msg) do
      resolve(&ChatMsg.list_chat_msgs/3)
    end

    @desc "Get a chat_msg by its id"
    field :chat_msg, :chat_msg do
      arg(:id, non_null(:id))
      resolve(&ChatMsg.get_chat_msg/3)
    end
  end
end
