defmodule EshopWeb.Schema.Queries.Company do
  use Absinthe.Schema.Notation

  use Absinthe.Relay.Schema.Notation, :modern
  # alias EshopWeb.Graphql.Middleware.Auth
  alias EshopWeb.Schema.Resolvers.Company

  input_object :company_filter do
    field :id, :integer
    field :created_at, :datetime
    field :golden_supplier, :boolean
    field :highest_assurance, :decimal
    field :is_active, :boolean
    field :is_verifed, :boolean
    field :name, :string
    field :trade_assurance, :boolean
    field :user_id, :integer
    field :location_id, :integer
    field :attachment_id, :integer
    field :term_condition_id, :integer
    field :inserted_before, :naive_datetime
    field :inserted_after, :naive_datetime
  end

  connection(node_type: :company)

  object :company_queries do
    @desc "Get all company"
    connection field :companies, node_type: :company do
      arg(:filter, :company_filter)
      resolve(&Company.list_companies/3)
    end

    @desc "Get a company by its id"
    field :company, :company do
      arg(:id, non_null(:id))
      resolve(&Company.get_company/3)
    end
  end
end
