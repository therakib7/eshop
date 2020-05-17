defmodule EshopWeb.InvoiceStatusView do
  use EshopWeb, :view
  alias EshopWeb.InvoiceStatusView

  def render("index.json", %{invoice_statuses: invoice_statuses}) do
    %{data: render_many(invoice_statuses, InvoiceStatusView, "invoice_status.json")}
  end

  def render("show.json", %{invoice_status: invoice_status}) do
    %{data: render_one(invoice_status, InvoiceStatusView, "invoice_status.json")}
  end

  def render("invoice_status.json", %{invoice_status: invoice_status}) do
    %{id: invoice_status.id, type: invoice_status.type, type_id: invoice_status.type_id}
  end
end
