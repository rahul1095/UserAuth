class RegionsController < InheritedResources::Base
	def show_page
		@region=Region.find(params[:id])
	    render 'regions/show_page'
	end

	def edit_region
		@region=Region.find(params[:id])
	render 'regions/edit_region'
	end


	 def update
      respond_to do |format|
      @region=Region.find(params[:id])
      if @region.update(region_params)
         @regions = Region.all
        format.js { render :file=> 'regions/update_region.js.erb', notice: 'region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def region_params
      params.require(:region).permit(:region_name)
   end
end

