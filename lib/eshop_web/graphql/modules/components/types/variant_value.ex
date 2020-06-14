defmodule EshopWeb.Schema.Types.VariantValue do
  use Absinthe.Schema.Notation

  @desc "A variant_value"
  object :variant_value do
    field :id, :integer
    field :native_value, :string
    field :value, :string
    field :variant_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A variant_value update"
  input_object :variant_value_params do
    field :native_value, :string
    field :value, :string
    field :variant_id, :integer
  end
end
