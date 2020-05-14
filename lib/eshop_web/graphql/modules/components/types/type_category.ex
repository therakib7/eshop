defmodule EshopWeb.Schema.Types.TypeCategory do
  use Absinthe.Schema.Notation

  @desc "A type_category"
  object :type_category do
    field :id, :integer
    field :type, :integer
    field :type_id, :integer
    field :category_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A type_category update"
  input_object :type_category_params do 
    field :type, :integer
    field :type_id, :integer
    field :category_id, :id
  end
end