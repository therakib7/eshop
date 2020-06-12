defmodule EshopWeb.Schema.Mutations.Category do
  use Absinthe.Schema.Notation
  alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Schema.Resolvers.Category, as: Category

  object :category_mutations do
    @desc "Create a category"
    field :create_category, type: :category do
      middleware(Auth, %{per: "component_create", context: "components", model: "category"})
      arg(:is_active, :boolean)
      arg(:order, :integer)
      arg(:name, :string)
      arg(:native_name, :string)
      arg(:slug, :string)
      arg(:parent_id, :integer)
      arg(:attachment_id, :integer)
      arg(:user_id, :integer)

      resolve(&Category.create_category/3)
    end

    @desc "Update a category"
    field :update_category, type: :category do
      middleware(Auth, %{per: "component_update", context: "components", model: "category"})
      arg(:id, non_null(:id))
      arg(:category_params, :category_params)

      resolve(&Category.update_category/2)
    end

    @desc "Delete a category"
    field :delete_category, type: :category do
      middleware(Auth, %{per: "component_delete", context: "components", model: "category"})
      arg(:id, non_null(:id)) 
      resolve(&Category.delete_category/2)
    end
  end
end
