defmodule EshopWeb.Schema.Types.InvoiceItem do
  use Absinthe.Schema.Notation

  @desc "A invoice_item"
  object :invoice_item do
    field :id, :integer
    field :price, :decimal
    field :qty, :integer
    field :shipping_charge, :decimal
    field :status, :integer
    field :vat, :decimal
    field :vat_type, :integer
    field :item_id, :id
    field :invoice_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A invoice_item update"
  input_object :invoice_item_params do 
    field :price, :decimal
    field :qty, :integer
    field :shipping_charge, :decimal
    field :status, :integer
    field :vat, :decimal
    field :vat_type, :integer
    field :item_id, :id
    field :invoice_id, :id
  end
end