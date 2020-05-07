defmodule Eshop.Repo.Migrations.CreateCompanySettings do
  use Ecto.Migration

  def change do
    create table(:company_settings) do
      add :type, :integer
      add :type_id, :integer
      add :key, :string, size: 120
      add :value, :text

      timestamps()
    end

    create index(:company_settings, [:type, :type_id])

  end
end
