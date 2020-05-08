defmodule EshopWeb.Schema.Mutations.Setting do
  use Absinthe.Schema.Notation
  
  object :setting_mutations do
    @desc "Create a setting"
    field :create_setting, type: :setting do 
        arg :id, :integer
    	arg :key, :string
    	arg :value, :string
    	
    	resolve &EshopWeb.Schema.Resolvers.Setting.create_setting/3
    end
  end 
end
