defmodule Eshop.Components.Brand do
  use Ecto.Schema
  import Ecto.Changeset

  schema "brands" do
    field :is_active, :boolean, default: false
    field :loves, :integer
    field :name, :string
    field :native_name, :string
    field :slug, :string
    field :attachment_id, :id
    field :location_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(brand, attrs) do
    brand
    |> cast(attrs, [:is_active, :name, :native_name, :slug, :loves])
    |> validate_required([:is_active, :name, :native_name, :slug, :loves])
  end
end
