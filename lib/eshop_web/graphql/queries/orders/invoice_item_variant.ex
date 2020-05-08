defmodule EshopWeb.Schema.Queries.InvoiceItemVariant do 
  use Absinthe.Schema.Notation

  object :invoice_item_variant_queries do
    @desc "Get all invoice_item_variants"
    field :invoice_item_variants, list_of(:invoice_item_variant) do
      resolve &EshopWeb.Schema.Resolvers.InvoiceItemVariant.list_invoice_item_variants/3
    end
  end 
end
