defmodule EshopWeb.InvoiceItemControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Orders
  alias Eshop.Orders.InvoiceItem

  @create_attrs %{
    price: "120.5",
    qty: 42,
    shipping_charge: "120.5",
    status: 42,
    vat: "120.5",
    vat_type: 42
  }
  @update_attrs %{
    price: "456.7",
    qty: 43,
    shipping_charge: "456.7",
    status: 43,
    vat: "456.7",
    vat_type: 43
  }
  @invalid_attrs %{price: nil, qty: nil, shipping_charge: nil, status: nil, vat: nil, vat_type: nil}

  def fixture(:invoice_item) do
    {:ok, invoice_item} = Orders.create_invoice_item(@create_attrs)
    invoice_item
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all invoice_items", %{conn: conn} do
      conn = get(conn, Routes.invoice_item_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create invoice_item" do
    test "renders invoice_item when data is valid", %{conn: conn} do
      conn = post(conn, Routes.invoice_item_path(conn, :create), invoice_item: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.invoice_item_path(conn, :show, id))

      assert %{
               "id" => id,
               "price" => "120.5",
               "qty" => 42,
               "shipping_charge" => "120.5",
               "status" => 42,
               "vat" => "120.5",
               "vat_type" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.invoice_item_path(conn, :create), invoice_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update invoice_item" do
    setup [:create_invoice_item]

    test "renders invoice_item when data is valid", %{conn: conn, invoice_item: %InvoiceItem{id: id} = invoice_item} do
      conn = put(conn, Routes.invoice_item_path(conn, :update, invoice_item), invoice_item: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.invoice_item_path(conn, :show, id))

      assert %{
               "id" => id,
               "price" => "456.7",
               "qty" => 43,
               "shipping_charge" => "456.7",
               "status" => 43,
               "vat" => "456.7",
               "vat_type" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, invoice_item: invoice_item} do
      conn = put(conn, Routes.invoice_item_path(conn, :update, invoice_item), invoice_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete invoice_item" do
    setup [:create_invoice_item]

    test "deletes chosen invoice_item", %{conn: conn, invoice_item: invoice_item} do
      conn = delete(conn, Routes.invoice_item_path(conn, :delete, invoice_item))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.invoice_item_path(conn, :show, invoice_item))
      end
    end
  end

  defp create_invoice_item(_) do
    invoice_item = fixture(:invoice_item)
    %{invoice_item: invoice_item}
  end
end
