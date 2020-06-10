defmodule EshopWeb.Schema.Types.User do
  use Absinthe.Schema.Notation
  alias EshopWeb.Schema.Resolvers.UserProfile

  @desc "A user"
  object :user do
    field :id, :integer
    field :email, :string
    field :first_name, :string
    field :is_active, :boolean
    field :surname, :string
    field :mobile, :string
    # field :pin, :integer
    field :verified_email, :datetime
    field :verified_phone, :datetime
    field :verified_user, :datetime
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime

    field :profile, list_of(:user_profile) do
      # arg :date, :date
    resolve(&UserProfile.list_user_profiles/3)
    end
  end

  @desc "A user update"
  input_object :user_params do
    field :email, :string
    field :first_name, :string
    field :surname, :string
    field :mobile, :string
    field :pin, :integer
  end
end
