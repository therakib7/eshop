defmodule EshopWeb.NotificationMsgView do
  use EshopWeb, :view
  alias EshopWeb.NotificationMsgView

  def render("index.json", %{notification_msgs: notification_msgs}) do
    %{data: render_many(notification_msgs, NotificationMsgView, "notification_msg.json")}
  end

  def render("show.json", %{notification_msg: notification_msg}) do
    %{data: render_one(notification_msg, NotificationMsgView, "notification_msg.json")}
  end

  def render("notification_msg.json", %{notification_msg: notification_msg}) do
    %{id: notification_msg.id,
      msg: notification_msg.msg,
      for: notification_msg.for}
  end
end
