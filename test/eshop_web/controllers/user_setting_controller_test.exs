defmodule EshopWeb.UserSettingControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Settings
  alias Eshop.Settings.UserSetting

  @create_attrs %{
    key: "some key",
    value: "some value"
  }
  @update_attrs %{
    key: "some updated key",
    value: "some updated value"
  }
  @invalid_attrs %{key: nil, value: nil}

  def fixture(:user_setting) do
    {:ok, user_setting} = Settings.create_user_setting(@create_attrs)
    user_setting
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_settings", %{conn: conn} do
      conn = get(conn, Routes.user_setting_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_setting" do
    test "renders user_setting when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_setting_path(conn, :create), user_setting: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_setting_path(conn, :show, id))

      assert %{
               "id" => id,
               "key" => "some key",
               "value" => "some value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_setting_path(conn, :create), user_setting: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_setting" do
    setup [:create_user_setting]

    test "renders user_setting when data is valid", %{
      conn: conn,
      user_setting: %UserSetting{id: id} = user_setting
    } do
      conn =
        put(conn, Routes.user_setting_path(conn, :update, user_setting),
          user_setting: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_setting_path(conn, :show, id))

      assert %{
               "id" => id,
               "key" => "some updated key",
               "value" => "some updated value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_setting: user_setting} do
      conn =
        put(conn, Routes.user_setting_path(conn, :update, user_setting),
          user_setting: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_setting" do
    setup [:create_user_setting]

    test "deletes chosen user_setting", %{conn: conn, user_setting: user_setting} do
      conn = delete(conn, Routes.user_setting_path(conn, :delete, user_setting))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_setting_path(conn, :show, user_setting))
      end
    end
  end

  defp create_user_setting(_) do
    user_setting = fixture(:user_setting)
    %{user_setting: user_setting}
  end
end
