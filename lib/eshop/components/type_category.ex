defmodule Eshop.Components.TypeCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "type_categories" do
    field :type, :integer
    field :type_id, :integer
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(type_category, attrs) do
    type_category
    |> cast(attrs, [:type, :type_id])
    |> validate_required([:type, :type_id])
  end
end
