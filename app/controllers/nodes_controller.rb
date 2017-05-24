class NodesController < InheritedResources::Base
	def show_page
		@node=Node.find(params[:id])
	    render 'nodes/show_page'
	end

	def edit_node
		@node=Node.find(params[:id])
	    render 'nodes/edit_node'
	   end


	 def update
      respond_to do |format|
      @node=Node.find(params[:id])
      if @node.update(node_params)
         @nodes = Node.all
        format.js { render :file=> 'nodes/update_node.js.erb', notice: 'node was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def node_params
      params.require(:node).permit(:node_name, :place_id)
    end
end

