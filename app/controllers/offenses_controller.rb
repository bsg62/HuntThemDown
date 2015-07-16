class OffensesController < ApplicationController
  before_action :set_offense, only: [:show, :edit, :update, :destroy]
  before_filter :authorize!

  # GET /offenses
  # GET /offenses.json
  def index
    @offenses = Offense.all
  end

  # GET /offenses/warnings
  # GET /offenses/warnings.json
  def index_with_offense_type
    @offense_type = OffenseType.find_by(slug: params[:offense_type_slug])
    @offenses = Offense.where(offense_type: @offense_type)

    render 'index'
  end

  # GET /offenses/1
  # GET /offenses/1.json
  def show
  end

  # GET /offenses/new
  def new
    get_params = request.GET

    @offense = if get_params.fetch('name', nil)
                 build_offense(get_params)
               else
                 Offense.new
               end
  end

  # GET /offenses/1/edit
  def edit
  end

  # POST /offenses
  # POST /offenses.json
  def create
    @offense = Offense.new(offense_params)

    respond_to do |format|
      if @offense.save
        format.html { redirect_to offenses_url, notice: 'Offense was successfully created.' }
        format.json { render :show, status: :created, location: @offense }
      else
        format.html { render :new }
        format.json { render json: @offense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offenses/1
  # PATCH/PUT /offenses/1.json
  def update
    respond_to do |format|
      if @offense.update(offense_params)
        format.html { redirect_to offenses_url, notice: 'Offense was successfully updated.' }
        format.json { render :show, status: :ok, location: @offense }
      else
        format.html { render :edit }
        format.json { render json: @offense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offenses/1
  # DELETE /offenses/1.json
  def destroy
    @offense.destroy
    respond_to do |format|
      format.html { redirect_to offenses_url }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_offense
    @offense = Offense.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def offense_params
    parameters = params.require(:offense).permit(:user_id, :victim_id, :victim, :offense_type_id, :name, :duration, :reason, :url, :ip_address)

    victim = parameters.fetch('victim', nil)

    if victim
      parameters['victim'] = find_or_create_victim(victim)
    end

    parameters
  end

  def find_or_create_victim(name)
    victim = Victim.find_by(name: name)

    unless victim
      victim = Victim.create(name: name)
    end

    victim
  end

  def build_offense(params)
    offense_data = {}
    offense_data['name'] = params['name'] || ''
    offense_data['offense_type_id'] = params['offense_type_id'] || 1
    offense_data['url'] = params['url'] || ''
    offense_data['ip_address'] = params['ip_address'] || ''

    Offense.new(offense_data)
  end
end
