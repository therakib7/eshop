defmodule EshopWeb.Schema.Mutations.Company do
  use Absinthe.Schema.Notation 

  object :company_mutations do
    @desc "Create a company"
    field :create_company, type: :company do 
        arg :id, :integer
    	arg :created_at, :datetime
    	arg :golden_supplier, :boolean
    	arg :highest_assurance, :decimal
    	arg :is_active, :boolean
    	arg :is_verifed, :boolean
    	arg :name, :string
    	arg :trade_assurance, :boolean
    	arg :user_id, :id
    	arg :location_id, :id
    	arg :attachment_id, :id
    	arg :term_condition_id, :id

    	resolve &EshopWeb.Schema.Resolvers.Company.create_company/2
    end
  end 
end
