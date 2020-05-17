defmodule EshopWeb.Schema.Types.TypeComment do
  use Absinthe.Schema.Notation

  @desc "A comment by a type"
  object :type_comment do
    field :id, :integer
    field :comment, :string
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A comment update by a type"
  input_object :type_comment_params do
    field :comment, :string
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id
  end
end
