defmodule EshopWeb.SettingControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Settings
  alias Eshop.Settings.Setting

  @create_attrs %{
    key: "some key",
    value: "some value"
  }
  @update_attrs %{
    key: "some updated key",
    value: "some updated value"
  }
  @invalid_attrs %{key: nil, value: nil}

  def fixture(:setting) do
    {:ok, setting} = Settings.create_setting(@create_attrs)
    setting
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all settings", %{conn: conn} do
      conn = get(conn, Routes.setting_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create setting" do
    test "renders setting when data is valid", %{conn: conn} do
      conn = post(conn, Routes.setting_path(conn, :create), setting: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.setting_path(conn, :show, id))

      assert %{
               "id" => id,
               "key" => "some key",
               "value" => "some value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.setting_path(conn, :create), setting: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update setting" do
    setup [:create_setting]

    test "renders setting when data is valid", %{conn: conn, setting: %Setting{id: id} = setting} do
      conn = put(conn, Routes.setting_path(conn, :update, setting), setting: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.setting_path(conn, :show, id))

      assert %{
               "id" => id,
               "key" => "some updated key",
               "value" => "some updated value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, setting: setting} do
      conn = put(conn, Routes.setting_path(conn, :update, setting), setting: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete setting" do
    setup [:create_setting]

    test "deletes chosen setting", %{conn: conn, setting: setting} do
      conn = delete(conn, Routes.setting_path(conn, :delete, setting))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.setting_path(conn, :show, setting))
      end
    end
  end

  defp create_setting(_) do
    setting = fixture(:setting)
    %{setting: setting}
  end
end
