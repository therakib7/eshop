defmodule EshopWeb.NotificationControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Messengers
  alias Eshop.Messengers.Notification

  @create_attrs %{
    notification_msg_id: 42,
    read: true,
    type: 42,
    type_id: 42
  }
  @update_attrs %{
    notification_msg_id: 43,
    read: false,
    type: 43,
    type_id: 43
  }
  @invalid_attrs %{notification_msg_id: nil, read: nil, type: nil, type_id: nil}

  def fixture(:notification) do
    {:ok, notification} = Messengers.create_notification(@create_attrs)
    notification
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all notifications", %{conn: conn} do
      conn = get(conn, Routes.notification_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create notification" do
    test "renders notification when data is valid", %{conn: conn} do
      conn = post(conn, Routes.notification_path(conn, :create), notification: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.notification_path(conn, :show, id))

      assert %{
               "id" => id,
               "notification_msg_id" => 42,
               "read" => true,
               "type" => 42,
               "type_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.notification_path(conn, :create), notification: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update notification" do
    setup [:create_notification]

    test "renders notification when data is valid", %{
      conn: conn,
      notification: %Notification{id: id} = notification
    } do
      conn =
        put(conn, Routes.notification_path(conn, :update, notification),
          notification: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.notification_path(conn, :show, id))

      assert %{
               "id" => id,
               "notification_msg_id" => 43,
               "read" => false,
               "type" => 43,
               "type_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, notification: notification} do
      conn =
        put(conn, Routes.notification_path(conn, :update, notification),
          notification: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete notification" do
    setup [:create_notification]

    test "deletes chosen notification", %{conn: conn, notification: notification} do
      conn = delete(conn, Routes.notification_path(conn, :delete, notification))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.notification_path(conn, :show, notification))
      end
    end
  end

  defp create_notification(_) do
    notification = fixture(:notification)
    %{notification: notification}
  end
end
