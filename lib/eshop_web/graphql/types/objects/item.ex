defmodule EshopWeb.Schema.Types.Item do
  use Absinthe.Schema.Notation
  
  object :item do
    field :id, :integer
    field :asin_id, :string
    field :cost_price, :decimal
    field :desc, :string
    field :extra_fields, :string
    field :has_package, :boolean
    field :has_variant, :boolean
    field :has_warehouse, :boolean
    field :is_active, :boolean
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
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
