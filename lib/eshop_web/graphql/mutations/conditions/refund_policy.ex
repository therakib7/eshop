defmodule EshopWeb.Schema.Mutations.RefundPolicy do
  use Absinthe.Schema.Notation
  
  object :refund_policy_mutations do
    @desc "Create a refund_policy"
    field :create_refund_policy, type: :refund_policy do 
      arg :id, :integer
    	arg :content, :string
    	arg :native_content, :string
    	arg :type, :integer
    	arg :type_id, :integer

    	resolve &EshopWeb.Schema.Resolvers.RefundPolicy.create_refund_policy/2
    end
  end 
end
