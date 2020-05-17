defmodule EshopWeb.Schema.Queries.InvoiceItemVariant do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.InvoiceItemVariant, as: InvoiceItemVariant

  object :invoice_item_variant_queries do
    @desc "Get all invoice_item_variants"
    field :invoice_item_variants, list_of(:invoice_item_variant) do
      resolve(&InvoiceItemVariant.list_invoice_item_variants/3)
    end

    @desc "Get a invoice_item_variant by its id"
    field :invoice_item_variant, :invoice_item_variant do
      arg(:id, non_null(:id))
      resolve(&InvoiceItemVariant.get_invoice_item_variant/3)
    end
  end
end
