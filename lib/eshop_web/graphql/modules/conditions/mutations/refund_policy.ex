defmodule EshopWeb.Schema.Mutations.RefundPolicy do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.RefundPolicy, as: RefundPolicy
  
	object :refund_policy_mutations do
	  @desc "Create a refund_policy"
	  field :create_refund_policy, type: :refund_policy do 
		  arg :id, :integer
    	arg :content, :string
    	arg :native_content, :string
    	arg :type, :integer
    	arg :type_id, :integer
      
		  resolve &RefundPolicy.create_refund_policy/3
	  end
  
	  @desc "Update a refund_policy"
	  field :update_refund_policy, type: :refund_policy do
		  arg(:id, non_null(:id))
		  arg(:refund_policy_params, :refund_policy_params)
  
		  resolve &RefundPolicy.update_refund_policy/2
	  end
	  
	  @desc "Delete a refund_policy"
	  field :delete_refund_policy, type: :refund_policy do
		  arg(:id, non_null(:id))
		  resolve &RefundPolicy.delete_refund_policy/2
	  end
	end 
end