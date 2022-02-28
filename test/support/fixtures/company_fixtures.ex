defmodule StationWork.CompanyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StationWork.Company` context.
  """

  @doc """
  Generate a companies.
  """
  def companies_fixture(attrs \\ %{}) do
    {:ok, companies} =
      attrs
      |> Enum.into(%{
        image: "some image",
        name: "some name",
        web_site: "some web_site"
      })
      |> StationWork.Company.create_companies()

    companies
  end
end
