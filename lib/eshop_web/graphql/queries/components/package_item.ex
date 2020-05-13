defmodule EshopWeb.Schema.Queries.PackageItem do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.PackageItem, as: PackageItem

  object :package_item_queries do
      @desc "Get all package_items"
      field :package_items, list_of(:package_item) do
          resolve &PackageItem.list_package_items/3
      end

      @desc "Get a package_item by its id"
      field :package_item, :package_item do
          arg :id, non_null(:id)
          resolve &PackageItem.get_package_item/3
      end 
  end
end
