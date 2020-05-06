defmodule Eshop.Components.Faq do
  use Ecto.Schema
  import Ecto.Changeset

  schema "faqs" do
    field :content, :string
    field :native_content, :string
    field :native_question, :string
    field :question, :string
    field :item, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(faq, attrs) do
    faq
    |> cast(attrs, [:question, :native_question, :content, :native_content])
    |> validate_required([:question, :native_question, :content, :native_content])
  end
end
