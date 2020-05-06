defmodule EshopWeb.InvoiceControllerTest do
  use EshopWeb.ConnCase

  alias Eshop.Orders
  alias Eshop.Orders.Invoice

  @create_attrs %{
    discount: "120.5",
    note: "some note",
    paid: "120.5",
    total: "120.5",
    type: 42
  }
  @update_attrs %{
    discount: "456.7",
    note: "some updated note",
    paid: "456.7",
    total: "456.7",
    type: 43
  }
  @invalid_attrs %{discount: nil, note: nil, paid: nil, total: nil, type: nil}

  def fixture(:invoice) do
    {:ok, invoice} = Orders.create_invoice(@create_attrs)
    invoice
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all invoices", %{conn: conn} do
      conn = get(conn, Routes.invoice_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create invoice" do
    test "renders invoice when data is valid", %{conn: conn} do
      conn = post(conn, Routes.invoice_path(conn, :create), invoice: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.invoice_path(conn, :show, id))

      assert %{
               "id" => id,
               "discount" => "120.5",
               "note" => "some note",
               "paid" => "120.5",
               "total" => "120.5",
               "type" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.invoice_path(conn, :create), invoice: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update invoice" do
    setup [:create_invoice]

    test "renders invoice when data is valid", %{conn: conn, invoice: %Invoice{id: id} = invoice} do
      conn = put(conn, Routes.invoice_path(conn, :update, invoice), invoice: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.invoice_path(conn, :show, id))

      assert %{
               "id" => id,
               "discount" => "456.7",
               "note" => "some updated note",
               "paid" => "456.7",
               "total" => "456.7",
               "type" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, invoice: invoice} do
      conn = put(conn, Routes.invoice_path(conn, :update, invoice), invoice: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete invoice" do
    setup [:create_invoice]

    test "deletes chosen invoice", %{conn: conn, invoice: invoice} do
      conn = delete(conn, Routes.invoice_path(conn, :delete, invoice))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.invoice_path(conn, :show, invoice))
      end
    end
  end

  defp create_invoice(_) do
    invoice = fixture(:invoice)
    %{invoice: invoice}
  end
end
