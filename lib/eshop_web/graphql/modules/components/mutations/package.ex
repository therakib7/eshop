defmodule EshopWeb.Schema.Mutations.Package do
  use Absinthe.Schema.Notation

  alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Schema.Resolvers.Package, as: Package

  object :package_mutations do
    @desc "Create a package"
    field :create_package, type: :package do
      arg :id, :integer
      arg :title, :string
      arg :native_title, :string
      arg :subtitle, :string
      arg :native_subtitle, :string
      arg :cost_price, :decimal
      arg :sale_price, :decimal
      arg :unit_price, :decimal
      arg :item_id, :integer

      resolve(&Package.create_package/3)
    end

    @desc "Update a package"
    field :update_package, type: :package do
      arg(:id, non_null(:id))
      arg(:package_params, :package_params)

      resolve(&Package.update_package/2)
    end

    @desc "Delete a package"
    field :delete_package, type: :package do
      arg(:id, non_null(:id))
      resolve(&Package.delete_package/2)
    end
  end
end
