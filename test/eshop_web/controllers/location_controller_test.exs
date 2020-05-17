defmodule EshopWeb.LocationControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Geo
  alias Eshop.Geo.Location

  @create_attrs %{
    code: "some code",
    country_id: 42,
    is_active: true,
    lat: 120.5,
    long: 120.5,
    name: "some name",
    native_name: "some native_name",
    order: 42,
    parent_id: 42,
    stage_id: 42,
    user_id: 42,
    web: "some web"
  }
  @update_attrs %{
    code: "some updated code",
    country_id: 43,
    is_active: false,
    lat: 456.7,
    long: 456.7,
    name: "some updated name",
    native_name: "some updated native_name",
    order: 43,
    parent_id: 43,
    stage_id: 43,
    user_id: 43,
    web: "some updated web"
  }
  @invalid_attrs %{
    code: nil,
    country_id: nil,
    is_active: nil,
    lat: nil,
    long: nil,
    name: nil,
    native_name: nil,
    order: nil,
    parent_id: nil,
    stage_id: nil,
    user_id: nil,
    web: nil
  }

  def fixture(:location) do
    {:ok, location} = Geo.create_location(@create_attrs)
    location
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all locations", %{conn: conn} do
      conn = get(conn, Routes.location_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create location" do
    test "renders location when data is valid", %{conn: conn} do
      conn = post(conn, Routes.location_path(conn, :create), location: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.location_path(conn, :show, id))

      assert %{
               "id" => id,
               "code" => "some code",
               "country_id" => 42,
               "is_active" => true,
               "lat" => 120.5,
               "long" => 120.5,
               "name" => "some name",
               "native_name" => "some native_name",
               "order" => 42,
               "parent_id" => 42,
               "stage_id" => 42,
               "user_id" => 42,
               "web" => "some web"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.location_path(conn, :create), location: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update location" do
    setup [:create_location]

    test "renders location when data is valid", %{
      conn: conn,
      location: %Location{id: id} = location
    } do
      conn = put(conn, Routes.location_path(conn, :update, location), location: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.location_path(conn, :show, id))

      assert %{
               "id" => id,
               "code" => "some updated code",
               "country_id" => 43,
               "is_active" => false,
               "lat" => 456.7,
               "long" => 456.7,
               "name" => "some updated name",
               "native_name" => "some updated native_name",
               "order" => 43,
               "parent_id" => 43,
               "stage_id" => 43,
               "user_id" => 43,
               "web" => "some updated web"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, location: location} do
      conn = put(conn, Routes.location_path(conn, :update, location), location: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete location" do
    setup [:create_location]

    test "deletes chosen location", %{conn: conn, location: location} do
      conn = delete(conn, Routes.location_path(conn, :delete, location))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.location_path(conn, :show, location))
      end
    end
  end

  defp create_location(_) do
    location = fixture(:location)
    %{location: location}
  end
end
