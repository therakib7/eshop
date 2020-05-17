defmodule EshopWeb.ItemLocationControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Geo
  alias Eshop.Geo.ItemLocation

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:item_location) do
    {:ok, item_location} = Geo.create_item_location(@create_attrs)
    item_location
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all item_locations", %{conn: conn} do
      conn = get(conn, Routes.item_location_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create item_location" do
    test "renders item_location when data is valid", %{conn: conn} do
      conn = post(conn, Routes.item_location_path(conn, :create), item_location: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.item_location_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.item_location_path(conn, :create), item_location: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update item_location" do
    setup [:create_item_location]

    test "renders item_location when data is valid", %{
      conn: conn,
      item_location: %ItemLocation{id: id} = item_location
    } do
      conn =
        put(conn, Routes.item_location_path(conn, :update, item_location),
          item_location: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.item_location_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, item_location: item_location} do
      conn =
        put(conn, Routes.item_location_path(conn, :update, item_location),
          item_location: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete item_location" do
    setup [:create_item_location]

    test "deletes chosen item_location", %{conn: conn, item_location: item_location} do
      conn = delete(conn, Routes.item_location_path(conn, :delete, item_location))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.item_location_path(conn, :show, item_location))
      end
    end
  end

  defp create_item_location(_) do
    item_location = fixture(:item_location)
    %{item_location: item_location}
  end
end
