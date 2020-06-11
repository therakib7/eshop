defmodule EshopWeb.Schema.Types.InvoiceItemVariant do
  use Absinthe.Schema.Notation

  @desc "A invoice_item_variant"
  object :invoice_item_variant do
    field :id, :integer
    field :invoice_item_id, :integer
    field :variant_id, :integer
    field :variant_value_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A invoice_item_variant update"
  input_object :invoice_item_variant_params do
    field :invoice_item_id, :integer
    field :variant_id, :integer
    field :variant_value_id, :integer
  end
end
