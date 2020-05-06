defmodule EshopWeb.ShopShippingMethodControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Shipments
  alias Eshop.Shipments.ShopShippingMethod

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:shop_shipping_method) do
    {:ok, shop_shipping_method} = Shipments.create_shop_shipping_method(@create_attrs)
    shop_shipping_method
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shop_shipping_methods", %{conn: conn} do
      conn = get(conn, Routes.shop_shipping_method_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create shop_shipping_method" do
    test "renders shop_shipping_method when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shop_shipping_method_path(conn, :create), shop_shipping_method: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.shop_shipping_method_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shop_shipping_method_path(conn, :create), shop_shipping_method: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update shop_shipping_method" do
    setup [:create_shop_shipping_method]

    test "renders shop_shipping_method when data is valid", %{conn: conn, shop_shipping_method: %ShopShippingMethod{id: id} = shop_shipping_method} do
      conn = put(conn, Routes.shop_shipping_method_path(conn, :update, shop_shipping_method), shop_shipping_method: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.shop_shipping_method_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, shop_shipping_method: shop_shipping_method} do
      conn = put(conn, Routes.shop_shipping_method_path(conn, :update, shop_shipping_method), shop_shipping_method: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete shop_shipping_method" do
    setup [:create_shop_shipping_method]

    test "deletes chosen shop_shipping_method", %{conn: conn, shop_shipping_method: shop_shipping_method} do
      conn = delete(conn, Routes.shop_shipping_method_path(conn, :delete, shop_shipping_method))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.shop_shipping_method_path(conn, :show, shop_shipping_method))
      end
    end
  end

  defp create_shop_shipping_method(_) do
    shop_shipping_method = fixture(:shop_shipping_method)
    %{shop_shipping_method: shop_shipping_method}
  end
end
