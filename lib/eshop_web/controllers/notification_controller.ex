defmodule EshopWeb.NotificationController do
  use EshopWeb, :controller

  alias Eshop.Messengers
  alias Eshop.Messengers.Notification

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    notifications = Messengers.list_notifications()
    render(conn, "index.json", notifications: notifications)
  end

  def create(conn, %{"notification" => notification_params}) do
    with {:ok, %Notification{} = notification} <- Messengers.create_notification(notification_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.notification_path(conn, :show, notification))
      |> render("show.json", notification: notification)
    end
  end

  def show(conn, %{"id" => id}) do
    notification = Messengers.get_notification!(id)
    render(conn, "show.json", notification: notification)
  end

  def update(conn, %{"id" => id, "notification" => notification_params}) do
    notification = Messengers.get_notification!(id)

    with {:ok, %Notification{} = notification} <- Messengers.update_notification(notification, notification_params) do
      render(conn, "show.json", notification: notification)
    end
  end

  def delete(conn, %{"id" => id}) do
    notification = Messengers.get_notification!(id)

    with {:ok, %Notification{}} <- Messengers.delete_notification(notification) do
      send_resp(conn, :no_content, "")
    end
  end
end
