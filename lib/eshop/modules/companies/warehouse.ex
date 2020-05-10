defmodule Eshop.Companies.Warehouse do
  use Ecto.Schema
  import Ecto.Changeset

  schema "warehouses" do
    field :is_active, :boolean, default: false
    field :name, :string
    field :native_name, :string
    field :shop_id, :id
    field :user_id, :id
    field :location_id, :id

    timestamps()
  end

  @doc false
  def changeset(warehouse, attrs) do
    warehouse
    |> cast(attrs, [:is_active, :name, :native_name])
    |> validate_required([:is_active, :name, :native_name])
  end
end
