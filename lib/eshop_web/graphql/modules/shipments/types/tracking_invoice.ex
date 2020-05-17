defmodule EshopWeb.Schema.Types.TrackingInvoice do
  use Absinthe.Schema.Notation

  @desc "A tracking_invoice"
  object :tracking_invoice do
    field :id, :integer
    field :tracking_id, :string
    field :invoice_id, :id
    field :shipping_method_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A tracking_invoice update"
  input_object :tracking_invoice_params do
    field :tracking_id, :string
    field :invoice_id, :id
    field :shipping_method_id, :id
  end
end
