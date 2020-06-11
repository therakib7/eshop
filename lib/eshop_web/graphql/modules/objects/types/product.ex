defmodule EshopWeb.Schema.Types.Product do
  use Absinthe.Schema.Notation

  @desc "A product"
  object :product do
    field :id, :integer
    field :barcode, :string
    field :exp_date, :naive_datetime
    field :mfg_date, :naive_datetime
    field :sku, :string
    field :brand_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A product update"
  input_object :product_params do
    field :barcode, :string
    field :exp_date, :naive_datetime
    field :mfg_date, :naive_datetime
    field :sku, :string
    field :brand_id, :integer
  end
end
