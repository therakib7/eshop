defmodule EshopWeb.Schema.Queries.Brand do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Schema.Resolvers.Brand

  input_object :brand_filter do
    field :id, :integer
    field :name, :string 
    field :inserted_before, :naive_datetime
    field :inserted_after, :naive_datetime
  end

  connection(node_type: :brand)

  object :brand_queries do
    @desc "Get all brands"
    connection field :brands, node_type: :brand do
      arg(:filter, :brand_filter)
      resolve(&Brand.list_brands/3)
    end

    @desc "Get a brand by its id"
    field :brand, :brand do
      arg(:id, non_null(:id))
      resolve(&Brand.get_brand/3)
    end
  end
end
