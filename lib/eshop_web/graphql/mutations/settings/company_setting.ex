defmodule EshopWeb.Schema.Mutations.CompanySetting do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.CompanySetting, as: CompanySetting
  
	object :company_setting_mutations do
	  @desc "Create a company_setting"
	  field :create_company_setting, type: :company_setting do 
		  arg :id, :integer
    	arg :key, :string
    	arg :type, :integer
    	arg :type_id, :integer
    	arg :value, :string
      
		  resolve &CompanySetting.create_company_setting/3
	  end
  
	  @desc "Update a company_setting"
	  field :update_company_setting, type: :company_setting do
		  arg(:id, non_null(:id))
		  arg(:company_setting_params, :company_setting_params)
  
		  resolve &CompanySetting.update_company_setting/2
	  end
	  
	  @desc "Delete a company_setting"
	  field :delete_company_setting, type: :company_setting do
		  arg(:id, non_null(:id))
		  resolve &CompanySetting.delete_company_setting/2
	  end
	end 
end