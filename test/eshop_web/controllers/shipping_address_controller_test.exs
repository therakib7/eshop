defmodule EshopWeb.ShippingAddressControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Shipments
  alias Eshop.Shipments.ShippingAddress

  @create_attrs %{
    address: "some address",
    lat: 120.5,
    long: 120.5
  }
  @update_attrs %{
    address: "some updated address",
    lat: 456.7,
    long: 456.7
  }
  @invalid_attrs %{address: nil, lat: nil, long: nil}

  def fixture(:shipping_address) do
    {:ok, shipping_address} = Shipments.create_shipping_address(@create_attrs)
    shipping_address
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shipping_addresses", %{conn: conn} do
      conn = get(conn, Routes.shipping_address_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create shipping_address" do
    test "renders shipping_address when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.shipping_address_path(conn, :create), shipping_address: @create_attrs)

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.shipping_address_path(conn, :show, id))

      assert %{
               "id" => id,
               "address" => "some address",
               "lat" => 120.5,
               "long" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.shipping_address_path(conn, :create), shipping_address: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update shipping_address" do
    setup [:create_shipping_address]

    test "renders shipping_address when data is valid", %{
      conn: conn,
      shipping_address: %ShippingAddress{id: id} = shipping_address
    } do
      conn =
        put(conn, Routes.shipping_address_path(conn, :update, shipping_address),
          shipping_address: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.shipping_address_path(conn, :show, id))

      assert %{
               "id" => id,
               "address" => "some updated address",
               "lat" => 456.7,
               "long" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, shipping_address: shipping_address} do
      conn =
        put(conn, Routes.shipping_address_path(conn, :update, shipping_address),
          shipping_address: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete shipping_address" do
    setup [:create_shipping_address]

    test "deletes chosen shipping_address", %{conn: conn, shipping_address: shipping_address} do
      conn = delete(conn, Routes.shipping_address_path(conn, :delete, shipping_address))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.shipping_address_path(conn, :show, shipping_address))
      end
    end
  end

  defp create_shipping_address(_) do
    shipping_address = fixture(:shipping_address)
    %{shipping_address: shipping_address}
  end
end
