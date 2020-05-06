defmodule EshopWeb.WarehouseVariantValueControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Companies
  alias Eshop.Companies.WarehouseVariantValue

  @create_attrs %{
    native_value: "some native_value",
    value: "some value"
  }
  @update_attrs %{
    native_value: "some updated native_value",
    value: "some updated value"
  }
  @invalid_attrs %{native_value: nil, value: nil}

  def fixture(:warehouse_variant_value) do
    {:ok, warehouse_variant_value} = Companies.create_warehouse_variant_value(@create_attrs)
    warehouse_variant_value
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all warehouse_variant_values", %{conn: conn} do
      conn = get(conn, Routes.warehouse_variant_value_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create warehouse_variant_value" do
    test "renders warehouse_variant_value when data is valid", %{conn: conn} do
      conn = post(conn, Routes.warehouse_variant_value_path(conn, :create), warehouse_variant_value: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.warehouse_variant_value_path(conn, :show, id))

      assert %{
               "id" => id,
               "native_value" => "some native_value",
               "value" => "some value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.warehouse_variant_value_path(conn, :create), warehouse_variant_value: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update warehouse_variant_value" do
    setup [:create_warehouse_variant_value]

    test "renders warehouse_variant_value when data is valid", %{conn: conn, warehouse_variant_value: %WarehouseVariantValue{id: id} = warehouse_variant_value} do
      conn = put(conn, Routes.warehouse_variant_value_path(conn, :update, warehouse_variant_value), warehouse_variant_value: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.warehouse_variant_value_path(conn, :show, id))

      assert %{
               "id" => id,
               "native_value" => "some updated native_value",
               "value" => "some updated value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, warehouse_variant_value: warehouse_variant_value} do
      conn = put(conn, Routes.warehouse_variant_value_path(conn, :update, warehouse_variant_value), warehouse_variant_value: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete warehouse_variant_value" do
    setup [:create_warehouse_variant_value]

    test "deletes chosen warehouse_variant_value", %{conn: conn, warehouse_variant_value: warehouse_variant_value} do
      conn = delete(conn, Routes.warehouse_variant_value_path(conn, :delete, warehouse_variant_value))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.warehouse_variant_value_path(conn, :show, warehouse_variant_value))
      end
    end
  end

  defp create_warehouse_variant_value(_) do
    warehouse_variant_value = fixture(:warehouse_variant_value)
    %{warehouse_variant_value: warehouse_variant_value}
  end
end
