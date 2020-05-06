defmodule Eshop.Repo.Migrations.CreateRefundPolicies do
  use Ecto.Migration

  def change do
    create table(:refund_policies) do
      add :type, :integer
      add :type_id, :integer
      add :content, :text, null: true, size: 1200
      add :native_content, :text, null: true, size: 1200

      timestamps()
    end

    create index(:refund_policies, [:type, :type_id])

  end
end
