defmodule EshopWeb.Schema.Mutations.UnitType do
  use Absinthe.Schema.Notation
  
  object :unit_type_mutations do
    @desc "Create a unit_type"
    field :create_unit_type, type: :unit_type do 
      arg :id, :integer
    	arg :name, :string
    	arg :native_name, :string
    	arg :user_id, :id

    	resolve &EshopWeb.Schema.Resolvers.UnitType.create_unit_type/2
    end
  end 
end
