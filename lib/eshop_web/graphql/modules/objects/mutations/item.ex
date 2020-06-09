defmodule EshopWeb.Schema.Mutations.Item do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Item

  object :item_mutations do
    @desc "Create a item"
    field :create_item, type: :item do
      arg(:id, :integer)
      arg(:asin_id, :string)
      arg(:cost_price, :decimal)
      arg(:desc, :string)
      arg(:extra_args, :string)
      arg(:has_package, :boolean)
      arg(:has_variant, :boolean)
      arg(:has_warehouse, :boolean)
      arg(:is_online, :boolean)
      arg(:is_active, :boolean) 
      arg(:low_stock, :integer)
      arg(:title, :string)
      arg(:native_desc, :string)
      arg(:native_title, :string)
      arg(:sell_price, :decimal)
      arg(:total_order, :integer)
      arg(:type, :integer)
      arg(:type_id, :integer)
      arg(:unit, :integer)
      arg(:unit_price, :decimal)
      arg(:vat, :integer)
      arg(:vat_type, :integer) 
      arg(:shop_id, non_null(:id))
      arg(:unit_type_id, :id)
      arg(:category_id, :integer)

      resolve(&Item.create_item/3)
    end

    @desc "Update a item"
    field :update_item, type: :item do
      arg(:id, non_null(:id))
      arg(:item_params, :item_params)

      resolve(&Item.update_item/2)
    end

    @desc "Delete a item"
    field :delete_item, type: :item do
      arg(:id, non_null(:id))
      resolve(&Item.delete_item/2)
    end
  end
end
