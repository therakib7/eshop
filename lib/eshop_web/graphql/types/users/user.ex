defmodule EshopWeb.Schema.Types.User do
    use Absinthe.Schema.Notation

    alias EshopWeb.Schema.Resolvers.UserProfile, as: UserProfile
    
    object :user do
        field :id, :integer
        field :email, :string
        field :first_name, :string
        field :is_active, :boolean
        field :surname, :string
        field :mobile, :string
        field :password_hash, :string
        field :pin, :integer
        field :verified_email, :datetime 
        field :verified_phone, :datetime 
        field :verified_user, :datetime 
        field :inserted_at, :naive_datetime
        field :updated_at, :naive_datetime


        # has many field
        # field :profile, list_of(:user_profile) do
        #     #arg :date, :date
        #     resolve &EshopWeb.Schema.Resolvers.UserProfile.list_user_profiles/3
        # end

        #field :profile, list_of(:user_profile), resolve: assoc(:user_profiles))
        #field(:profile, list_of(:user_profile))

        # field :profile, list_of(:user_profile) do
        #     #arg :date, :date
        #     resolve &UserProfile.list_user_profiles/3
        # end

        #field :profile, list_of(:user_profile), resolve &UserProfile.list_user_profiles

        #field(:profile, :user_profile, resolve: assoc(&UserProfile.list_user_profiles))
    end

    input_object :user_params do
       field :first_name, :string
    end
end