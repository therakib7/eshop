defmodule EshopWeb.Schema.Queries.Package do 
  use Absinthe.Schema.Notation

  object :package_queries do
    @desc "Get all packages"
    field :packages, list_of(:package) do
      resolve &EshopWeb.Schema.Resolvers.Package.list_packages/3
    end
  end 
end
