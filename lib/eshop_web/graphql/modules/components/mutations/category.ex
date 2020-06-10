defmodule EshopWeb.Schema.Mutations.Category do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Category, as: Category

  object :category_mutations do
    @desc "Create a category"
    field :create_category, type: :category do
      arg(:id, :integer)
      arg(:is_active, :boolean)
      arg(:order, :integer)
      arg(:name, :string)
      arg(:native_name, :string)
      arg(:slug, :string)
      arg(:parent_id, :id)
      arg(:attachment_id, :id)
      arg(:user_id, :id)

      resolve(&Category.create_category/3)
    end

    @desc "Update a category"
    field :update_category, type: :category do
      arg(:id, non_null(:id))
      arg(:category_params, :category_params)

      resolve(&Category.update_category/2)
    end

    @desc "Delete a category"
    field :delete_category, type: :category do
      arg(:id, non_null(:id))

      resolve(&Category.delete_category/2)
    end
  end
end
