defmodule Eshop.Objects.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :asin_id, :integer
    field :cost_price, :decimal
    field :desc, :string
    field :extra_fields, :map
    field :has_package, :boolean, default: false
    field :has_variant, :boolean, default: false
    field :has_warehouse, :boolean, default: false
    field :is_active, :boolean, default: false
    field :loves, :integer
    field :low_stock, :integer
    field :name, :string
    field :native_desc, :string
    field :native_name, :string
    field :sell_price, :decimal
    field :total_order, :integer
    field :type, :integer
    field :type_id, :integer
    field :unit, :integer
    field :unit_price, :decimal
    field :vat, :integer
    field :vat_type, :integer
    field :views, :integer
    field :user_id, :id
    field :shop_id, :id
    field :unit_type_id, :id

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:is_active, :name, :native_name, :desc, :native_desc, :views, :loves, :vat, :vat_type, :unit, :has_variant, :has_package, :total_order, :low_stock, :has_warehouse, :cost_price, :unit_price, :sell_price, :type, :type_id, :extra_fields, :asin_id])
    |> validate_required([:is_active, :name, :native_name, :desc, :native_desc, :views, :loves, :vat, :vat_type, :unit, :has_variant, :has_package, :total_order, :low_stock, :has_warehouse, :cost_price, :unit_price, :sell_price, :type, :type_id, :extra_fields, :asin_id])
  end
end
