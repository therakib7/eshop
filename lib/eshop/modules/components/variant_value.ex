defmodule Eshop.Components.VariantValue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "variant_values" do
    field :native_value, :string
    field :value, :string
    field :variant_id, :id

    timestamps()
  end

  @doc false
  def changeset(variant_value, attrs) do
    variant_value
    |> cast(attrs, [:value, :native_value])
    |> validate_required([:value, :native_value])
  end
end
