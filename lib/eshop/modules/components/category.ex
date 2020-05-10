defmodule Eshop.Components.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :is_active, :boolean, default: false
    field :order, :integer
    field :name, :string
    field :native_name, :string
    field :slug, :string
    field :parent_id, :id
    field :attachment_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:is_active, :order, :name, :native_name, :slug])
    |> validate_required([:is_active, :name, :native_name, :slug])
  end
end
