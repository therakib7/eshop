defmodule Eshop.Components.Package do
  use Ecto.Schema
  import Ecto.Changeset

  schema "packages" do
    field :cost_price, :decimal
    field :sale_price, :decimal
    field :unit_price, :decimal
    field :item_id, :id

    timestamps()
  end

  @doc false
  def changeset(package, attrs) do
    package
    |> cast(attrs, [:cost_price, :unit_price, :sale_price])
    |> validate_required([:cost_price, :unit_price, :sale_price])
  end
end
