defmodule EshopWeb.Schema.Types.UserProfile do
    use Absinthe.Schema.Notation
    
    object :user_profile do
        field :date_of_birth, :datetime
        field :gender, :integer
        field :lat, :float
        field :long, :float
        field :merital_status, :integer
        field :user_id, :id
        field :pre_location_id, :id
        field :per_location_id, :id
        field :inserted_at, :datetime
        field :updated_at, :datetime
    end
end