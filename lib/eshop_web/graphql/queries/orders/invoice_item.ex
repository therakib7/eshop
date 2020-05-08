defmodule EshopWeb.Schema.Queries.InvoiceItem do 
  use Absinthe.Schema.Notation

  object :invoice_item_queries do
    @desc "Get all invoice_items"
    field :invoice_items, list_of(:invoice_item) do
      resolve &EshopWeb.Schema.Resolvers.InvoiceItem.list_invoice_items/3
    end
  end 
end
