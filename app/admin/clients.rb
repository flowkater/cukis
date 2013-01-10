ActiveAdmin.register Client do
	form do |f|
		f.inputs "Status" do
			f.input :email
			f.input :profile
			f.input :name
			f.input :school
			f.input :major
			f.input :phone
			f.input :gender
			f.input :birthday
			f.input :schoolinfo_id
		end
		f.inputs "Check Authorization" do
			f.input :is_mento
		end
		f.buttons
	end  
end
