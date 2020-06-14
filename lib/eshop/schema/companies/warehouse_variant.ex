defmodule Eshop.Companies.WarehouseVariant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "warehouse_variants" do
    field :name, :string
    field :native_name, :string
    field :type, :integer
    belongs_to :company, Eshop.Companies.Company
    belongs_to :parent, Eshop.Companies.WarehouseVariant

    timestamps()
  end

  @doc false
  def changeset(warehouse_variant, attrs) do
    warehouse_variant
    |> cast(attrs, [:type, :name, :native_name,:parent_id,:company_id])
    |> validate_required([:type, :name, :native_name])
    |> validate_length(:name, min: 1, max: 200)
    |> validate_length(:native_name, min: 1, max: 200)
  end
end
