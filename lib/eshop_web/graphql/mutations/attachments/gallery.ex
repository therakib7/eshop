defmodule EshopWeb.Schema.Mutations.Gallery do
  use Absinthe.Schema.Notation

  object :gallery_mutations do
    @desc "Create a gallery"
    field :create_gallery, type: :gallery do 
        arg :type, :integer
    	arg :type_id, :integer
    	arg :attachment_id, :id 
    	resolve &EshopWeb.Schema.Resolvers.Gallery.create_gallery/3
    end
  end 
end