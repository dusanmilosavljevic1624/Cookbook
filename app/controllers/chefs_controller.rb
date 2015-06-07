class ChefsController < ApplicationController
  before_action :set_chef, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin, only: :destroy

  #Kreiranje nove varijable instance prilikom posete formi za pravljenje novog korisnika
  def new
    @chef = Chef.new
  end

  # Kreiranje sef objekta
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "You have registered successfully"
      redirect_to recipes_path
    else
      render :new
    end
  end

  # Metoda za povezanje edit akcije sa edit formom korisnika
  def edit
  end

  # Updatovanje pojedinackog sef objekta u zavisnosti od id-a
  def update
    if @chef.update_attributes(chef_params)
      flash[:success] = "Profile updated successfully"
      redirect_to chef_path(@chef)
    else
      render :edit
    end
  end

  # Metoda za prikaz profila svakog sefa
  def show
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
  end

  # Metoda za izlistavanje svih sefova koriscenjem paginate gema
  def index
    @chefs = Chef.paginate(page: params[:page], per_page:3)
  end

  def destroy
    Chef.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to :back
  end

  private

  #Validacija parametara forme zbog sprecavanja SQL injectiona
  def chef_params
    params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
  end

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def require_same_user
    if current_user != @chef
      flash[:danger] = "You can only edit your own profile."
      redirect_to root_url
    end
  end

  def require_admin
    redirect_to root_url and flash[:danger] = "You don't have permission to do that" unless current_user.admin?
  end
end