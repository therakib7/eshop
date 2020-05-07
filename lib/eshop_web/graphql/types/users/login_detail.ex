defmodule EshopWeb.Schema.Types.LoginDetail do
    use Absinthe.Schema.Notation

    object :login_detail do
        field :ip_address, :string
        field :ip_location, :string
        field :is_active, :boolean
        field :last_activity, :datetime
        field :login_at, :datetime
        field :user_agent, :string
        field :user_id, :id
        field :inserted_at, :naive_datetime
        field :updated_at, :naive_datetime
    end
end