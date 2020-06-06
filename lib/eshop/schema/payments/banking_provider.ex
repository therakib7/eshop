defmodule Eshop.Payments.BankingProvider do
  use Ecto.Schema
  import Ecto.Changeset

  schema "banking_providers" do
    field :is_active, :boolean, default: false
    field :name, :string
    field :native_name, :string
    field :order, :integer
    field :type, :integer
    belongs_to :attachement, Eshop.Attachments.Attachment
    timestamps()
  end

  @doc false
  def changeset(banking_provider, attrs) do
    banking_provider
    |> cast(attrs, [:is_active, :type, :name, :native_name, :order, :attachement_id])
    |> validate_required([:type, :name, :native_name, :order])
    |> validate_length(:name, min: 2, max: 200)
    |> validate_length(:native_name, min: 2, max: 200)
  end
end
