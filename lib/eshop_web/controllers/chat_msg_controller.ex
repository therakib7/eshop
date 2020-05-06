defmodule EshopWeb.ChatMsgController do
  use EshopWeb, :controller

  alias Eshop.Messengers
  alias Eshop.Messengers.ChatMsg

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    chat_msgs = Messengers.list_chat_msgs()
    render(conn, "index.json", chat_msgs: chat_msgs)
  end

  def create(conn, %{"chat_msg" => chat_msg_params}) do
    with {:ok, %ChatMsg{} = chat_msg} <- Messengers.create_chat_msg(chat_msg_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.chat_msg_path(conn, :show, chat_msg))
      |> render("show.json", chat_msg: chat_msg)
    end
  end

  def show(conn, %{"id" => id}) do
    chat_msg = Messengers.get_chat_msg!(id)
    render(conn, "show.json", chat_msg: chat_msg)
  end

  def update(conn, %{"id" => id, "chat_msg" => chat_msg_params}) do
    chat_msg = Messengers.get_chat_msg!(id)

    with {:ok, %ChatMsg{} = chat_msg} <- Messengers.update_chat_msg(chat_msg, chat_msg_params) do
      render(conn, "show.json", chat_msg: chat_msg)
    end
  end

  def delete(conn, %{"id" => id}) do
    chat_msg = Messengers.get_chat_msg!(id)

    with {:ok, %ChatMsg{}} <- Messengers.delete_chat_msg(chat_msg) do
      send_resp(conn, :no_content, "")
    end
  end
end
