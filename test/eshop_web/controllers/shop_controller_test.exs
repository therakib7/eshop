defmodule EshopWeb.ShopControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Companies
  alias Eshop.Companies.Shop

  @create_attrs %{
    created_at: "2010-04-17T14:00:00Z",
    golden_supplier: true,
    highest_assurance: "120.5",
    is_active: true,
    is_verifed: true,
    name: "some name",
    native_name: "some native_name",
    trade_assurance: true
  }
  @update_attrs %{
    created_at: "2011-05-18T15:01:01Z",
    golden_supplier: false,
    highest_assurance: "456.7",
    is_active: false,
    is_verifed: false,
    name: "some updated name",
    native_name: "some updated native_name",
    trade_assurance: false
  }
  @invalid_attrs %{
    created_at: nil,
    golden_supplier: nil,
    highest_assurance: nil,
    is_active: nil,
    is_verifed: nil,
    name: nil,
    native_name: nil,
    trade_assurance: nil
  }

  def fixture(:shop) do
    {:ok, shop} = Companies.create_shop(@create_attrs)
    shop
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shops", %{conn: conn} do
      conn = get(conn, Routes.shop_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create shop" do
    test "renders shop when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shop_path(conn, :create), shop: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.shop_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2010-04-17T14:00:00Z",
               "golden_supplier" => true,
               "highest_assurance" => "120.5",
               "is_active" => true,
               "is_verifed" => true,
               "name" => "some name",
               "native_name" => "some native_name",
               "trade_assurance" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shop_path(conn, :create), shop: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update shop" do
    setup [:create_shop]

    test "renders shop when data is valid", %{conn: conn, shop: %Shop{id: id} = shop} do
      conn = put(conn, Routes.shop_path(conn, :update, shop), shop: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.shop_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2011-05-18T15:01:01Z",
               "golden_supplier" => false,
               "highest_assurance" => "456.7",
               "is_active" => false,
               "is_verifed" => false,
               "name" => "some updated name",
               "native_name" => "some updated native_name",
               "trade_assurance" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, shop: shop} do
      conn = put(conn, Routes.shop_path(conn, :update, shop), shop: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete shop" do
    setup [:create_shop]

    test "deletes chosen shop", %{conn: conn, shop: shop} do
      conn = delete(conn, Routes.shop_path(conn, :delete, shop))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.shop_path(conn, :show, shop))
      end
    end
  end

  defp create_shop(_) do
    shop = fixture(:shop)
    %{shop: shop}
  end
end
