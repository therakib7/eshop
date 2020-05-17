defmodule EshopWeb.CompanySettingControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Settings
  alias Eshop.Settings.CompanySetting

  @create_attrs %{
    key: "some key",
    type: 42,
    type_id: 42,
    value: "some value"
  }
  @update_attrs %{
    key: "some updated key",
    type: 43,
    type_id: 43,
    value: "some updated value"
  }
  @invalid_attrs %{key: nil, type: nil, type_id: nil, value: nil}

  def fixture(:company_setting) do
    {:ok, company_setting} = Settings.create_company_setting(@create_attrs)
    company_setting
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all company_settings", %{conn: conn} do
      conn = get(conn, Routes.company_setting_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create company_setting" do
    test "renders company_setting when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.company_setting_path(conn, :create), company_setting: @create_attrs)

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.company_setting_path(conn, :show, id))

      assert %{
               "id" => id,
               "key" => "some key",
               "type" => 42,
               "type_id" => 42,
               "value" => "some value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.company_setting_path(conn, :create), company_setting: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update company_setting" do
    setup [:create_company_setting]

    test "renders company_setting when data is valid", %{
      conn: conn,
      company_setting: %CompanySetting{id: id} = company_setting
    } do
      conn =
        put(conn, Routes.company_setting_path(conn, :update, company_setting),
          company_setting: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.company_setting_path(conn, :show, id))

      assert %{
               "id" => id,
               "key" => "some updated key",
               "type" => 43,
               "type_id" => 43,
               "value" => "some updated value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, company_setting: company_setting} do
      conn =
        put(conn, Routes.company_setting_path(conn, :update, company_setting),
          company_setting: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete company_setting" do
    setup [:create_company_setting]

    test "deletes chosen company_setting", %{conn: conn, company_setting: company_setting} do
      conn = delete(conn, Routes.company_setting_path(conn, :delete, company_setting))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.company_setting_path(conn, :show, company_setting))
      end
    end
  end

  defp create_company_setting(_) do
    company_setting = fixture(:company_setting)
    %{company_setting: company_setting}
  end
end
