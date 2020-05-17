defmodule EshopWeb.Schema.Mutations.Gallery do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Gallery, as: Gallery

  object :gallery_mutations do
    @desc "Create a gallery"
    field :create_gallery, type: :gallery do
      arg(:type, :integer)
      arg(:type_id, :integer)
      arg(:attachment_id, :id)

      resolve(&Gallery.create_gallery/3)
    end

    @desc "Update a gallery"
    field :update_gallery, type: :gallery do
      arg(:id, non_null(:id))
      arg(:gallery_params, :gallery_params)

      resolve(&Gallery.update_gallery/2)
    end

    @desc "Delete a gallery"
    field :delete_gallery, type: :gallery do
      arg(:id, non_null(:id))
      resolve(&Gallery.delete_gallery/2)
    end
  end
end
