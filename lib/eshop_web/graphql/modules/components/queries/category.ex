defmodule EshopWeb.Schema.Queries.Category do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Category, as: Category

  object :category_queries do
      @desc "Get all categorys"
      field :categorys, list_of(:category) do
          resolve &Category.list_categorys/3
      end

      @desc "Get a category by its id"
      field :category, :category do
          arg :id, non_null(:id)
          resolve &Category.get_category/3
      end 
  end
end