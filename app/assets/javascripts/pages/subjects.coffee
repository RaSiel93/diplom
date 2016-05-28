$ ->

  learnerId = null
  date = null

  $('.journal td').click ->
    learnerId = $(this).data('learner-id')
    date = $(this).data('date')
    value = $(this).data('mark')

    if learnerId && date
      $('#myModal').modal()
      $('#myModal input').val(value)

  $('#myModal #save').click ->
    options =
      mark:
        forms_subject_id: $('.journal').data('forms-subject-id'),
        learner_id: learnerId,
        date: date,
        value: $('#myModal input').val()

    $.post window.location.href + '/marks', options, (data) ->
      $('.journal td[data-learner-id=' + data.learner_id + '][data-date=' + data.date + ']').text(data.value)
      $('#myModal').modal('hide')

