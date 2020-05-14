defmodule EshopWeb.Schema.Mutations.Location do
	use Absinthe.Schema.Notation
  
	alias EshopWeb.Schema.Resolvers.Location, as: Location
  
	object :location_mutations do
	  @desc "Create a location"
	  field :create_location, type: :location do 
		  arg :id, :integer
			arg :code, :string
			arg :country_id, :integer
			arg :is_active, :boolean
			arg :lat, :float
			arg :long, :float
			arg :name, :string
			arg :native_name, :string
			arg :order, :integer
			arg :parent_id, :integer
			arg :stage_id, :integer
			arg :user_id, :integer
			arg :web, :string 
      
		  resolve &Location.create_location/3
	  end
  
	  @desc "Update a location"
	  field :update_location, type: :location do
		  arg(:id, non_null(:id))
		  arg(:location_params, :location_params)
  
		  resolve &Location.update_location/2
	  end
	  
	  @desc "Delete a location"
	  field :delete_location, type: :location do
		  arg(:id, non_null(:id))
		  resolve &Location.delete_location/2
	  end
	end 
end