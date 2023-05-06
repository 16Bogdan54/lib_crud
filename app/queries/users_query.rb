class UsersQuery
  attr_accessor :search, :sort

  def initialize(search = nil, sort = nil)
    @search = search
    @sort = sort
  end

  def results_name
    users = User.all
    users = users.where("concat(name, ' ', surname) LIKE ?", "%#{search}%") if search.present?
    users.order(created_at:  :asc || :sort)
  end

end
