defmodule EshopWeb.NotificationMsgControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Messengers
  alias Eshop.Messengers.NotificationMsg

  @create_attrs %{
    for: 42,
    msg: "some msg"
  }
  @update_attrs %{
    for: 43,
    msg: "some updated msg"
  }
  @invalid_attrs %{for: nil, msg: nil}

  def fixture(:notification_msg) do
    {:ok, notification_msg} = Messengers.create_notification_msg(@create_attrs)
    notification_msg
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all notification_msgs", %{conn: conn} do
      conn = get(conn, Routes.notification_msg_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create notification_msg" do
    test "renders notification_msg when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.notification_msg_path(conn, :create), notification_msg: @create_attrs)

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.notification_msg_path(conn, :show, id))

      assert %{
               "id" => id,
               "for" => 42,
               "msg" => "some msg"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.notification_msg_path(conn, :create), notification_msg: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update notification_msg" do
    setup [:create_notification_msg]

    test "renders notification_msg when data is valid", %{
      conn: conn,
      notification_msg: %NotificationMsg{id: id} = notification_msg
    } do
      conn =
        put(conn, Routes.notification_msg_path(conn, :update, notification_msg),
          notification_msg: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.notification_msg_path(conn, :show, id))

      assert %{
               "id" => id,
               "for" => 43,
               "msg" => "some updated msg"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, notification_msg: notification_msg} do
      conn =
        put(conn, Routes.notification_msg_path(conn, :update, notification_msg),
          notification_msg: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete notification_msg" do
    setup [:create_notification_msg]

    test "deletes chosen notification_msg", %{conn: conn, notification_msg: notification_msg} do
      conn = delete(conn, Routes.notification_msg_path(conn, :delete, notification_msg))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.notification_msg_path(conn, :show, notification_msg))
      end
    end
  end

  defp create_notification_msg(_) do
    notification_msg = fixture(:notification_msg)
    %{notification_msg: notification_msg}
  end
end
