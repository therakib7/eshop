defmodule Eshop.Repo.Migrations.CreateBankingProviders do
  use Ecto.Migration

  def change do
    create table(:banking_providers) do
      add :is_active, :boolean, default: false, null: false
      add :type, :integer
      add :name, :string, null: true, size: 100
      add :native_name, :string, null: true, size: 100
      add :order, :integer
      add :attachement_id, references(:attachments, on_delete: :nothing)

      timestamps()
    end

    create index(:banking_providers, [:attachement_id])
  end
end
