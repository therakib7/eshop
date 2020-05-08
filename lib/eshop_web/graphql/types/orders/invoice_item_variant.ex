defmodule EshopWeb.Schema.Types.InvoiceItemVariant do
  use Absinthe.Schema.Notation
  
  object "invoice_item_variant" do
    field :id, :integer
    field :invoice_item_id, :id
    field :variant_id, :id
    field :variant_value_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
