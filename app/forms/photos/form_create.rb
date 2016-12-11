module Photos
  class FormCreate < Photos::Form
    def save(params)
      super(params)
      Photos::Create.new(photo).save if valid?
    end
  end
end