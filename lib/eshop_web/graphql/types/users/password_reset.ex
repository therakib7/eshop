defmodule EshopWeb.Schema.Types.PasswordReset do
    use Absinthe.Schema.Notation
    
    object :password_reset do
    	field :id, :integer
        field :created_at, :datetime
        field :token, :string
        field :user_id, :id
        field :inserted_at, :naive_datetime
        field :updated_at, :naive_datetime 
    end
end