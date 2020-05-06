defmodule Eshop.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :is_active, :boolean, default: false, null: false
      add :is_verifed, :boolean, default: false, null: false
      add :name, :string
      add :trade_assurance, :boolean, default: false, null: false
      add :highest_assurance, :decimal
      add :golden_supplier, :boolean, default: false, null: false
      add :created_at, :utc_datetime
      add :user_id, references(:users, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)
      add :attachment_id, references(:attachments, on_delete: :nothing)
      add :term_condition_id, references(:term_conditions, on_delete: :nothing)

      timestamps()
    end

    create index(:shops, [:user_id])
    create index(:companies, [:location_id])
    create index(:companies, [:attachment_id])
    create index(:companies, [:term_condition_id])
  end
end
