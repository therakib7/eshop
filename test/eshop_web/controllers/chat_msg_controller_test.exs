defmodule EshopWeb.ChatMsgControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Messengers
  alias Eshop.Messengers.ChatMsg

  @create_attrs %{
    deleted_at: "2010-04-17T14:00:00Z",
    msg: "some msg",
    msg_type: 42,
    read: true
  }
  @update_attrs %{
    deleted_at: "2011-05-18T15:01:01Z",
    msg: "some updated msg",
    msg_type: 43,
    read: false
  }
  @invalid_attrs %{deleted_at: nil, msg: nil, msg_type: nil, read: nil}

  def fixture(:chat_msg) do
    {:ok, chat_msg} = Messengers.create_chat_msg(@create_attrs)
    chat_msg
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all chat_msgs", %{conn: conn} do
      conn = get(conn, Routes.chat_msg_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create chat_msg" do
    test "renders chat_msg when data is valid", %{conn: conn} do
      conn = post(conn, Routes.chat_msg_path(conn, :create), chat_msg: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.chat_msg_path(conn, :show, id))

      assert %{
               "id" => id,
               "deleted_at" => "2010-04-17T14:00:00Z",
               "msg" => "some msg",
               "msg_type" => 42,
               "read" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.chat_msg_path(conn, :create), chat_msg: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update chat_msg" do
    setup [:create_chat_msg]

    test "renders chat_msg when data is valid", %{
      conn: conn,
      chat_msg: %ChatMsg{id: id} = chat_msg
    } do
      conn = put(conn, Routes.chat_msg_path(conn, :update, chat_msg), chat_msg: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.chat_msg_path(conn, :show, id))

      assert %{
               "id" => id,
               "deleted_at" => "2011-05-18T15:01:01Z",
               "msg" => "some updated msg",
               "msg_type" => 43,
               "read" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, chat_msg: chat_msg} do
      conn = put(conn, Routes.chat_msg_path(conn, :update, chat_msg), chat_msg: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete chat_msg" do
    setup [:create_chat_msg]

    test "deletes chosen chat_msg", %{conn: conn, chat_msg: chat_msg} do
      conn = delete(conn, Routes.chat_msg_path(conn, :delete, chat_msg))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.chat_msg_path(conn, :show, chat_msg))
      end
    end
  end

  defp create_chat_msg(_) do
    chat_msg = fixture(:chat_msg)
    %{chat_msg: chat_msg}
  end
end
