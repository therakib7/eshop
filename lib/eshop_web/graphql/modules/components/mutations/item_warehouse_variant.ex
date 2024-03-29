defmodule EshopWeb.Schema.Mutations.ItemWarehouseVariant do
  use Absinthe.Schema.Notation
  alias EshopWeb.Graphql.Middleware.Auth

  alias EshopWeb.Schema.Resolvers.ItemWarehouseVariant, as: ItemWarehouseVariant

  object :item_warehouse_variant_mutations do
    @desc "Create a item_warehouse_variant"
    field :create_item_warehouse_variant, type: :item_warehouse_variant do
      middleware(Auth, %{
        per: "product_create",
        context: "components",
        model: "item_warehouse_variant"
      })

      arg(:item_id, :integer)
      arg(:warehouse_variant_id, :integer)
      arg(:warehouse_variant_value_id, :integer)

      resolve(&ItemWarehouseVariant.create_item_warehouse_variant/3)
    end

    @desc "Update a item_warehouse_variant"
    field :update_item_warehouse_variant, type: :item_warehouse_variant do
      middleware(Auth, %{
        per: "product_create",
        context: "components",
        model: "item_warehouse_variant"
      })

      arg(:id, non_null(:id))
      arg(:item_warehouse_variant_params, :item_warehouse_variant_params)

      resolve(&ItemWarehouseVariant.update_item_warehouse_variant/2)
    end

    @desc "Delete a item_warehouse_variant"
    field :delete_item_warehouse_variant, type: :item_warehouse_variant do
      middleware(Auth, %{
        per: "product_create",
        context: "components",
        model: "item_warehouse_variant"
      })

      arg(:id, non_null(:id))
      resolve(&ItemWarehouseVariant.delete_item_warehouse_variant/2)
    end
  end
end
