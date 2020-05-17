defmodule EshopWeb.ShopLocationControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Geo
  alias Eshop.Geo.ShopLocation

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:shop_location) do
    {:ok, shop_location} = Geo.create_shop_location(@create_attrs)
    shop_location
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shop_locations", %{conn: conn} do
      conn = get(conn, Routes.shop_location_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create shop_location" do
    test "renders shop_location when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shop_location_path(conn, :create), shop_location: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.shop_location_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shop_location_path(conn, :create), shop_location: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update shop_location" do
    setup [:create_shop_location]

    test "renders shop_location when data is valid", %{
      conn: conn,
      shop_location: %ShopLocation{id: id} = shop_location
    } do
      conn =
        put(conn, Routes.shop_location_path(conn, :update, shop_location),
          shop_location: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.shop_location_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, shop_location: shop_location} do
      conn =
        put(conn, Routes.shop_location_path(conn, :update, shop_location),
          shop_location: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete shop_location" do
    setup [:create_shop_location]

    test "deletes chosen shop_location", %{conn: conn, shop_location: shop_location} do
      conn = delete(conn, Routes.shop_location_path(conn, :delete, shop_location))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.shop_location_path(conn, :show, shop_location))
      end
    end
  end

  defp create_shop_location(_) do
    shop_location = fixture(:shop_location)
    %{shop_location: shop_location}
  end
end
