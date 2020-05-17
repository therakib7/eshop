defmodule EshopWeb.Schema.Queries.Rating do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Rating, as: Rating

  object :rating_queries do
    @desc "Get all ratings"
    field :ratings, list_of(:rating) do
      resolve(&Rating.list_ratings/3)
    end

    @desc "Get a rating by its id"
    field :rating, :rating do
      arg(:id, non_null(:id))
      resolve(&Rating.get_rating/3)
    end
  end
end
