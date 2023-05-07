class LibrariesQuery
  attr_accessor :search_lib_name, :sort_lib_name

  def initialize(search_lib_name = nil, sort_lib_name = nil)
    @search_lib_name = search_lib_name
    @sort_lib_name = sort_lib_name
  end

  def results
    libraries = Library.all

    libraries = libraries.where("name LIKE ?", "%#{search_lib_name}%") if search_lib_name.present?

    if sort_lib_name.present?
      direction = %w[asc desc].include?(sort_lib_name) ? sort_lib_name : 'asc'
      libraries = libraries.order(Arel.sql("name #{direction}"))
    else
      libraries = libraries.order(created_at: :asc)
    end

    libraries
  end

end
