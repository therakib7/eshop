defmodule EshopWeb.Schema.Types.PackageItem do
  use Absinthe.Schema.Notation

  @desc "A package_item"
  object :package_item do
    field :id, :integer
    field :name, :string
    field :native_name, :string
    field :package_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A package_item update"
  input_object :package_item_params do
    field :name, :string
    field :native_name, :string
    field :package_id, :id
  end
end
