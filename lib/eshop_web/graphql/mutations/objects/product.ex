defmodule EshopWeb.Schema.Mutations.Product do
  use Absinthe.Schema.Notation
  
  object :product_mutations do
    @desc "Create a product"
    field :create_product, type: :product do 
      arg :id, :integer
    	arg :barcode, :string
    	arg :exp_date, :naive_datetime
    	arg :mfg_date, :naive_datetime
    	arg :sku, :string
    	arg :brand_id, :id
      
    	resolve &EshopWeb.Schema.Resolvers.Product.create_product/2
    end
  end 
end
