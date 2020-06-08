defmodule EshopWeb.Schema.Types.Role do
  use Absinthe.Schema.Notation

  @desc "A role of the user"
  object :role do
    field :id, :integer
    field :desc, :string
    field :type, :integer
    field :name, :string
    field :slug, :string
    field :native_name, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A role update of the user"
  input_object :role_params do
    field :name, :string
    field :desc, :string
    field :type, :integer
    field :name, :string
    field :slug, :string
    field :native_name, :string
  end
end
