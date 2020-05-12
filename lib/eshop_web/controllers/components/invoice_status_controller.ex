defmodule EshopWeb.InvoiceStatusController do
  use EshopWeb, :controller

  alias Eshop.Components
  alias Eshop.Components.InvoiceStatus

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    invoice_statuses = Components.list_invoice_statuses()
    render(conn, "index.json", invoice_statuses: invoice_statuses)
  end

  def create(conn, %{"invoice_status" => invoice_status_params}) do
    with {:ok, %InvoiceStatus{} = invoice_status} <- Components.create_invoice_status(invoice_status_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.invoice_status_path(conn, :show, invoice_status))
      |> render("show.json", invoice_status: invoice_status)
    end
  end

  def show(conn, %{"id" => id}) do
    invoice_status = Components.get_invoice_status!(id)
    render(conn, "show.json", invoice_status: invoice_status)
  end

  def update(conn, %{"id" => id, "invoice_status" => invoice_status_params}) do
    invoice_status = Components.get_invoice_status!(id)

    with {:ok, %InvoiceStatus{} = invoice_status} <- Components.update_invoice_status(invoice_status, invoice_status_params) do
      render(conn, "show.json", invoice_status: invoice_status)
    end
  end

  def delete(conn, %{"id" => id}) do
    invoice_status = Components.get_invoice_status!(id)

    with {:ok, %InvoiceStatus{}} <- Components.delete_invoice_status(invoice_status) do
      send_resp(conn, :no_content, "")
    end
  end
end
