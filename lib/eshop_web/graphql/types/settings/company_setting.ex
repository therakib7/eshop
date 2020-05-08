defmodule EshopWeb.Schema.Types.CompanySetting do
  use Absinthe.Schema.Notation
  
  object :company_setting do
    field :id, :integer
    field :key, :string
    field :type, :integer
    field :type_id, :integer
    field :value, :string
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
