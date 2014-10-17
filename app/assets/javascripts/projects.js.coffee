# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#project_project_name_search').autocomplete
	 source: $('#project_project_name_search').data('autocomplete-source')