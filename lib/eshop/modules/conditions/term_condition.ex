defmodule Eshop.Conditions.TermCondition do
  use Ecto.Schema
  import Ecto.Changeset

  schema "term_conditions" do
    field :content, :string
    field :native_content, :string
    field :type, :integer
    field :type_id, :integer

    timestamps()
  end

  @doc false
  def changeset(term_condition, attrs) do
    term_condition
    |> cast(attrs, [:type, :type_id, :content, :native_content])
    |> validate_required([:type, :type_id, :content, :native_content])
    |> validate_length(:content, min: 2, max: 5000)
    |> validate_length(:native_content, min: 2, max: 5000)
  end
end
