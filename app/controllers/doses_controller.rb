class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new({description: dose_params[:description]})
    @cocktail = Cocktail.find(params[:id])
    @dose.cocktail = Cocktail.find(params[:id])
    @dose.ingredient = Ingredient.find_by(name: dose_params[:ingredient])
    if @dose.save
      redirect_to @dose.cocktail
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to @dose.cocktail
  end

  private

  def dose_params
    parameters = params.permit(:description, :ingredient)
  end
end

# <form  method="post">
#   <div class="form-group">
#     <%= hidden_field_tag :authenticity_token, form_authenticity_token %>
#     <% @doses.each do |dose| %>
#       <input type="text" class="form-control mt-2" name="description_<%="#{dose.id}"%>" value='<%="#{dose.description}"%>'>
#       <input type="text" class="form-control mt-2" name="ingredient_<%="#{dose.id}"%>_<%="#{dose.ingredient.id}"%>" value='<%="#{dose.ingredient.name}"%>'>
#       <input list="ingredients" class="form-control mt-2" name="ingredient_<%="#{dose.id}"%>_<%="#{dose.ingredient.id}"%>" >
#     <% end %>
#     <input type="text" class="form-control mt-2" name="description" value='<%="#{@dose.description}"%>'>
#     <input list="ingredients" class="form-control mt-2" name="ingredient" >
#     <datalist id="ingredients">
#       <% @ingredients.each do |ingredient| %>
#           <option value=<%=ingredient.name%>>
#       <% end %>
#     </datalist>
#     <input class="btn btn-primary mt-2" type="submit">
#   </div>
# </form>
# <%= form_for(@dose) do |f| %>
#   <span class="field">
#     <%= f.text_field :description %>
#   </span>
#   <span class="field">
#     <%= f.collection_select(:ingredient_id, Ingredient.all, :id, :name, :input_html => { :class => 'select2'})%>
#   </span>
#   <span class="action">
#     <%= f.submit "Add Item", :class => 'item_submit' %>
#   </span>
# <% end %>

