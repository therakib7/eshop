defmodule EshopWeb.Schema.Types.Rating do
  use Absinthe.Schema.Notation

  @desc "A rating by a type"
  object :rating do
    field :id, :integer
    field :comment, :string
    field :star, :integer
    field :type, :integer
    field :type_id, :integer
    field :user_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A rating update by a type"
  input_object :rating_params do
    field :comment, :string
    field :star, :integer
    field :type, :integer
    field :type_id, :integer
  end
end
