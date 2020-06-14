defmodule EshopWeb.Schema.Types.Item do
  use Absinthe.Schema.Notation

  @desc "A item"
  object :item_type do 
    field :cost_price, :decimal
    field :desc, :string
    field :extra_fields, :string
    field :has_package, :boolean
    field :has_variant, :boolean
    field :has_warehouse, :boolean
    field :is_active, :boolean
    field :is_online, :boolean 
    field :low_stock, :integer
    field :title, :string
    field :native_desc, :string
    field :native_title, :string
    field :sell_price, :decimal
    field :total_order, :integer
    field :type, :integer
    field :type_id, :integer
    field :unit, :integer
    field :unit_price, :decimal
    field :vat, :integer
    field :vat_type, :integer 
    field :user_id, :integer
    field :shop_id, :integer
    field :unit_type_id, :integer 
  end

  @desc "A item"
  input_object :item do 
    field :cost_price, :decimal
    field :desc, :string
    field :extra_fields, :string
    field :has_package, :boolean
    field :has_variant, :boolean
    field :has_warehouse, :boolean
    field :is_active, :boolean
    field :is_online, :boolean 
    field :low_stock, :integer
    field :title, :string
    field :native_desc, :string
    field :native_title, :string
    field :sell_price, :decimal
    field :total_order, :integer
    field :type, :integer
    field :type_id, :integer
    field :unit, :integer
    field :unit_price, :decimal
    field :vat, :integer
    field :vat_type, :integer 
    field :user_id, :integer
    field :shop_id, :integer
    field :unit_type_id, :integer 
  end

  @desc "A item update"
  input_object :item_params do
    field :asin_id, :string
    field :cost_price, :decimal
    field :desc, :string
    field :extra_fields, :string
    field :has_package, :boolean
    field :has_variant, :boolean
    field :has_warehouse, :boolean
    field :is_active, :boolean
    field :is_online, :boolean
    field :loves, :integer
    field :low_stock, :integer
    field :title, :string
    field :native_desc, :string
    field :native_title, :string
    field :sell_price, :decimal
    field :total_order, :integer
    field :type, :integer
    field :type_id, :integer
    field :unit, :integer
    field :unit_price, :decimal
    field :vat, :integer
    field :vat_type, :integer
    field :views, :integer
    field :user_id, :integer
    field :shop_id, :integer
    field :unit_type_id, :integer
  end
end
