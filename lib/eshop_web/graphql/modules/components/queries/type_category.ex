defmodule EshopWeb.Schema.Queries.TypeCategory do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.TypeCategory, as: TypeCategory

  object :type_category_queries do
      @desc "Get all type_categories"
      field :type_categories, list_of(:type_category) do
          resolve &TypeCategory.list_type_categories/3
      end

      @desc "Get a type_category by its id"
      field :type_category, :type_category do
          arg :id, non_null(:id)
          resolve &TypeCategory.get_type_category/3
      end 
  end
end
