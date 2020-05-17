defmodule EshopWeb.Schema.Queries.InvoiceItem do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.InvoiceItem, as: InvoiceItem

  object :invoice_item_queries do
    @desc "Get all invoice_items"
    field :invoice_items, list_of(:invoice_item) do
      resolve(&InvoiceItem.list_invoice_items/3)
    end

    @desc "Get a invoice_item by its id"
    field :invoice_item, :invoice_item do
      arg(:id, non_null(:id))
      resolve(&InvoiceItem.get_invoice_item/3)
    end
  end
end
