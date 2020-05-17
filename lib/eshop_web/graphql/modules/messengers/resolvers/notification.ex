defmodule EshopWeb.Schema.Resolvers.Notification do
  def list_notifications(_parent, _args, _resolution) do
    {:ok, Eshop.Messengers.list_notifications()}
  end

  def get_notification(_, %{id: id}, _) do
    {:ok, Eshop.Messengers.get_notification!(id)}
  end

  def create_notification(_parent, args, _resolution) do
    Eshop.Messengers.create_notification(args)
  end

  def update_notification(%{id: id, notification_params: notification_params}, _info) do
    case {:ok, Eshop.Messengers.get_notification!(id)} do
      {:ok, notification} ->
        notification |> Eshop.Messengers.update_notification(notification_params)
    end
  end

  def delete_notification(%{id: id}, _info) do
    case {:ok, Eshop.Messengers.get_notification!(id)} do
      {:ok, notification} -> notification |> Eshop.Messengers.delete_notification()
    end
  end
end
