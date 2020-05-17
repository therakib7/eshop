defmodule EshopWeb.WarehouseControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Companies
  alias Eshop.Companies.Warehouse

  @create_attrs %{
    is_active: true,
    name: "some name",
    native_name: "some native_name"
  }
  @update_attrs %{
    is_active: false,
    name: "some updated name",
    native_name: "some updated native_name"
  }
  @invalid_attrs %{is_active: nil, name: nil, native_name: nil}

  def fixture(:warehouse) do
    {:ok, warehouse} = Companies.create_warehouse(@create_attrs)
    warehouse
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all warehouses", %{conn: conn} do
      conn = get(conn, Routes.warehouse_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create warehouse" do
    test "renders warehouse when data is valid", %{conn: conn} do
      conn = post(conn, Routes.warehouse_path(conn, :create), warehouse: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.warehouse_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_active" => true,
               "name" => "some name",
               "native_name" => "some native_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.warehouse_path(conn, :create), warehouse: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update warehouse" do
    setup [:create_warehouse]

    test "renders warehouse when data is valid", %{
      conn: conn,
      warehouse: %Warehouse{id: id} = warehouse
    } do
      conn = put(conn, Routes.warehouse_path(conn, :update, warehouse), warehouse: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.warehouse_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_active" => false,
               "name" => "some updated name",
               "native_name" => "some updated native_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, warehouse: warehouse} do
      conn = put(conn, Routes.warehouse_path(conn, :update, warehouse), warehouse: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete warehouse" do
    setup [:create_warehouse]

    test "deletes chosen warehouse", %{conn: conn, warehouse: warehouse} do
      conn = delete(conn, Routes.warehouse_path(conn, :delete, warehouse))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.warehouse_path(conn, :show, warehouse))
      end
    end
  end

  defp create_warehouse(_) do
    warehouse = fixture(:warehouse)
    %{warehouse: warehouse}
  end
end
