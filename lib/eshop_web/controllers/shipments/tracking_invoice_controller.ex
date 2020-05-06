defmodule EshopWeb.TrackingInvoiceController do
  use EshopWeb, :controller

  alias Eshop.Shipments
  alias Eshop.Shipments.TrackingInvoice

  action_fallback EshopWeb.FallbackController

  def index(conn, _params) do
    tracking_invoices = Shipments.list_tracking_invoices()
    render(conn, "index.json", tracking_invoices: tracking_invoices)
  end

  def create(conn, %{"tracking_invoice" => tracking_invoice_params}) do
    with {:ok, %TrackingInvoice{} = tracking_invoice} <- Shipments.create_tracking_invoice(tracking_invoice_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tracking_invoice_path(conn, :show, tracking_invoice))
      |> render("show.json", tracking_invoice: tracking_invoice)
    end
  end

  def show(conn, %{"id" => id}) do
    tracking_invoice = Shipments.get_tracking_invoice!(id)
    render(conn, "show.json", tracking_invoice: tracking_invoice)
  end

  def update(conn, %{"id" => id, "tracking_invoice" => tracking_invoice_params}) do
    tracking_invoice = Shipments.get_tracking_invoice!(id)

    with {:ok, %TrackingInvoice{} = tracking_invoice} <- Shipments.update_tracking_invoice(tracking_invoice, tracking_invoice_params) do
      render(conn, "show.json", tracking_invoice: tracking_invoice)
    end
  end

  def delete(conn, %{"id" => id}) do
    tracking_invoice = Shipments.get_tracking_invoice!(id)

    with {:ok, %TrackingInvoice{}} <- Shipments.delete_tracking_invoice(tracking_invoice) do
      send_resp(conn, :no_content, "")
    end
  end
end
