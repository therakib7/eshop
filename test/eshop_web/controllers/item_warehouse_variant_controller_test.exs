defmodule EshopWeb.ItemWarehouseVariantControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Components
  alias Eshop.Components.ItemWarehouseVariant

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:item_warehouse_variant) do
    {:ok, item_warehouse_variant} = Components.create_item_warehouse_variant(@create_attrs)
    item_warehouse_variant
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all item_warehouse_variants", %{conn: conn} do
      conn = get(conn, Routes.item_warehouse_variant_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create item_warehouse_variant" do
    test "renders item_warehouse_variant when data is valid", %{conn: conn} do
      conn = post(conn, Routes.item_warehouse_variant_path(conn, :create), item_warehouse_variant: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.item_warehouse_variant_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.item_warehouse_variant_path(conn, :create), item_warehouse_variant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update item_warehouse_variant" do
    setup [:create_item_warehouse_variant]

    test "renders item_warehouse_variant when data is valid", %{conn: conn, item_warehouse_variant: %ItemWarehouseVariant{id: id} = item_warehouse_variant} do
      conn = put(conn, Routes.item_warehouse_variant_path(conn, :update, item_warehouse_variant), item_warehouse_variant: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.item_warehouse_variant_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, item_warehouse_variant: item_warehouse_variant} do
      conn = put(conn, Routes.item_warehouse_variant_path(conn, :update, item_warehouse_variant), item_warehouse_variant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete item_warehouse_variant" do
    setup [:create_item_warehouse_variant]

    test "deletes chosen item_warehouse_variant", %{conn: conn, item_warehouse_variant: item_warehouse_variant} do
      conn = delete(conn, Routes.item_warehouse_variant_path(conn, :delete, item_warehouse_variant))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.item_warehouse_variant_path(conn, :show, item_warehouse_variant))
      end
    end
  end

  defp create_item_warehouse_variant(_) do
    item_warehouse_variant = fixture(:item_warehouse_variant)
    %{item_warehouse_variant: item_warehouse_variant}
  end
end
