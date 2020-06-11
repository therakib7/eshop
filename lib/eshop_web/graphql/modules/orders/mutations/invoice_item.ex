defmodule EshopWeb.Schema.Mutations.InvoiceItem do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.InvoiceItem, as: InvoiceItem

  object :invoice_item_mutations do
    @desc "Create a invoice_item"
    field :create_invoice_item, type: :invoice_item do
      arg(:id, :integer)
      arg(:price, :decimal)
      arg(:qty, :integer)
      arg(:shipping_charge, :decimal)
      arg(:status, :integer)
      arg(:vat, :decimal)
      arg(:vat_type, :integer)
      arg(:item_id, :integer)
      arg(:invoice_id, :integer)

      resolve(&InvoiceItem.create_invoice_item/3)
    end

    @desc "Update a invoice_item"
    field :update_invoice_item, type: :invoice_item do
      arg(:id, non_null(:id))
      arg(:invoice_item_params, :invoice_item_params)

      resolve(&InvoiceItem.update_invoice_item/2)
    end

    @desc "Delete a invoice_item"
    field :delete_invoice_item, type: :invoice_item do
      arg(:id, non_null(:id))
      resolve(&InvoiceItem.delete_invoice_item/2)
    end
  end
end
