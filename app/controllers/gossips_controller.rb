class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all

    #@all_gossip = Gossip.all
  end
  

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    # without this the error warning from gossips/new activates
    @gossip = Gossip.new
  end

   
def edit
  @gossip = Gossip.find(params[:id])
end

  def create
    # calling the params of the private method
    @gossip = Gossip.new(gossip_params)
    
    # if format of gossip is not valid redirects to the form
    if @gossip.save
      redirect_to @gossip
    else
      render 'new'
    end

  end


  def update
    @gossip = Gossip.find(params[:id])
   
    if @gossip.update(gossip_params)
      redirect_to @gossip
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
   
    redirect_to welcome_index_path
  end


  private
  def gossip_params
    params.require(:gossip).permit(:title, :text)
  end

end
