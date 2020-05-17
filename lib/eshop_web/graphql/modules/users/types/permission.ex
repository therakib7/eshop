defmodule EshopWeb.Schema.Types.Permission do
  use Absinthe.Schema.Notation

  @desc "A permission"
  object :permission do
    field :id, :integer
    field :name, :string
    field :slug, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A permission update"
  input_object :permission_params do
    field :name, :string
    field :slug, :string
  end
end
