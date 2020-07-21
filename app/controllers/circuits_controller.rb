class CircuitsController < ApplicationController
  before_action :set_circuit, only: [:show, :update, :destroy]
  
  skip_before_action :authorized, only: [:index, :show]

  def index
    # Only send public circuits in index, this way only a user can see their none-public circuits
    circuits = Circuit.all_public
    render json: circuits, each_serializer: CircuitIndexSerializer, status: :ok
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
    render status: :no_content
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
