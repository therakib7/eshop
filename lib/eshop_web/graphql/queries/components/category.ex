defmodule EshopWeb.Schema.Queries.Category do 
  use Absinthe.Schema.Notation

  object :category_queries do
    @desc "Get all categories"
    field :categories, list_of(:category) do
      resolve &EshopWeb.Schema.Resolvers.Category.list_categories/3
    end
  end 
end
