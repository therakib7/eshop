defmodule EshopWeb.Schema.Types.Todo do
    use Absinthe.Schema.Notation

    object :todo do
        field :id, :integer
        field :title, :string
        field :status, :integer
    end
end