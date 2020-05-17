defmodule EshopWeb.Schema.Queries.Brand do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Brand, as: Brand

  object :brand_queries do
    @desc "Get all brands"
    field :brands, list_of(:brand) do
      resolve(&Brand.list_brands/3)
    end

    @desc "Get a brand by its id"
    field :brand, :brand do
      arg(:id, non_null(:id))
      resolve(&Brand.get_brand/3)
    end
  end
end
