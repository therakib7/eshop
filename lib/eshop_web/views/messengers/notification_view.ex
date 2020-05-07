defmodule EshopWeb.NotificationView do
  use EshopWeb, :view
  alias EshopWeb.NotificationView

  def render("index.json", %{notifications: notifications}) do
    %{data: render_many(notifications, NotificationView, "notification.json")}
  end

  def render("show.json", %{notification: notification}) do
    %{data: render_one(notification, NotificationView, "notification.json")}
  end

  def render("notification.json", %{notification: notification}) do
    %{id: notification.id,
      type: notification.type,
      type_id: notification.type_id,
      notification_msg_id: notification.notification_msg_id,
      read: notification.read}
  end
end
