defmodule Eshop.Payments.BankingProvider do
  use Ecto.Schema
  import Ecto.Changeset

  schema "banking_providers" do
    field :is_active, :boolean, default: false
    field :name, :string
    field :native_name, :string
    field :order, :integer
    field :type, :integer
    field :attachement_id, :id

    timestamps()
  end

  @doc false
  def changeset(banking_provider, attrs) do
    banking_provider
    |> cast(attrs, [:is_active, :type, :name, :native_name, :order])
    |> validate_required([:is_active, :type, :name, :native_name, :order])
  end
end
