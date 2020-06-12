defmodule EshopWeb.Schema.Queries.Category do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Schema.Resolvers.Category

  input_object :category_filter do
    field :id, :integer
    field :name, :string
    field :inserted_before, :naive_datetime
    field :inserted_after, :naive_datetime
  end

  connection(node_type: :category)

  object :category_queries do
    @desc "Get all categories"
    connection field :categories, node_type: :category do
      arg(:filter, :category_filter)
      resolve(&Category.list_categories/3)
    end

    @desc "Get a category by its id"
    field :category, :category do
      arg(:id, non_null(:id))
      resolve(&Category.get_category/3)
    end
  end
end
