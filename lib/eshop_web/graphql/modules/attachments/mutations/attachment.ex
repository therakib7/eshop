defmodule EshopWeb.Schema.Mutations.Attachment do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.Attachment, as: Attachment

  object :attachment_mutations do
    @desc "Create a attachment"
    field :create_attachment, type: :attachment do
      arg(:id, :integer)
      arg(:file_name, :string)
      arg(:orginal_size, :string)
      arg(:resized_size, :string)
      arg(:type, :integer)
      arg(:type_id, :integer)

      resolve(&Attachment.create_attachment/3)
    end

    @desc "Update a attachment"
    field :update_attachment, type: :attachment do
      arg(:id, non_null(:id))
      arg(:attachment_params, :attachment_params)

      resolve(&Attachment.update_attachment/2)
    end

    @desc "Delete a attachment"
    field :delete_attachment, type: :attachment do
      arg(:id, non_null(:id))
      resolve(&Attachment.delete_attachment/2)
    end
  end
end
