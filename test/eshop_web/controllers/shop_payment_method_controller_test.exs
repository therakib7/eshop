defmodule EshopWeb.ShopPaymentMethodControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Payments
  alias Eshop.Payments.ShopPaymentMethod

  @create_attrs %{
    ac_holder_name: "some ac_holder_name",
    ac_no: 42,
    account_type: "some account_type",
    is_active: true
  }
  @update_attrs %{
    ac_holder_name: "some updated ac_holder_name",
    ac_no: 43,
    account_type: "some updated account_type",
    is_active: false
  }
  @invalid_attrs %{ac_holder_name: nil, ac_no: nil, account_type: nil, is_active: nil}

  def fixture(:shop_payment_method) do
    {:ok, shop_payment_method} = Payments.create_shop_payment_method(@create_attrs)
    shop_payment_method
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shop_payment_methods", %{conn: conn} do
      conn = get(conn, Routes.shop_payment_method_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create shop_payment_method" do
    test "renders shop_payment_method when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shop_payment_method_path(conn, :create), shop_payment_method: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.shop_payment_method_path(conn, :show, id))

      assert %{
               "id" => id,
               "ac_holder_name" => "some ac_holder_name",
               "ac_no" => 42,
               "account_type" => "some account_type",
               "is_active" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shop_payment_method_path(conn, :create), shop_payment_method: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update shop_payment_method" do
    setup [:create_shop_payment_method]

    test "renders shop_payment_method when data is valid", %{conn: conn, shop_payment_method: %ShopPaymentMethod{id: id} = shop_payment_method} do
      conn = put(conn, Routes.shop_payment_method_path(conn, :update, shop_payment_method), shop_payment_method: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.shop_payment_method_path(conn, :show, id))

      assert %{
               "id" => id,
               "ac_holder_name" => "some updated ac_holder_name",
               "ac_no" => 43,
               "account_type" => "some updated account_type",
               "is_active" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, shop_payment_method: shop_payment_method} do
      conn = put(conn, Routes.shop_payment_method_path(conn, :update, shop_payment_method), shop_payment_method: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete shop_payment_method" do
    setup [:create_shop_payment_method]

    test "deletes chosen shop_payment_method", %{conn: conn, shop_payment_method: shop_payment_method} do
      conn = delete(conn, Routes.shop_payment_method_path(conn, :delete, shop_payment_method))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.shop_payment_method_path(conn, :show, shop_payment_method))
      end
    end
  end

  defp create_shop_payment_method(_) do
    shop_payment_method = fixture(:shop_payment_method)
    %{shop_payment_method: shop_payment_method}
  end
end
