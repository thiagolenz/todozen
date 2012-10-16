init_forms = ->
	$('input#todo').parent().parent('form').on 'ajax:complete', ->
		Turbolinks.visit(document.location.href)

	$('input[type=checkbox]').on 'click', ->
		Turbolinks.visit('/todos/' + $(this).attr('id') + '/done')

$ -> init_forms()
$(document).on 'page:load', init_forms