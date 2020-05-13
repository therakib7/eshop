defmodule EshopWeb.Schema.Types.Attachment do
  use Absinthe.Schema.Notation

  @desc "A attachment by a type"
  object :attachment do
    field :id, :integer
    field :file_name, :string 
    field :orginal_size, :string
    field :resized_size, :string
    field :type, :integer
    field :type_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A attachment update by a type"
  input_object :attachment_params do 
    field :file_name, :string 
    field :orginal_size, :string
    field :resized_size, :string
    field :type, :integer
    field :type_id, :integer
  end
end