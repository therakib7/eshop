defmodule EshopWeb.Schema.Queries.PackageItem do 
  use Absinthe.Schema.Notation

  object :package_item_queries do
    field :id, :integer
    field :name, :string
    field :native_name, :string
    field :package_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
