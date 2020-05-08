defmodule EshopWeb.Schema.Types.Permission do
    use Absinthe.Schema.Notation
    
    object :permission do
    	field :id, :integer
        field :name, :string
        field :slug, :string
        field :inserted_at, :naive_datetime
        field :updated_at, :naive_datetime 
    end
end