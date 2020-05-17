defmodule EshopWeb.InvoiceItemVariantControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Orders
  alias Eshop.Orders.InvoiceItemVariant

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:invoice_item_variant) do
    {:ok, invoice_item_variant} = Orders.create_invoice_item_variant(@create_attrs)
    invoice_item_variant
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all invoice_item_variants", %{conn: conn} do
      conn = get(conn, Routes.invoice_item_variant_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create invoice_item_variant" do
    test "renders invoice_item_variant when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.invoice_item_variant_path(conn, :create),
          invoice_item_variant: @create_attrs
        )

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.invoice_item_variant_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.invoice_item_variant_path(conn, :create),
          invoice_item_variant: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update invoice_item_variant" do
    setup [:create_invoice_item_variant]

    test "renders invoice_item_variant when data is valid", %{
      conn: conn,
      invoice_item_variant: %InvoiceItemVariant{id: id} = invoice_item_variant
    } do
      conn =
        put(conn, Routes.invoice_item_variant_path(conn, :update, invoice_item_variant),
          invoice_item_variant: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.invoice_item_variant_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      invoice_item_variant: invoice_item_variant
    } do
      conn =
        put(conn, Routes.invoice_item_variant_path(conn, :update, invoice_item_variant),
          invoice_item_variant: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete invoice_item_variant" do
    setup [:create_invoice_item_variant]

    test "deletes chosen invoice_item_variant", %{
      conn: conn,
      invoice_item_variant: invoice_item_variant
    } do
      conn = delete(conn, Routes.invoice_item_variant_path(conn, :delete, invoice_item_variant))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.invoice_item_variant_path(conn, :show, invoice_item_variant))
      end
    end
  end

  defp create_invoice_item_variant(_) do
    invoice_item_variant = fixture(:invoice_item_variant)
    %{invoice_item_variant: invoice_item_variant}
  end
end
