defmodule Eshop.Components.TypeCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "type_categories" do
    field :type, :integer
    field :type_id, :integer
    belongs_to :category, Eshop.Components.Category

    timestamps()
  end

  @doc false
  def changeset(type_category, attrs) do
    type_category
    |> cast(attrs, [:type, :type_id, :category_id])
    |> validate_required([:type, :type_id, :category_id])
  end
end
