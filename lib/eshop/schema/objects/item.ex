defmodule Eshop.Objects.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :is_online, :boolean
    field :asin_id, :string
    field :cost_price, :decimal
    field :desc, :string
    field :extra_fields, :map
    field :has_package, :boolean, default: false
    field :has_variant, :boolean, default: false
    field :has_warehouse, :boolean, default: false
    field :is_active, :boolean, default: false
    field :loves, :integer
    field :low_stock, :integer
    field :title, :string
    field :native_desc, :string
    field :native_title, :string
    field :sale_price, :decimal
    field :total_order, :integer
    field :type, :integer
    field :type_id, :integer
    field :unit, :integer
    field :unit_price, :decimal
    field :vat, :integer
    field :vat_type, :integer
    field :views, :integer
    has_many :categories, Eshop.Components.ItemCategory
    has_many :variants, Eshop.Components.ItemVariant
    has_many :packages, Eshop.Components.Package
    belongs_to :shop, Eshop.Companies.Shop
    belongs_to :user, Eshop.Users.User
    belongs_to :unit_type, Eshop.Components.UnitType

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [
      :is_online,
      :is_active,
      :title,
      :native_title,
      :desc,
      :native_desc,
      :views,
      :loves,
      :vat,
      :vat_type,
      :unit,
      :has_variant,
      :has_package,
      :total_order,
      :low_stock,
      :has_warehouse,
      :cost_price,
      :unit_price,
      :sale_price,
      :type,
      :type_id,
      :extra_fields,
      :asin_id,
      :user_id,
      :shop_id
    ])
    |> validate_required([
      :title,
      :cost_price,
      :unit_price,
      :sale_price
    ])
    |> validate_length(:title, min: 2, max: 200)
    |> validate_length(:native_title, min: 2, max: 200)
  end
end
