defmodule EshopWeb.Schema.Queries.Gallery do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Gallery, as: Gallery

  object :gallery_queries do
      @desc "Get all galleries"
      field :galleries, list_of(:gallery) do
          resolve &Gallery.list_galleries/3
      end

      @desc "Get a gallery by its id"
      field :gallery, :gallery do
          arg :id, non_null(:id)
          resolve &Gallery.get_gallery/3
      end 
  end
end
