module SubjectsHelper
   def display_name(subject)
     return subject == nil  ? '' : subject.name
   end
end
