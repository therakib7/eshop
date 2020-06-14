defmodule EshopWeb.Schema.Types.Gallery do
  use Absinthe.Schema.Notation

  @desc "A gallery by a type"
  object :gallery do
    field :id, :integer
    field :type, :integer
    field :type_id, :integer
    field :attachment_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A gallery update by a type"
  input_object :gallery_params do
    field :type, :integer
    field :type_id, :integer
    field :attachment_id, :integer
  end
end
