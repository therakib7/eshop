defmodule EshopWeb.InvoiceItemView do
  use EshopWeb, :view
  alias EshopWeb.InvoiceItemView

  def render("index.json", %{invoice_items: invoice_items}) do
    %{data: render_many(invoice_items, InvoiceItemView, "invoice_item.json")}
  end

  def render("show.json", %{invoice_item: invoice_item}) do
    %{data: render_one(invoice_item, InvoiceItemView, "invoice_item.json")}
  end

  def render("invoice_item.json", %{invoice_item: invoice_item}) do
    %{
      id: invoice_item.id,
      qty: invoice_item.qty,
      price: invoice_item.price,
      vat: invoice_item.vat,
      vat_type: invoice_item.vat_type,
      shipping_charge: invoice_item.shipping_charge,
      status: invoice_item.status
    }
  end
end
