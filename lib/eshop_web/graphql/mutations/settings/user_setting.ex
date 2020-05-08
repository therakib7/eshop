defmodule EshopWeb.Schema.Mutations.UserSetting do
  use Absinthe.Schema.Notation
  
  object :user_setting_mutations do
    @desc "Create a user_setting"
    field :create_user_setting, type: :user_setting do 
      arg :id, :integer
    	arg :key, :string
    	arg :value, :string
    	arg :user_id, :id
      
    	resolve &EshopWeb.Schema.Resolvers.UserSetting.create_user_setting/2
    end
  end 
end
