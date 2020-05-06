defmodule EshopWeb.ShippingMethodControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Shipments
  alias Eshop.Shipments.ShippingMethod

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

  def fixture(:shipping_method) do
    {:ok, shipping_method} = Shipments.create_shipping_method(@create_attrs)
    shipping_method
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shipping_methods", %{conn: conn} do
      conn = get(conn, Routes.shipping_method_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create shipping_method" do
    test "renders shipping_method when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shipping_method_path(conn, :create), shipping_method: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.shipping_method_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_active" => true,
               "name" => "some name",
               "native_name" => "some native_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shipping_method_path(conn, :create), shipping_method: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update shipping_method" do
    setup [:create_shipping_method]

    test "renders shipping_method when data is valid", %{conn: conn, shipping_method: %ShippingMethod{id: id} = shipping_method} do
      conn = put(conn, Routes.shipping_method_path(conn, :update, shipping_method), shipping_method: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.shipping_method_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_active" => false,
               "name" => "some updated name",
               "native_name" => "some updated native_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, shipping_method: shipping_method} do
      conn = put(conn, Routes.shipping_method_path(conn, :update, shipping_method), shipping_method: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete shipping_method" do
    setup [:create_shipping_method]

    test "deletes chosen shipping_method", %{conn: conn, shipping_method: shipping_method} do
      conn = delete(conn, Routes.shipping_method_path(conn, :delete, shipping_method))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.shipping_method_path(conn, :show, shipping_method))
      end
    end
  end

  defp create_shipping_method(_) do
    shipping_method = fixture(:shipping_method)
    %{shipping_method: shipping_method}
  end
end
