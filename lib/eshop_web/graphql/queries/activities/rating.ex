defmodule EshopWeb.Schema.Queries.Rating do
  use Absinthe.Schema.Notation

  object :rating_queries do
    @desc "Get all ratings"
    field :ratings, list_of(:rating) do
      resolve &EshopWeb.Schema.Resolvers.Rating.list_ratings/3
    end
  end
end
