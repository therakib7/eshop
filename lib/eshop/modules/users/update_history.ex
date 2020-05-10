defmodule Eshop.Users.UpdateHistory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "update_histories" do
    field :created_at, :utc_datetime
    field :key, :string
    field :new_value, :string
    field :old_value, :string
    field :type, :integer
    field :type_id, :integer
    
    timestamps()
  end

  @doc false
  def changeset(update_history, attrs) do
    update_history
    |> cast(attrs, [:type, :type_id, :key, :old_value, :new_value, :created_at])
    |> validate_required([:type, :type_id, :key, :old_value, :new_value, :created_at])
  end
end
