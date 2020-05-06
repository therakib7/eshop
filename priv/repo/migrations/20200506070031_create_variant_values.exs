defmodule Eshop.Repo.Migrations.CreateVariantValues do
  use Ecto.Migration

  def change do
    create table(:variant_values) do
      add :value, :string
      add :native_value, :string
      add :variant_id, references(:variants, on_delete: :nothing)

      timestamps()
    end

    create index(:variant_values, [:variant_id])
  end
end
