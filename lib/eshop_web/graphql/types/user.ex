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
        field :verified_email, :string
        field :verified_phone, :string
        field :verified_user, :string
    end
end