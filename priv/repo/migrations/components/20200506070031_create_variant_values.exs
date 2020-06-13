defmodule Eshop.Repo.Migrations.CreateVariantValues do
  use Ecto.Migration

  def change do
    create table(:variant_values) do
      add :variant_id, references(:variants, on_delete: :nothing)
      add :value, :string, null: true, size: 100
      add :native_value, :string, null: true, size: 100 

      timestamps()
    end

    create index(:variant_values, [:variant_id])
  end
end
