defmodule Eshop.Conditions.RefundPolicy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "refund_policies" do
    field :content, :string
    field :native_content, :string
    field :type, :integer
    field :type_id, :integer

    timestamps()
  end

  @doc false
  def changeset(refund_policy, attrs) do
    refund_policy
    |> cast(attrs, [:type, :type_id, :content, :native_content])
    |> validate_required([:type, :type_id, :content, :native_content])
  end
end
