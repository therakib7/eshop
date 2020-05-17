defmodule EshopWeb.TrackingInvoiceView do
  use EshopWeb, :view
  alias EshopWeb.TrackingInvoiceView

  def render("index.json", %{tracking_invoices: tracking_invoices}) do
    %{data: render_many(tracking_invoices, TrackingInvoiceView, "tracking_invoice.json")}
  end

  def render("show.json", %{tracking_invoice: tracking_invoice}) do
    %{data: render_one(tracking_invoice, TrackingInvoiceView, "tracking_invoice.json")}
  end

  def render("tracking_invoice.json", %{tracking_invoice: tracking_invoice}) do
    %{id: tracking_invoice.id, tracking_id: tracking_invoice.tracking_id}
  end
end
