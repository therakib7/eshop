defmodule EshopWeb.Schema.Types.UserProfile do
  use Absinthe.Schema.Notation

  @desc "A user_profile"
  object :user_profile do
    field :id, :integer
    field :date_of_birth, :datetime
    field :gender, :integer
    field :lat, :float
    field :long, :float
    field :merital_status, :integer
    field :user_id, :id
    field :pre_location_id, :id
    field :per_location_id, :id
    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  @desc "A user_profile update"
  input_object :user_profile_params do
    field :date_of_birth, :datetime
    field :gender, :integer
    field :lat, :float
    field :long, :float
    field :merital_status, :integer
    field :user_id, :id
    field :pre_location_id, :id
    field :per_location_id, :id
  end
end
