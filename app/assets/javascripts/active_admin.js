//= require active_admin/base
//= require wmd/wmd
//= require wmd/showdown

$(function(){
	new WMDEditor({
		input: "notes",
		button_bar: "notes-button",
		preview: "notes-preview",
		output: "notes-output",
		helpLink: "http://daringfireball.net/projects/markdown/syntax",
	});
})