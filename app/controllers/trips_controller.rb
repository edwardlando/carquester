class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json
  def index
    if (params[:search].nil?)
     @query = "All trips"
     @trips = Trip.all
    else
      @date = "#{params[:search]['date(1i)']}-#{formatMonth(params[:search]['date(2i)'])}-#{params[:search]['date(3i)']}"
      # @trips = Trip.find_all_by_start_and_stop_and_date(params[:search][:start], params[:search][:stop], @date)
      # @trips = @trips.users.find_all_by_gender(params[:gender])
      
      start = params[:start]
      stop = params[:stop]
      gender = params[:gender]
      
      @query = "#{start} to #{stop} on #{@date} with a #{gender}"
      
      @trips = Trip.find(:all, :conditions => ["start = ? and stop = ? and date = ? and gender = ?", start, stop, @date, gender])
      
      
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(params[:trip])
    @trip.user_id = current_user.id
    @trip.gender = current_user.gender

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
  
  def formatMonth(month)
    if month.length < 2
      month = "0#{month}"
    end
    month
  end
  
  def join
    @trip = Trip.find(params[:id])
    @request = Request.create
    @request.trip_id = @trip.id
    @request.requester_id = current_user.id
    @request.requestee_id = @trip.user_id
    @request.status = "pending"
    @request.save
    respond_to do |format|
        format.html { redirect_to root_url, notice: "Request sent!" }
        format.json { head :no_content }
    end
    
  end
  
  
  
end
