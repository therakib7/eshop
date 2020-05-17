defmodule EshopWeb.InvoiceItemController do
  use EshopWeb, :controller

  alias Eshop.Orders
  alias Eshop.Orders.InvoiceItem

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    invoice_items = Orders.list_invoice_items()
    render(conn, "index.json", invoice_items: invoice_items)
  end

  def create(conn, %{"invoice_item" => invoice_item_params}) do
    with {:ok, %InvoiceItem{} = invoice_item} <- Orders.create_invoice_item(invoice_item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.invoice_item_path(conn, :show, invoice_item))
      |> render("show.json", invoice_item: invoice_item)
    end
  end

  def show(conn, %{"id" => id}) do
    invoice_item = Orders.get_invoice_item!(id)
    render(conn, "show.json", invoice_item: invoice_item)
  end

  def update(conn, %{"id" => id, "invoice_item" => invoice_item_params}) do
    invoice_item = Orders.get_invoice_item!(id)

    with {:ok, %InvoiceItem{} = invoice_item} <-
           Orders.update_invoice_item(invoice_item, invoice_item_params) do
      render(conn, "show.json", invoice_item: invoice_item)
    end
  end

  def delete(conn, %{"id" => id}) do
    invoice_item = Orders.get_invoice_item!(id)

    with {:ok, %InvoiceItem{}} <- Orders.delete_invoice_item(invoice_item) do
      send_resp(conn, :no_content, "")
    end
  end
end
