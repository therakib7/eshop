defmodule EshopWeb.InvoiceController do
  use EshopWeb, :controller

  alias Eshop.Orders
  alias Eshop.Orders.Invoice

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    invoices = Orders.list_invoices()
    render(conn, "index.json", invoices: invoices)
  end

  def create(conn, %{"invoice" => invoice_params}) do
    with {:ok, %Invoice{} = invoice} <- Orders.create_invoice(invoice_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.invoice_path(conn, :show, invoice))
      |> render("show.json", invoice: invoice)
    end
  end

  def show(conn, %{"id" => id}) do
    invoice = Orders.get_invoice!(id)
    render(conn, "show.json", invoice: invoice)
  end

  def update(conn, %{"id" => id, "invoice" => invoice_params}) do
    invoice = Orders.get_invoice!(id)

    with {:ok, %Invoice{} = invoice} <- Orders.update_invoice(invoice, invoice_params) do
      render(conn, "show.json", invoice: invoice)
    end
  end

  def delete(conn, %{"id" => id}) do
    invoice = Orders.get_invoice!(id)

    with {:ok, %Invoice{}} <- Orders.delete_invoice(invoice) do
      send_resp(conn, :no_content, "")
    end
  end
end
