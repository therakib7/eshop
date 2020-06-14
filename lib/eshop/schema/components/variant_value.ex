defmodule Eshop.Components.VariantValue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "variant_values" do
    field :native_value, :string
    field :value, :string
    belongs_to :variant, Eshop.Components.Variant

    timestamps()
  end

  @doc false
  def changeset(variant_value, attrs) do
    variant_value
    |> cast(attrs, [:value, :native_value, :variant_id])
    |> validate_required([:value, :native_value, :variant_id])
    |> validate_length(:value, min: 2, max: 200)
    |> validate_length(:native_value, min: 2, max: 200)
  end
end
