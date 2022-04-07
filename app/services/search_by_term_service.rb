class SearchByTermService < BaseService

  def initialize(term = '', resource_class = Photo)
    @term = term
    @resource_class = resource_class
  end

  def execute
    @resource_class.where('lower(name) LIKE ?', "%#{@term.downcase}%")
  end

end
