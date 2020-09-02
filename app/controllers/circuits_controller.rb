class CircuitsController < ApplicationController
  # authorized comes from ApplicationController 
  skip_before_action :authorized, only: [:index, :show]

  def index
    # Only send public circuits in index, this way only a user can see their none-public circuits
    circuits = Circuit.all_public
    render json: circuits, each_serializer: CircuitSerializerIndex, status: :ok
  end

  def show
    circuit = Circuit.find(params[:id])
    if active_user
      render json: circuit, serializer: CircuitSerializer, status: :ok
    else
      render json: circuit, serializer: CircuitSerializerPublic, status: :ok
    end
  end

  def create
    circuit = Circuit.create(circuit_params)
    if circuit.valid?
      render json: circuit, serializer: CircuitSerializer, status: :created
    else
      render json: {errors: circuit.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    circuit = Circuit.find(params[:id])
    circuit.update(circuit_params)
    if circuit.valid?
      render json: circuit, serializer: CircuitSerializer, status: :accepted
    else
      render json: {errors: circuit.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    circuit = Circuit.find(params[:id])
    circuit.destroy
    render json: {messages: ['Circuit has been delete']}, status: :ok
  end

  private
  # Only allow a list of trusted parameters through.
  def circuit_params
    params.require(:circuit).permit(:title, :description, :public, :user_id, :distance, :elevation, breweries_circuits_attributes: [:brewery_id])
  end

end
