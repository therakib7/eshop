defmodule EshopWeb.Schema.Mutations.Product do
  use Absinthe.Schema.Notation

  alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Schema.Resolvers.Product, as: Product

  @desc "Product attr"
  input_object :item_product do
    field :product, :item_product
    field :barcode, :string
    field :exp_date, :naive_datetime
    field :mfg_date, :naive_datetime
    field :sku, :string
  end

  object :product_mutations do
    @desc "Create a product"
    field :create_product, type: :product do
      middleware(Auth, %{per: "product_create", context: "objects", model: "item"})
      arg(:type_id, :integer)
      arg(:item, :item)
      arg(:product, :item_product)
      arg(:category_ids, list_of(:category_ids))
      arg(:has_variant, list_of(:item_variants))
      arg(:has_package, list_of(:item_packages))
      arg(:has_warehouse, list_of(:item_warehouses))

      resolve(&Product.create_product/3)
    end

    @desc "Update a product"
    field :update_product, type: :product do
      middleware(Auth, %{per: "product_update", context: "objects", model: "item"})
      arg(:id, non_null(:id))
      arg(:product_params, :product_params)

      resolve(&Product.update_product/2)
    end

    @desc "Delete a product"
    field :delete_product, type: :product do
      middleware(Auth, %{per: "product_delete", context: "objects", model: "item"})
      arg(:id, non_null(:id))
      resolve(&Product.delete_product/2)
    end
  end
end
