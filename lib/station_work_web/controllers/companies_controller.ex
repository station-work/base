defmodule StationWorkWeb.CompaniesController do
  use StationWorkWeb, :controller

  alias StationWork.Company
  alias StationWork.Company.Companies

  def index(conn, _params) do
    companies = Company.list_companies()
    render(conn, "index.html", companies: companies)
  end

  def new(conn, _params) do
    changeset = Company.change_companies(%Companies{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"companies" => companies_params}) do
    case Company.create_companies(companies_params) do
      {:ok, companies} ->
        conn
        |> put_flash(:info, "Companies created successfully.")
        |> redirect(to: Routes.companies_path(conn, :show, companies))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    companies = Company.get_companies!(id)
    render(conn, "show.html", companies: companies)
  end

  def edit(conn, %{"id" => id}) do
    companies = Company.get_companies!(id)
    changeset = Company.change_companies(companies)
    render(conn, "edit.html", companies: companies, changeset: changeset)
  end

  def update(conn, %{"id" => id, "companies" => companies_params}) do
    companies = Company.get_companies!(id)

    case Company.update_companies(companies, companies_params) do
      {:ok, companies} ->
        conn
        |> put_flash(:info, "Companies updated successfully.")
        |> redirect(to: Routes.companies_path(conn, :show, companies))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", companies: companies, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    companies = Company.get_companies!(id)
    {:ok, _companies} = Company.delete_companies(companies)

    conn
    |> put_flash(:info, "Companies deleted successfully.")
    |> redirect(to: Routes.companies_path(conn, :index))
  end
end
