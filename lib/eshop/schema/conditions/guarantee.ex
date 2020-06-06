defmodule Eshop.Conditions.Guarantee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guarantees" do
    field :content, :string
    field :duration, :integer
    field :gurantee_type, :integer
    field :native_content, :string
    belongs_to :user, Eshop.Objects.Item

    timestamps()
  end

  @doc false
  def changeset(guarantee, attrs) do
    guarantee
    |> cast(attrs, [:content, :native_content, :duration, :gurantee_type])
    |> validate_required([:content, :native_content, :duration, :gurantee_type])
    |> validate_length(:content, min: 2, max: 5000)
    |> validate_length(:native_content, min: 2, max: 5000)
  end
end
