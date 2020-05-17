defmodule EshopWeb.Schema.Types.UnitType do
  use Absinthe.Schema.Notation

  @desc "A unit_type"
  object :unit_type do
    field :id, :integer
    field :name, :string
    field :native_name, :string
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A unit_type update"
  input_object :unit_type_params do
    field :name, :string
    field :native_name, :string
    field :user_id, :id
  end
end
