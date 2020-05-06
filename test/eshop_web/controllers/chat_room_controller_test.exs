defmodule EshopWeb.ChatRoomControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Messengers
  alias Eshop.Messengers.ChatRoom

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:chat_room) do
    {:ok, chat_room} = Messengers.create_chat_room(@create_attrs)
    chat_room
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all chat_rooms", %{conn: conn} do
      conn = get(conn, Routes.chat_room_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create chat_room" do
    test "renders chat_room when data is valid", %{conn: conn} do
      conn = post(conn, Routes.chat_room_path(conn, :create), chat_room: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.chat_room_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.chat_room_path(conn, :create), chat_room: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update chat_room" do
    setup [:create_chat_room]

    test "renders chat_room when data is valid", %{conn: conn, chat_room: %ChatRoom{id: id} = chat_room} do
      conn = put(conn, Routes.chat_room_path(conn, :update, chat_room), chat_room: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.chat_room_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, chat_room: chat_room} do
      conn = put(conn, Routes.chat_room_path(conn, :update, chat_room), chat_room: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete chat_room" do
    setup [:create_chat_room]

    test "deletes chosen chat_room", %{conn: conn, chat_room: chat_room} do
      conn = delete(conn, Routes.chat_room_path(conn, :delete, chat_room))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.chat_room_path(conn, :show, chat_room))
      end
    end
  end

  defp create_chat_room(_) do
    chat_room = fixture(:chat_room)
    %{chat_room: chat_room}
  end
end
