defmodule EshopWeb.InvoiceItemVariantView do
  use EshopWeb, :view
  alias EshopWeb.InvoiceItemVariantView

  def render("index.json", %{invoice_item_variants: invoice_item_variants}) do
    %{
      data:
        render_many(invoice_item_variants, InvoiceItemVariantView, "invoice_item_variant.json")
    }
  end

  def render("show.json", %{invoice_item_variant: invoice_item_variant}) do
    %{data: render_one(invoice_item_variant, InvoiceItemVariantView, "invoice_item_variant.json")}
  end

  def render("invoice_item_variant.json", %{invoice_item_variant: invoice_item_variant}) do
    %{id: invoice_item_variant.id}
  end
end
