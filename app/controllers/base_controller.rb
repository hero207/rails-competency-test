class BaseController < ApplicationController
  def permissions(rules = {all: [:index, :show], customer: [], wiring: []})
    rules = parse_permission_rules(rules)
    allowances = [rules[:all]]
    current_user.roles.each do |role|
      allowances << rules[role]
    end if user_signed_in?
    allowances.flatten.compact.include?(action_name.to_sym)
  end
end
