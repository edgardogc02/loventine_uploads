module Users
  module Photos
    class FormCreate < Users::Photos::Form
      def save(params)
        super(params)
        Users::Photos::Create.new(photo).save if valid?
      end
    end
  end
end