defmodule EshopWeb.Schema.Queries.Package do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Package, as: Package

  object :package_queries do
      @desc "Get all packages"
      field :packages, list_of(:package) do
          resolve &Package.list_packages/3
      end

      @desc "Get a package by its id"
      field :package, :package do
          arg :id, non_null(:id)
          resolve &Package.get_package/3
      end 
  end
end
