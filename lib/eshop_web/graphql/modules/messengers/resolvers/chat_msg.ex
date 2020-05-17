defmodule EshopWeb.Schema.Resolvers.ChatMsg do
  def list_chat_msgs(_parent, _args, _resolution) do
    {:ok, Eshop.Messengers.list_chat_msgs()}
  end

  def get_chat_msg(_, %{id: id}, _) do
    {:ok, Eshop.Messengers.get_chat_msg!(id)}
  end

  def create_chat_msg(_parent, args, _resolution) do
    Eshop.Messengers.create_chat_msg(args)
  end

  def update_chat_msg(%{id: id, chat_msg_params: chat_msg_params}, _info) do
    case {:ok, Eshop.Messengers.get_chat_msg!(id)} do
      {:ok, chat_msg} -> chat_msg |> Eshop.Messengers.update_chat_msg(chat_msg_params)
    end
  end

  def delete_chat_msg(%{id: id}, _info) do
    case {:ok, Eshop.Messengers.get_chat_msg!(id)} do
      {:ok, chat_msg} -> chat_msg |> Eshop.Messengers.delete_chat_msg()
    end
  end
end
