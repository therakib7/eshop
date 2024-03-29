defmodule Eshop.Objects.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :barcode, :string
    field :exp_date, :naive_datetime
    field :mfg_date, :naive_datetime
    field :sku, :string
    belongs_to :item, Eshop.Objects.Item

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:mfg_date, :exp_date, :sku, :barcode, :item_id])
    |> validate_required([:mfg_date, :exp_date, :sku, :barcode])
  end
end
