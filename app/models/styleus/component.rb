module Styleus
  class Component
    class_attribute :sections, :components

    class << self
      def components(*new_components)
        return registered_components if new_components.empty?

        registered_components.push(*new_components).uniq!
        registered_components.inspect
      end

      def registered_components
        styleus_sections[section_key] ||= []
      end

      def styleus_sections
        ::Styleus::Component.sections
      end

      def sections
        @sections ||= { }
      end

      def section_key
        section_name.to_sym
      end

      def section_name
        @section_name ||= to_underscore
      end

      def to_underscore
        underscored_module_name
      end

      private

      def underscored_module_name
        underscored_name.gsub('/', '_')
      end

      def underscored_name
        name.underscore
      end
    end
  end
end