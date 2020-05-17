defmodule EshopWeb.NotificationMsgController do
  use EshopWeb, :controller

  alias Eshop.Messengers
  alias Eshop.Messengers.NotificationMsg

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    notification_msgs = Messengers.list_notification_msgs()
    render(conn, "index.json", notification_msgs: notification_msgs)
  end

  def create(conn, %{"notification_msg" => notification_msg_params}) do
    with {:ok, %NotificationMsg{} = notification_msg} <-
           Messengers.create_notification_msg(notification_msg_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.notification_msg_path(conn, :show, notification_msg))
      |> render("show.json", notification_msg: notification_msg)
    end
  end

  def show(conn, %{"id" => id}) do
    notification_msg = Messengers.get_notification_msg!(id)
    render(conn, "show.json", notification_msg: notification_msg)
  end

  def update(conn, %{"id" => id, "notification_msg" => notification_msg_params}) do
    notification_msg = Messengers.get_notification_msg!(id)

    with {:ok, %NotificationMsg{} = notification_msg} <-
           Messengers.update_notification_msg(notification_msg, notification_msg_params) do
      render(conn, "show.json", notification_msg: notification_msg)
    end
  end

  def delete(conn, %{"id" => id}) do
    notification_msg = Messengers.get_notification_msg!(id)

    with {:ok, %NotificationMsg{}} <- Messengers.delete_notification_msg(notification_msg) do
      send_resp(conn, :no_content, "")
    end
  end
end
