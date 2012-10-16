init_forms = ->
	$('input#todo').parent('form').on 'ajax:complete', -> Turbolinks.visit(document.location.href)
	$('input[type=checkbox]').on 'click', ->
		Turbolinks.visit('/todos/' + $(this).attr('id') + '/done')
		# $.ajax {
		# 	url: '/todos/' + $(this).attr('id') + '/done'
		# 	always: ->
		# 		console.log document.location.href
		# 		Turbolinks.visit(document.location.href)
		# }

$ -> init_forms()
$(document).on 'page:load', init_forms