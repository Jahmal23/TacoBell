class TacosController < ApplicationController
  before_action :set_taco, only: [:show, :edit, :update, :destroy]

  # GET /tacos
  # GET /tacos.json
  def index
    @tacos = Taco.all
    render json: @tacos.to_json(:methods => [:taco_meat, :has_salsa, :has_rice])
  end

  # GET /tacos/1
  # GET /tacos/1.json
  def show
  end

  # GET /tacos/new
  def new
    @taco = Taco.new
  end

  # GET /tacos/1/edit
  def edit
  end

  # POST /tacos
  # POST /tacos.json
  def create

    @taco = Taco.new

    byebug

    @taco.meat = Meat.find_by(name: taco_params[:meat])

    if taco_params[:has_salsa]
      @taco.taco_to_sides << TacoToSide.new(taco: @taco, side: Side.find_by(name: Side::SALSA_SIDE_NAME))
    end

    if taco_params[:has_rice]
      @taco.taco_to_sides << TacoToSide.new(taco: @taco, side: Side.find_by(name: Side::RICE_SIDE_NAME))
    end

    @taco.notes = taco_params[:notes]

    if @taco.save
      render json: @taco.to_json(:methods => [:taco_meat, :has_salsa, :has_rice])
    else
      format.json { render json: @taco.errors, status: :unprocessable_entity }
    end
 end

  # PATCH/PUT /tacos/1
  # PATCH/PUT /tacos/1.json
  def update
    respond_to do |format|
      if @taco.update(taco_params)
        format.html { redirect_to @taco, notice: 'Taco was successfully updated.' }
        format.json { render :show, status: :ok, location: @taco }
      else
        format.html { render :edit }
        format.json { render json: @taco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tacos/1
  # DELETE /tacos/1.json
  def destroy
    @taco.destroy
    render json: @taco,  status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taco
      @taco = Taco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taco_params
      params.permit(:notes, :meat, :has_rice, :has_salsa)
    end
end
