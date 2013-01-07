ActiveAdmin.register Client do
	form do |f|
		f.inputs "Check Authorization" do
			f.input :is_mento
		end
		f.button
	end  
end
