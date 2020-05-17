defmodule EshopWeb.Schema.Queries.Shop do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Shop, as: Shop

  object :shop_queries do
    @desc "Get all shops"
    field :shops, list_of(:shop) do
      resolve(&Shop.list_shops/3)
    end

    @desc "Get a shop by its id"
    field :shop, :shop do
      arg(:id, non_null(:id))
      resolve(&Shop.get_shop/3)
    end
  end
end
