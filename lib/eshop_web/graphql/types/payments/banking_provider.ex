defmodule EshopWeb.Schema.Types.BankingProvider do
  use Absinthe.Schema.Notation
  
  object :banking_provider do
    field :id, :integer
    field :is_active, :boolean
    field :name, :string
    field :native_name, :string
    field :order, :integer
    field :type, :integer
    field :attachement_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end