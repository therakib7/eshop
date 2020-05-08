defmodule EshopWeb.Schema.Mutations.Location do
  use Absinthe.Schema.Notation

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

			resolve &EshopWeb.Schema.Resolvers.Location.create_location/2
		end
	end
end
