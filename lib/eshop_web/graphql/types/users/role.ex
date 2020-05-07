defmodule EshopWeb.Schema.Types.Role do
    use Absinthe.Schema.Notation

    object :role do
        field :id, :integer
        field :desc, :string
        field :is_company, :boolean
        field :name, :string
        field :slug, :string
        field :native_name, :string
        field :inserted_at, :naive_datetime
        field :updated_at, :naive_datetime
    end
end