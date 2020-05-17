defmodule EshopWeb.Schema.Types.UserLove do
  use Absinthe.Schema.Notation

  @desc "A user_love of the by a type"
  object :user_love do
    field :id, :integer
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A user_love update of the by a type"
  input_object :user_love_params do
    field :type, :integer
    field :type_id, :integer
    field :user_id, :id
  end
end
