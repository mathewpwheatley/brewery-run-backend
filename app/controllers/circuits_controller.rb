class CircuitsController < ApplicationController
  before_action :set_circuit, only: [:show, :update, :destroy]
  # Skip user authorization for now
  skip_before_action :authorized

  def index
    circuits = Circuit.all
    render json: {circuits: CircuitSerializer.new(circuits)}, status: :ok
  end

  def show
  end

  def create
    circuit = Circuit.create(circuit_params)
    if circuit.vaild?
      render json: {circuit: CircuitSerializer.new(circuit)}, status: :created
    else
      render_errors
    end
  end

  def update
    circuit.update(circuit_params)
    if circuit.valid?
      render json: {circuit: CircuitSerializer.new(circuit)}, status: :accepted
    else
      render_errors
    end
  end

  def destroy
    circuit.destroy
    render json: {status: :no_content}
  end

  private
  def set_circuit
    circuit = Circuit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def circuit_params
    params.require(:circuit).permit(:title, :description, :public, :user_id)
  end

  # Render error messages if create/update fail
  def render_errors
    render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
  end

end
