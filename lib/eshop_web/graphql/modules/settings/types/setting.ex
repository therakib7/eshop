defmodule EshopWeb.Schema.Types.Setting do
  use Absinthe.Schema.Notation

  @desc "A setting"
  object :setting do
    field :id, :integer
    field :key, :string
    field :value, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A setting update"
  input_object :setting_params do
    field :key, :string
    field :value, :string
  end
end
