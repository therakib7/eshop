defmodule Eshop.Components.Variant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "variants" do
    field :order, :integer
    field :name, :string
    field :native_name, :string
    field :type, :integer
    field :shop_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(variant, attrs) do
    variant
    |> cast(attrs, [:order, :name, :native_name, :type])
    |> validate_required([:name, :native_name, :type])
  end
end
