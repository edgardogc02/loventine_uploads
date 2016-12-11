module Photos
  class FormUpdate < Photos::Form
    def save(params)
      super(params)
      Photos::UpdateWithRotation.new(photo).save if valid?
    end
  end
end