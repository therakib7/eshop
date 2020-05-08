defmodule EshopWeb.Schema.Types.Shop do
  use Absinthe.Schema.Notation
  
  object :shop do
    field :id, :integer
    field :created_at, :datetime
    field :golden_supplier, :boolean
    field :highest_assurance, :decimal
    field :is_active, :boolean
    field :is_verifed, :boolean
    field :name, :string
    field :native_name, :string
    field :trade_assurance, :boolean
    field :company_id, :id
    field :user_id, :id
    field :location_id, :id
    field :attachment_id, :id
    field :term_condition_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
