defmodule EshopWeb.PackageItemControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Components
  alias Eshop.Components.PackageItem

  @create_attrs %{
    name: "some name",
    native_name: "some native_name"
  }
  @update_attrs %{
    name: "some updated name",
    native_name: "some updated native_name"
  }
  @invalid_attrs %{name: nil, native_name: nil}

  def fixture(:package_item) do
    {:ok, package_item} = Components.create_package_item(@create_attrs)
    package_item
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all package_items", %{conn: conn} do
      conn = get(conn, Routes.package_item_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create package_item" do
    test "renders package_item when data is valid", %{conn: conn} do
      conn = post(conn, Routes.package_item_path(conn, :create), package_item: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.package_item_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "native_name" => "some native_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.package_item_path(conn, :create), package_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update package_item" do
    setup [:create_package_item]

    test "renders package_item when data is valid", %{
      conn: conn,
      package_item: %PackageItem{id: id} = package_item
    } do
      conn =
        put(conn, Routes.package_item_path(conn, :update, package_item),
          package_item: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.package_item_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "native_name" => "some updated native_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, package_item: package_item} do
      conn =
        put(conn, Routes.package_item_path(conn, :update, package_item),
          package_item: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete package_item" do
    setup [:create_package_item]

    test "deletes chosen package_item", %{conn: conn, package_item: package_item} do
      conn = delete(conn, Routes.package_item_path(conn, :delete, package_item))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.package_item_path(conn, :show, package_item))
      end
    end
  end

  defp create_package_item(_) do
    package_item = fixture(:package_item)
    %{package_item: package_item}
  end
end
