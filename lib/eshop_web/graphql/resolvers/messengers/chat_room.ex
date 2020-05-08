defmodule EshopWeb.Schema.Resolvers.ChatRoom do

	def list_chat_rooms(_parent, _args, _resolution) do
        {:ok, Eshop.Messengers.list_chat_rooms()}
    end

end
