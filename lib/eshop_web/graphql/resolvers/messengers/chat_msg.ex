defmodule EshopWeb.Schema.Resolvers.ChatMsg do

    def list_chat_msgs(_parent, _args, _resolution) do
        {:ok, Eshop.Messengers.list_chat_msgs()}
    end

    def create_chat_msg(_parent, args, _resolution) do
        Eshop.Messengers.create_chat_msg(args)
    end

end
