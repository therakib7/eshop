defmodule EshopWeb.ItemVariantControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Components
  alias Eshop.Components.ItemVariant

  @create_attrs %{
    cost_price: "120.5",
    sale_price: "120.5",
    unit_price: "120.5"
  }
  @update_attrs %{
    cost_price: "456.7",
    sale_price: "456.7",
    unit_price: "456.7"
  }
  @invalid_attrs %{cost_price: nil, sale_price: nil, unit_price: nil}

  def fixture(:item_variant) do
    {:ok, item_variant} = Components.create_item_variant(@create_attrs)
    item_variant
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all item_variants", %{conn: conn} do
      conn = get(conn, Routes.item_variant_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create item_variant" do
    test "renders item_variant when data is valid", %{conn: conn} do
      conn = post(conn, Routes.item_variant_path(conn, :create), item_variant: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.item_variant_path(conn, :show, id))

      assert %{
               "id" => id,
               "cost_price" => "120.5",
               "sale_price" => "120.5",
               "unit_price" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.item_variant_path(conn, :create), item_variant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update item_variant" do
    setup [:create_item_variant]

    test "renders item_variant when data is valid", %{conn: conn, item_variant: %ItemVariant{id: id} = item_variant} do
      conn = put(conn, Routes.item_variant_path(conn, :update, item_variant), item_variant: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.item_variant_path(conn, :show, id))

      assert %{
               "id" => id,
               "cost_price" => "456.7",
               "sale_price" => "456.7",
               "unit_price" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, item_variant: item_variant} do
      conn = put(conn, Routes.item_variant_path(conn, :update, item_variant), item_variant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete item_variant" do
    setup [:create_item_variant]

    test "deletes chosen item_variant", %{conn: conn, item_variant: item_variant} do
      conn = delete(conn, Routes.item_variant_path(conn, :delete, item_variant))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.item_variant_path(conn, :show, item_variant))
      end
    end
  end

  defp create_item_variant(_) do
    item_variant = fixture(:item_variant)
    %{item_variant: item_variant}
  end
end
