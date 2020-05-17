defmodule EshopWeb.ChatMsgView do
  use EshopWeb, :view
  alias EshopWeb.ChatMsgView

  def render("index.json", %{chat_msgs: chat_msgs}) do
    %{data: render_many(chat_msgs, ChatMsgView, "chat_msg.json")}
  end

  def render("show.json", %{chat_msg: chat_msg}) do
    %{data: render_one(chat_msg, ChatMsgView, "chat_msg.json")}
  end

  def render("chat_msg.json", %{chat_msg: chat_msg}) do
    %{
      id: chat_msg.id,
      msg_type: chat_msg.msg_type,
      msg: chat_msg.msg,
      read: chat_msg.read,
      deleted_at: chat_msg.deleted_at
    }
  end
end
