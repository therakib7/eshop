defmodule EshopWeb.ChatRoomController do
  use EshopWeb, :controller

  alias Eshop.Messengers
  alias Eshop.Messengers.ChatRoom

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    chat_rooms = Messengers.list_chat_rooms()
    render(conn, "index.json", chat_rooms: chat_rooms)
  end

  def create(conn, %{"chat_room" => chat_room_params}) do
    with {:ok, %ChatRoom{} = chat_room} <- Messengers.create_chat_room(chat_room_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.chat_room_path(conn, :show, chat_room))
      |> render("show.json", chat_room: chat_room)
    end
  end

  def show(conn, %{"id" => id}) do
    chat_room = Messengers.get_chat_room!(id)
    render(conn, "show.json", chat_room: chat_room)
  end

  def update(conn, %{"id" => id, "chat_room" => chat_room_params}) do
    chat_room = Messengers.get_chat_room!(id)

    with {:ok, %ChatRoom{} = chat_room} <- Messengers.update_chat_room(chat_room, chat_room_params) do
      render(conn, "show.json", chat_room: chat_room)
    end
  end

  def delete(conn, %{"id" => id}) do
    chat_room = Messengers.get_chat_room!(id)

    with {:ok, %ChatRoom{}} <- Messengers.delete_chat_room(chat_room) do
      send_resp(conn, :no_content, "")
    end
  end
end
