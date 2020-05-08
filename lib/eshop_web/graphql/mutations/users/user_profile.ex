defmodule EshopWeb.Schema.Mutations.UserProfile do
    use Absinthe.Schema.Notation
    
    object :user_profile_mutations do
        @desc "Create a user_profile"
        field :create_user_profile, type: :user_profile do 
            arg :id, :integer
            arg :date_of_birth, :datetime
            arg :gender, :integer
            arg :lat, :float
            arg :long, :float
            arg :merital_status, :integer
            arg :user_id, :id
            arg :pre_location_id, :id
            arg :per_location_id, :id  

            resolve &EshopWeb.Schema.Resolvers.UserProfile.create_user_profile/3
        end
    end 
end