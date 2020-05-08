defmodule EshopWeb.Schema.Mutations.VariantValue do
  use Absinthe.Schema.Notation
  
  object :variant_value_mutations do
    @desc "Create a variant_value"
    field :create_variant_value, type: :variant_value do 
        arg :id, :integer
    	arg :native_value, :string
    	arg :value, :string
    	arg :variant_id, :id
    	resolve &EshopWeb.Schema.Resolvers.VariantValue.create_variant_value/3
    end
  end 
end
