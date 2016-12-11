module Users
  module Photos
    class FormUpdate < Users::Photos::Form
      def save(params)
        super(params)
        Users::Photos::UpdateWithRotation.new(photo).save if valid?
      end
    end
  end
end