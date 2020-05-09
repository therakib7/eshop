defmodule EshopWeb.Schema.Mutations.Attachment do
  use Absinthe.Schema.Notation

  object :attachment_mutations do
    @desc "Create a attachment"
    field :create_attachment, type: :attachment do 
      arg :id, :integer
    	arg :file_name, :string 
    	arg :orginal_size, :string
    	arg :resized_size, :string
    	arg :type, :integer
    	arg :type_id, :integer

    	resolve &EshopWeb.Schema.Resolvers.Attachment.create_attachment/3
    end
  end 
end
