defmodule EshopWeb.Schema.Mutations.Item do
  use Absinthe.Schema.Notation
  # alias EshopWeb.Graphql.Middleware.Auth
  # alias EshopWeb.Schema.Resolvers.Item

  @desc "A item variant"
  input_object :item_variants do
    field :variant_id, :integer
    field :variant_value_id, :integer
    field :unit_price, :decimal
    field :cost_price, :decimal
    field :sale_price, :decimal
  end

  @desc "A item package"
  input_object :item_packages do
    field :title, :string
    field :native_title, :string
    field :subtitle, :string
    field :native_subtitle, :string
    field :content, list_of(:string)
    field :native_content, list_of(:string)
    field :unit_price, :decimal
    field :cost_price, :decimal
    field :sale_price, :decimal
  end

  @desc "A item warehouse"
  input_object :item_warehouses do
    field :warehouse_variant_id, :integer
    field :warehouse_variant_value_id, :integer
  end

  #   object :item_mutations do
  #     @desc "Create a item"
  #     field :create_item, type: :item do
  #       middleware(Auth, %{per: "item_create", context: "objects", model: "item"})
  #       arg(:id, :integer)
  #       arg(:asin_id, :string)
  #       arg(:cost_price, :decimal)
  #       arg(:desc, :string)
  #       arg(:extra_args, :string)
  #       arg(:has_package, :boolean)
  #       arg(:has_variant, :boolean)
  #       arg(:has_warehouse, :boolean)
  #       arg(:is_online, :boolean)
  #       arg(:is_active, :boolean)
  #       arg(:low_stock, :integer)
  #       arg(:title, :string)
  #       arg(:native_desc, :string)
  #       arg(:native_title, :string)
  #       arg(:sale_price, :decimal)
  #       arg(:total_order, :integer)
  #       arg(:type, :integer)
  #       arg(:type_id, :integer)
  #       arg(:unit, :integer)
  #       arg(:unit_price, :decimal)
  #       arg(:vat, :integer)
  #       arg(:vat_type, :integer)
  #       arg(:shop_id, non_null(:id))
  #       arg(:unit_type_id, :integer)
  #       arg(:category_ids, list_of(:category_ids))
  #       resolve(&Item.create_item/3)
  #     end

  #     @desc "Update a item"
  #     field :update_item, type: :item do
  #       arg(:id, non_null(:id))
  #       arg(:item_params, :item_params)

  #       resolve(&Item.update_item/2)
  #     end

  #     @desc "Delete a item"
  #     field :delete_item, type: :item do
  #       arg(:id, non_null(:id))
  #       resolve(&Item.delete_item/2)
  #     end
  #   end
end
