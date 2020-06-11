defmodule EshopWeb.Schema.Mutations.UserProfile do
  use Absinthe.Schema.Notation

  alias EshopWeb.Schema.Resolvers.UserProfile, as: UserProfile

  object :user_profile_mutations do
    @desc "Create a user_profile"
    field :create_user_profile, type: :user_profile do
      arg(:id, :integer)
      arg(:date_of_birth, :datetime)
      arg(:gender, :integer)
      arg(:lat, :float)
      arg(:long, :float)
      arg(:merital_status, :integer)
      arg(:user_id, :integer)
      arg(:pre_location_id, :integer)
      arg(:per_location_id, :integer)

      resolve(&UserProfile.create_user_profile/3)
    end

    @desc "Update a user_profile"
    field :update_user_profile, type: :user_profile do
      arg(:id, non_null(:id))
      arg(:user_profile_params, :user_profile_params)

      resolve(&UserProfile.update_user_profile/2)
    end

    @desc "Delete a user_profile"
    field :delete_user_profile, type: :user_profile do
      arg(:id, non_null(:id))
      resolve(&UserProfile.delete_user_profile/2)
    end
  end
end
