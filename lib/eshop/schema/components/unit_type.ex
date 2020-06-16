defmodule Eshop.Components.UnitType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "unit_types" do 
    field :name, :string
    field :native_name, :string
    field :type, :integer
    belongs_to :user, Eshop.Users.User

    timestamps()
  end

  @doc false
  def changeset(unit_type, attrs) do
    unit_type
    |> cast(attrs, [:name, :native_name, :type, :user_id])
    |> validate_required([:name, :native_name])
    |> validate_length(:name, min: 2, max: 200)
    |> validate_length(:native_name, min: 1, max: 200)
  end
end
