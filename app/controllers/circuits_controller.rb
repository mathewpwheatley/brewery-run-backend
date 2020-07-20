class CircuitsController < ApplicationController
  before_action :set_circuit, only: [:show, :update, :destroy]
  # Skip user authorization for now
  skip_before_action :authorized

  def index
    circuits = Circuit.all
    render json: circuits, serializer_each: CircuitSerializer, status: :ok
  end

  def show
    render json: @circuit, serializer: CircuitSerializer, status: :ok
  end

  def create
    circuit = Circuit.create(circuit_params)
    if circuit.vaild?
      render json: circuit, serializer: CircuitSerializer, status: :created
    else
      render json: {errors: circuit.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @circuit.update(circuit_params)
    if @circuit.valid?
      render json: @circuit, serializer: CircuitSerializer, status: :accepted
    else
      render json: {errors: @circuit.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @circuit.destroy
    render json: status: :no_content
  end

  private
  def set_circuit
    @circuit = Circuit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def circuit_params
    params.require(:circuit).permit(:title, :description, :public, :user_id)
  end

end
