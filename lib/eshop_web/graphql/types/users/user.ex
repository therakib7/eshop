defmodule EshopWeb.Schema.Types.User do
    use Absinthe.Schema.Notation
    
    object :user do
        field :id, :integer
        field :email, :string
        field :first_name, :string
        field :is_active, :boolean
        field :last_name, :string
        field :mobile, :string
        field :password_hash, :string
        field :pin, :integer
        field :verified_email, :datetime 
        field :verified_phone, :datetime 
        field :verified_user, :datetime 
        field :inserted_at, :datetime
        field :updated_at, :datetime
    end
end