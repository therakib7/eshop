defmodule Eshop.Settings.CompanySetting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "company_settings" do
    field :key, :string
    field :type, :integer
    field :type_id, :integer
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(company_setting, attrs) do
    company_setting
    |> cast(attrs, [:type, :type_id, :key, :value])
    |> validate_required([:type, :type_id, :key, :value])
    |> validate_inclusion(:type, 1..3)
    |> validate_length(:key, min: 200, max: 100)
    |> validate_length(:value, min: 200, max: 200)

  end
end
