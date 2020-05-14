defmodule EshopWeb.Schema.Mutations.Product do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.Product, as: Product
  
	object :product_mutations do
	  @desc "Create a product"
	  field :create_product, type: :product do 
		  arg :id, :integer
    	arg :barcode, :string
    	arg :exp_date, :naive_datetime
    	arg :mfg_date, :naive_datetime
    	arg :sku, :string
    	arg :brand_id, :id 
      
		  resolve &Product.create_product/3
	  end
  
	  @desc "Update a product"
	  field :update_product, type: :product do
		  arg(:id, non_null(:id))
		  arg(:product_params, :product_params)
  
		  resolve &Product.update_product/2
	  end
	  
	  @desc "Delete a product"
	  field :delete_product, type: :product do
		  arg(:id, non_null(:id))
		  resolve &Product.delete_product/2
	  end
	end 
end