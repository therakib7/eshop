defmodule Eshop.Users.LoginDetail do
  use Ecto.Schema
  import Ecto.Changeset

  schema "login_details" do
    field :ip_address, :string
    field :ip_location, :string
    field :is_active, :boolean, default: false
    field :last_activity, :utc_datetime
    field :login_at, :utc_datetime
    field :user_agent, :string
    belongs_to :user, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(login_detail, attrs) do
    login_detail
    |> cast(attrs, [:is_active, :user_agent, :ip_address, :ip_location, :login_at, :last_activity])
    |> validate_required([:is_active, :user_agent, :ip_address, :ip_location, :login_at, :last_activity])
    |> validate_length(:user_agent, min: 2, max: 500)
    |> validate_length(:ip_address, min: 8, max: 100)
    
  end
end
