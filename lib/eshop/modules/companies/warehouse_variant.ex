defmodule Eshop.Companies.WarehouseVariant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "warehouse_variants" do
    field :name, :string
    field :native_name, :string
    field :type, :integer
    field :company_id, :id
    field :parent_id, :id

    timestamps()
  end

  @doc false
  def changeset(warehouse_variant, attrs) do
    warehouse_variant
    |> cast(attrs, [:type, :name, :native_name])
    |> validate_required([:type, :name, :native_name])
  end
end
