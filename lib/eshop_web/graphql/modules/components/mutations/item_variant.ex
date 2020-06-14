defmodule EshopWeb.Schema.Mutations.ItemVariant do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ItemVariant, as: ItemVariant

  object :item_variant_mutations do
    @desc "Create a item_variant"
    field :create_item_variant, type: :item_variant do
      arg(:id, :integer)
      arg(:cost_price, :decimal)
      arg(:sale_price, :decimal)
      arg(:unit_price, :decimal)
      arg(:item_id, :integer)
      arg(:variant_id, :integer)
      arg(:variant_value_id, :integer)

      resolve(&ItemVariant.create_item_variant/3)
    end

    @desc "Update a item_variant"
    field :update_item_variant, type: :item_variant do
      arg(:id, non_null(:id))
      arg(:item_variant_params, :item_variant_params)

      resolve(&ItemVariant.update_item_variant/2)
    end

    @desc "Delete a item_variant"
    field :delete_item_variant, type: :item_variant do
      arg(:id, non_null(:id))
      resolve(&ItemVariant.delete_item_variant/2)
    end
  end
end
