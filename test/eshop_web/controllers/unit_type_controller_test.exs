defmodule EshopWeb.UnitTypeControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Components
  alias Eshop.Components.UnitType

  @create_attrs %{
    name: "some name",
    native_name: "some native_name"
  }
  @update_attrs %{
    name: "some updated name",
    native_name: "some updated native_name"
  }
  @invalid_attrs %{name: nil, native_name: nil}

  def fixture(:unit_type) do
    {:ok, unit_type} = Components.create_unit_type(@create_attrs)
    unit_type
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all unit_types", %{conn: conn} do
      conn = get(conn, Routes.unit_type_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create unit_type" do
    test "renders unit_type when data is valid", %{conn: conn} do
      conn = post(conn, Routes.unit_type_path(conn, :create), unit_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.unit_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "native_name" => "some native_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.unit_type_path(conn, :create), unit_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update unit_type" do
    setup [:create_unit_type]

    test "renders unit_type when data is valid", %{conn: conn, unit_type: %UnitType{id: id} = unit_type} do
      conn = put(conn, Routes.unit_type_path(conn, :update, unit_type), unit_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.unit_type_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "native_name" => "some updated native_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, unit_type: unit_type} do
      conn = put(conn, Routes.unit_type_path(conn, :update, unit_type), unit_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete unit_type" do
    setup [:create_unit_type]

    test "deletes chosen unit_type", %{conn: conn, unit_type: unit_type} do
      conn = delete(conn, Routes.unit_type_path(conn, :delete, unit_type))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.unit_type_path(conn, :show, unit_type))
      end
    end
  end

  defp create_unit_type(_) do
    unit_type = fixture(:unit_type)
    %{unit_type: unit_type}
  end
end
