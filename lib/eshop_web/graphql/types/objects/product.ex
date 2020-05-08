defmodule EshopWeb.Schema.Types.Product do
  use Absinthe.Schema.Notation
  
  object "product" do
    field :id, :integer
    field :barcode, :string
    field :exp_date, :naive_datetime
    field :mfg_date, :naive_datetime
    field :sku, :string
    field :brand_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
