defmodule EshopWeb.Schema.Queries.Invoice do 
  use Absinthe.Schema.Notation

  object :invoice_queries do
    field :id, :integer
    field :discount, :decimal
    field :note, :string
    field :paid, :decimal
    field :total, :decimal
    field :type, :integer
    field :company_id, :id
    field :shop_id, :id
    field :user_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end 
end
