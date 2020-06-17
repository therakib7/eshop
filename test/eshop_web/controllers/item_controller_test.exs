defmodule EshopWeb.ItemControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Objects
  alias Eshop.Objects.Item

  @create_attrs %{
    asin_id: 42,
    cost_price: "120.5",
    desc: "some desc",
    extra_fields: %{},
    has_package: true,
    has_variant: true,
    has_warehouse: true,
    is_active: true,
    loves: 42,
    low_stock: 42,
    name: "some name",
    native_desc: "some native_desc",
    native_name: "some native_name",
    sale_price: "120.5",
    total_order: 42,
    type: 42,
    type_id: 42,
    unit: 42,
    unit_price: "120.5",
    vat: 42,
    vat_type: 42,
    views: 42
  }
  @update_attrs %{
    asin_id: 43,
    cost_price: "456.7",
    desc: "some updated desc",
    extra_fields: %{},
    has_package: false,
    has_variant: false,
    has_warehouse: false,
    is_active: false,
    loves: 43,
    low_stock: 43,
    name: "some updated name",
    native_desc: "some updated native_desc",
    native_name: "some updated native_name",
    sale_price: "456.7",
    total_order: 43,
    type: 43,
    type_id: 43,
    unit: 43,
    unit_price: "456.7",
    vat: 43,
    vat_type: 43,
    views: 43
  }
  @invalid_attrs %{
    asin_id: nil,
    cost_price: nil,
    desc: nil,
    extra_fields: nil,
    has_package: nil,
    has_variant: nil,
    has_warehouse: nil,
    is_active: nil,
    loves: nil,
    low_stock: nil,
    name: nil,
    native_desc: nil,
    native_name: nil,
    sale_price: nil,
    total_order: nil,
    type: nil,
    type_id: nil,
    unit: nil,
    unit_price: nil,
    vat: nil,
    vat_type: nil,
    views: nil
  }

  def fixture(:item) do
    {:ok, item} = Objects.create_item(@create_attrs)
    item
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all items", %{conn: conn} do
      conn = get(conn, Routes.item_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create item" do
    test "renders item when data is valid", %{conn: conn} do
      conn = post(conn, Routes.item_path(conn, :create), item: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.item_path(conn, :show, id))

      assert %{
               "id" => id,
               "asin_id" => 42,
               "cost_price" => "120.5",
               "desc" => "some desc",
               "extra_fields" => %{},
               "has_package" => true,
               "has_variant" => true,
               "has_warehouse" => true,
               "is_active" => true,
               "loves" => 42,
               "low_stock" => 42,
               "name" => "some name",
               "native_desc" => "some native_desc",
               "native_name" => "some native_name",
               "sale_price" => "120.5",
               "total_order" => 42,
               "type" => 42,
               "type_id" => 42,
               "unit" => 42,
               "unit_price" => "120.5",
               "vat" => 42,
               "vat_type" => 42,
               "views" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.item_path(conn, :create), item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update item" do
    setup [:create_item]

    test "renders item when data is valid", %{conn: conn, item: %Item{id: id} = item} do
      conn = put(conn, Routes.item_path(conn, :update, item), item: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.item_path(conn, :show, id))

      assert %{
               "id" => id,
               "asin_id" => 43,
               "cost_price" => "456.7",
               "desc" => "some updated desc",
               "extra_fields" => %{},
               "has_package" => false,
               "has_variant" => false,
               "has_warehouse" => false,
               "is_active" => false,
               "loves" => 43,
               "low_stock" => 43,
               "name" => "some updated name",
               "native_desc" => "some updated native_desc",
               "native_name" => "some updated native_name",
               "sale_price" => "456.7",
               "total_order" => 43,
               "type" => 43,
               "type_id" => 43,
               "unit" => 43,
               "unit_price" => "456.7",
               "vat" => 43,
               "vat_type" => 43,
               "views" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, item: item} do
      conn = put(conn, Routes.item_path(conn, :update, item), item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete item" do
    setup [:create_item]

    test "deletes chosen item", %{conn: conn, item: item} do
      conn = delete(conn, Routes.item_path(conn, :delete, item))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.item_path(conn, :show, item))
      end
    end
  end

  defp create_item(_) do
    item = fixture(:item)
    %{item: item}
  end
end
