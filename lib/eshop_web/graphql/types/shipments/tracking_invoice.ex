defmodule EshopWeb.Schema.Types.TrackingInvoice do
  use Absinthe.Schema.Notation
  
  object "tracking_invoice" do
    field :id, :integer
    field :tracking_id, :string
    field :invoice_id, :id
    field :shipping_method_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
