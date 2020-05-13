defmodule EshopWeb.Schema.Types.LoginDetail do
  use Absinthe.Schema.Notation

  @desc "A login_detail"
  object :login_detail do
    field :id, :integer
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

  @desc "A login_detail update"
  input_object :login_detail_params do 
    field :ip_address, :string
    field :ip_location, :string
    field :is_active, :boolean
    field :last_activity, :datetime
    field :login_at, :datetime
    field :user_agent, :string
    field :user_id, :id
  end
end