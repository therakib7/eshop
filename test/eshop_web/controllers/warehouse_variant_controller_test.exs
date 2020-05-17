defmodule EshopWeb.WarehouseVariantControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Companies
  alias Eshop.Companies.WarehouseVariant

  @create_attrs %{
    name: "some name",
    native_name: "some native_name",
    type: 42
  }
  @update_attrs %{
    name: "some updated name",
    native_name: "some updated native_name",
    type: 43
  }
  @invalid_attrs %{name: nil, native_name: nil, type: nil}

  def fixture(:warehouse_variant) do
    {:ok, warehouse_variant} = Companies.create_warehouse_variant(@create_attrs)
    warehouse_variant
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all warehouse_variants", %{conn: conn} do
      conn = get(conn, Routes.warehouse_variant_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create warehouse_variant" do
    test "renders warehouse_variant when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.warehouse_variant_path(conn, :create), warehouse_variant: @create_attrs)

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.warehouse_variant_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "native_name" => "some native_name",
               "type" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.warehouse_variant_path(conn, :create), warehouse_variant: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update warehouse_variant" do
    setup [:create_warehouse_variant]

    test "renders warehouse_variant when data is valid", %{
      conn: conn,
      warehouse_variant: %WarehouseVariant{id: id} = warehouse_variant
    } do
      conn =
        put(conn, Routes.warehouse_variant_path(conn, :update, warehouse_variant),
          warehouse_variant: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.warehouse_variant_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "native_name" => "some updated native_name",
               "type" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      warehouse_variant: warehouse_variant
    } do
      conn =
        put(conn, Routes.warehouse_variant_path(conn, :update, warehouse_variant),
          warehouse_variant: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete warehouse_variant" do
    setup [:create_warehouse_variant]

    test "deletes chosen warehouse_variant", %{conn: conn, warehouse_variant: warehouse_variant} do
      conn = delete(conn, Routes.warehouse_variant_path(conn, :delete, warehouse_variant))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.warehouse_variant_path(conn, :show, warehouse_variant))
      end
    end
  end

  defp create_warehouse_variant(_) do
    warehouse_variant = fixture(:warehouse_variant)
    %{warehouse_variant: warehouse_variant}
  end
end
