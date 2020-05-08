defmodule EshopWeb.Schema.Mutations.Package do
  use Absinthe.Schema.Notation
  
  object :package_mutations do
    @desc "Create a package"
    field :create_package, type: :package do 
      arg :id, :integer
    	arg :cost_price, :decimal
    	arg :sale_price, :decimal
    	arg :unit_price, :decimal
    	arg :item_id, :id

    	resolve &EshopWeb.Schema.Resolvers.Package.create_package/2
    end
  end 
end
