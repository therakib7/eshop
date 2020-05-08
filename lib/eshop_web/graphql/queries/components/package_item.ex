defmodule EshopWeb.Schema.Queries.PackageItem do 
  use Absinthe.Schema.Notation

  object :package_item_queries do
    @desc "Get all package_items"
    field :package_items, list_of(:package_item) do
      resolve &EshopWeb.Schema.Resolvers.PackageItem.list_package_items/3
    end
  end 
end
