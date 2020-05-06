defmodule EshopWeb.InvoiceView do
  use EshopWeb, :view
  alias EshopWeb.InvoiceView

  def render("index.json", %{invoices: invoices}) do
    %{data: render_many(invoices, InvoiceView, "invoice.json")}
  end

  def render("show.json", %{invoice: invoice}) do
    %{data: render_one(invoice, InvoiceView, "invoice.json")}
  end

  def render("invoice.json", %{invoice: invoice}) do
    %{id: invoice.id,
      type: invoice.type,
      total: invoice.total,
      discount: invoice.discount,
      note: invoice.note,
      paid: invoice.paid}
  end
end
