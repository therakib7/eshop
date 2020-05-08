defmodule EshopWeb.Schema.Queries.TypeCategory do 
  use Absinthe.Schema.Notation

  object :type_category_queries do
    @desc "Get all type_categories"
    field :type_categories, list_of(:type_category) do
      resolve &EshopWeb.Schema.Resolvers.TypeCategory.list_type_categories/3
    end
  end 
end
