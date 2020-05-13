defmodule EshopWeb.Schema.Resolvers.ChatRoom do
	 
   	def list_chat_rooms(_parent, _args, _resolution) do
        {:ok, Eshop.Messengers.list_chat_rooms()}
    end

    def get_chat_room(_, %{id: id}, _) do
		{:ok, Eshop.Messengers.get_chat_room!(id)} 
	end 
	 
    def create_chat_room(_parent, args, _resolution) do
        Eshop.Messengers.create_chat_room(args)
    end 

    def update_chat_room(%{id: id, chat_room_params: chat_room_params}, _info) do
		case {:ok, Eshop.Messengers.get_chat_room!(id)} do
			{:ok, chat_room} -> chat_room |> Eshop.Messengers.update_chat_room(chat_room_params) 
		end  
	end

	def delete_chat_room(%{id: id}, _info) do 
		case {:ok, Eshop.Messengers.get_chat_room!(id)} do
			{:ok, chat_room} -> chat_room |> Eshop.Messengers.delete_chat_room() 
		end 
	end  
end
