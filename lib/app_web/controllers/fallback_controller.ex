defmodule AppWeb.FallbackController do
  use AppWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(AppWeb.ChangeSetView, "error.json", changeset: changeset)
  end

  def call(conn, :not_found) do
    conn
    |> put_status(:not_found)
    |> render(AppWeb.ErrorView, :"404")
  end
end
