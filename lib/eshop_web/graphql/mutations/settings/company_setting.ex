defmodule EshopWeb.Schema.Mutations.CompanySetting do
  use Absinthe.Schema.Notation
  
  object :company_setting_mutations do
    @desc "Create a company_setting"
    field :create_company_setting, type: :company_setting do 
      arg :id, :integer
    	arg :key, :string
    	arg :type, :integer
    	arg :type_id, :integer
    	arg :value, :string

    	resolve &EshopWeb.Schema.Resolvers.CompanySetting.create_company_setting/3
    end
  end 
end
