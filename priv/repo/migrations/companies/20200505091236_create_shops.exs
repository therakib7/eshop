defmodule Eshop.Repo.Migrations.CreateShops do
  use Ecto.Migration

  def change do
    create table(:shops) do
      add :is_active, :boolean, default: false, null: false
      add :is_verifed, :boolean, default: false, null: false
      add :name, :string, null: true, size: 150
      add :native_name, :string, null: true, size: 150
      add :trade_assurance, :boolean, default: false, null: false
      add :highest_assurance, :decimal, null: true
      add :golden_supplier, :boolean, default: false, null: false
      add :created_at, :utc_datetime
      add :company_id, references(:companies, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)
      add :attachment_id, references(:attachments, on_delete: :nothing)
      add :term_condition_id, references(:term_conditions, on_delete: :nothing)

      timestamps()
    end

    create index(:shops, [:company_id])
    create index(:shops, [:user_id])
    create index(:shops, [:location_id])
    create index(:shops, [:attachment_id])
    create index(:shops, [:term_condition_id])
  end
end
