class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    ing_ids = params[:dose][:ingredient_id]

    if ing_ids.nil? || params[:dose][:description].empty?
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      ing_ids.each do |ing_id|
        @dose = Dose.new(
          description: (params[:dose][:description]),
          cocktail_id: (params[:cocktail_id]),
          ingredient_id: ing_id
        )
        if @dose.valid?
          @dose.save
        else
          render :new
        end
      end
      redirect_to cocktail_path(@cocktail)
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description, :cocktail_id)
  end
end
