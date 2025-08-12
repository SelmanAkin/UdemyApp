class VideoPolicy < ApplicationPolicy
  def create?
    user&.instructor? || user&.admin?
  end

  def new?
    create?
  end


  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
