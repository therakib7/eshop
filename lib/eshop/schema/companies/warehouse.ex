defmodule Eshop.Companies.Warehouse do
  use Ecto.Schema
  import Ecto.Changeset

  schema "warehouses" do
    field :is_active, :boolean, default: false
    field :name, :string
    field :native_name, :string
    belongs_to :shop, Eshop.Companies.Shop
    belongs_to :user, Eshop.Users.User
    belongs_to :location, Eshop.Geo.Location

    timestamps()
  end

  @doc false
  def changeset(warehouse, attrs) do
    warehouse
    |> cast(attrs, [:is_active, :name, :native_name,:shop_id,:user_id])
    |> validate_required([:is_active, :name, :native_name])
    |> validate_length(:name, min: 1, max: 200)
    |> validate_length(:native_name, min: 1, max: 200)
  end
end
