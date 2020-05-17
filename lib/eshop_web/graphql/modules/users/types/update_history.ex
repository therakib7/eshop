defmodule EshopWeb.Schema.Types.UpdateHistory do
  use Absinthe.Schema.Notation

  @desc "A update_history"
  object :update_history do
    field :id, :integer
    field :key, :string
    field :new_value, :string
    field :old_value, :string
    field :type, :integer
    field :type_id, :integer
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A update_history update"
  input_object :update_history_params do
    field :key, :string
    field :new_value, :string
    field :old_value, :string
    field :type, :integer
    field :type_id, :integer
  end
end
