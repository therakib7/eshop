defmodule EshopWeb.Schema.Mutations.TypeStatus do
  use Absinthe.Schema.Notation
  
  object :type_statust_mutations do
    @desc "Create a type_status"
    field :create_type_status, type: :type_status do  
      arg :id, :integer
      arg :is_active, :boolean
      arg :order, :integer
      arg :type, :integer
      arg :name, :string
      arg :native_name, :string
      arg :user_id, :id

    	resolve &EshopWeb.Schema.Resolvers.TypeStatus.create_type_status/3
    end
  end 
end
