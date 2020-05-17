defmodule EshopWeb.Schema.Resolvers.NotificationMsg do
  def list_notification_msgs(_parent, _args, _resolution) do
    {:ok, Eshop.Messengers.list_notification_msgs()}
  end

  def get_notification_msg(_, %{id: id}, _) do
    {:ok, Eshop.Messengers.get_notification_msg!(id)}
  end

  def create_notification_msg(_parent, args, _resolution) do
    Eshop.Messengers.create_notification_msg(args)
  end

  def update_notification_msg(%{id: id, notification_msg_params: notification_msg_params}, _info) do
    case {:ok, Eshop.Messengers.get_notification_msg!(id)} do
      {:ok, notification_msg} ->
        notification_msg |> Eshop.Messengers.update_notification_msg(notification_msg_params)
    end
  end

  def delete_notification_msg(%{id: id}, _info) do
    case {:ok, Eshop.Messengers.get_notification_msg!(id)} do
      {:ok, notification_msg} -> notification_msg |> Eshop.Messengers.delete_notification_msg()
    end
  end
end
