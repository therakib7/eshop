defmodule EshopWeb.Schema.Mutations.PrivacyPolicy do
  use Absinthe.Schema.Notation
  
  object :privacy_policy_mutations do
    @desc "Create a privacy_policy"
    field :create_privacy_policy, type: :privacy_policy do 
      arg :id, :integer
    	arg :content, :string
    	arg :native_content, :string
    	arg :shop_id, :id

    	resolve &EshopWeb.Schema.Resolvers.PrivacyPolicy.create_privacy_policy/2
    end
  end 
end
