defmodule EshopWeb.Schema.Mutations.ItemCategory do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.ItemCategory, as: ItemCategory

  object :item_category_mutations do
    @desc "Create a item_category"
    field :create_item_category, type: :item_category do
      arg(:id, :integer)
      arg(:item_id, :integer)
      arg(:category_id, :integer)

      resolve(&ItemCategory.create_item_category/3)
    end

    @desc "Update a item_category"
    field :update_item_category, type: :item_category do
      arg(:id, non_null(:id))
      arg(:item_category_params, :item_category_params)

      resolve(&ItemCategory.update_item_category/2)
    end

    @desc "Delete a item_category"
    field :delete_item_category, type: :item_category do
      arg(:id, non_null(:id))
      resolve(&ItemCategory.delete_item_category/2)
    end
  end
end
