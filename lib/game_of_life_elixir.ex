defmodule GameOfLifeElixir do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    init_alive_cells = []

    children = [
      supervisor(Task.Supervisor, [[name: GameOfLifeElixir.TaskSupervisor]]),
      worker(GameOfLifeElixir.BoardServer, [init_alive_cells]),
      worker(GameOfLifeElixir.GamePrinter, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GameOfLifeElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
