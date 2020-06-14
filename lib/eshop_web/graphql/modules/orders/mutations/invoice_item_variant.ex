defmodule EshopWeb.Schema.Mutations.InvoiceItemVariant do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.InvoiceItemVariant, as: InvoiceItemVariant

  object :invoice_item_variant_mutations do
    @desc "Create a invoice_item_variant"
    field :create_invoice_item_variant, type: :invoice_item_variant do
      arg(:id, :integer)
      arg(:invoice_item_id, :integer)
      arg(:variant_id, :integer)
      arg(:variant_value_id, :integer)

      resolve(&InvoiceItemVariant.create_invoice_item_variant/3)
    end

    @desc "Update a invoice_item_variant"
    field :update_invoice_item_variant, type: :invoice_item_variant do
      arg(:id, non_null(:id))
      arg(:invoice_item_variant_params, :invoice_item_variant_params)

      resolve(&InvoiceItemVariant.update_invoice_item_variant/2)
    end

    @desc "Delete a invoice_item_variant"
    field :delete_invoice_item_variant, type: :invoice_item_variant do
      arg(:id, non_null(:id))
      resolve(&InvoiceItemVariant.delete_invoice_item_variant/2)
    end
  end
end
