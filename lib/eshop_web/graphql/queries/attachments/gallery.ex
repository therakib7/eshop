defmodule EshopWeb.Schema.Queries.Gallery do
  use Absinthe.Schema.Notation

  object :gallery_queries do
    @desc "Get all galleries"
    field :galleries, list_of(:gallery) do
      resolve &EshopWeb.Schema.Resolvers.Gallery.list_galleries/3
    end
  end

end
