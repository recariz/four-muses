class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # loading all the code of pundit generated so you can have access to all the method of the gem
  include Pundit

  # verify_authorized is an authorization happening on a specific instance, for ex a specific @post (can the user update it?)
  after_action :verify_authorized, except: :index, unless: :skip_pundit?

  # veryify_policy_scoped is an authorization happening on the class level Eg. class Post, can the user see the index?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # rescue_from the error message/page notauthorized from pundit, with the customised method  user_not_autorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  # NOTES FOR CONTROLLER
  # On class methods (index) we will need to
  # check the policy scope  E.g.: @posts = policy_scope(Post)

  # On instance methods (create, update, delete, show) we will need to
  # check the authorize
  # E.g.: @post = Post.new
  # authorize(@post)
  # In create authorize before saving

  # NOTES FOR VIEWS
  # In the view we can add if statements to show /hide specific buttons

  # <% if policy(post).edit?  %>
  # <!-- the current user logged in is the owner of the post -->
  # <%= link_to 'Edit', edit_post_path(@post) %>
  # <% end %>

  # <% if policy(post).destroy? %>
  # <%= link_to 'Destroy', @post, method: :delete, data: { confirm: 'Are you sure?' } %>
  # <% end %>

  protected

  def configure_permitted_parameters
    # Devise implementation of Strong Params
    # keys is an array of symbols
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[type nickname first_name last_name location])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[type nickname biography avatar first_name last_name location])
  end

  private

  def skip_pundit?
    # if your cointroller is a devise controller or the controller is a controller for admin or a static controlelr pages
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
