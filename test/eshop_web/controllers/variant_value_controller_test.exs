defmodule EshopWeb.VariantValueControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Components
  alias Eshop.Components.VariantValue

  @create_attrs %{
    native_value: "some native_value",
    value: "some value"
  }
  @update_attrs %{
    native_value: "some updated native_value",
    value: "some updated value"
  }
  @invalid_attrs %{native_value: nil, value: nil}

  def fixture(:variant_value) do
    {:ok, variant_value} = Components.create_variant_value(@create_attrs)
    variant_value
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all variant_values", %{conn: conn} do
      conn = get(conn, Routes.variant_value_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create variant_value" do
    test "renders variant_value when data is valid", %{conn: conn} do
      conn = post(conn, Routes.variant_value_path(conn, :create), variant_value: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.variant_value_path(conn, :show, id))

      assert %{
               "id" => id,
               "native_value" => "some native_value",
               "value" => "some value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.variant_value_path(conn, :create), variant_value: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update variant_value" do
    setup [:create_variant_value]

    test "renders variant_value when data is valid", %{
      conn: conn,
      variant_value: %VariantValue{id: id} = variant_value
    } do
      conn =
        put(conn, Routes.variant_value_path(conn, :update, variant_value),
          variant_value: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.variant_value_path(conn, :show, id))

      assert %{
               "id" => id,
               "native_value" => "some updated native_value",
               "value" => "some updated value"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, variant_value: variant_value} do
      conn =
        put(conn, Routes.variant_value_path(conn, :update, variant_value),
          variant_value: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete variant_value" do
    setup [:create_variant_value]

    test "deletes chosen variant_value", %{conn: conn, variant_value: variant_value} do
      conn = delete(conn, Routes.variant_value_path(conn, :delete, variant_value))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.variant_value_path(conn, :show, variant_value))
      end
    end
  end

  defp create_variant_value(_) do
    variant_value = fixture(:variant_value)
    %{variant_value: variant_value}
  end
end
