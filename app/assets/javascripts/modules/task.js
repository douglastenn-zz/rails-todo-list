'use strict';
// '<div class="alert alert-danger"></div>';

require('./helpers');
var template = require('../templates/task-row');
var templateError = require('../templates/box-error');

var Task = {
  init: function() {
      console.log('init');
      $('.btn-add').on('click', function() {
        Task.add();
      });

      $('.btn-update').on('click', function() {
        Task.update();
      });

      $('.btn-destroy').on('click', function() {
        if(confirm("Deseja realmente remover essa task?")) {
          var id = $(this).parent().parent().data('id');
          Task.destroy(id);
        }
      });

      $('.btn-complete').on('click', function() {
        if(confirm("Deseja realmente completar essa task?")) {
          var id = $(this).parent().parent().data('id');
          Task.complete(id);
        }
      });

      $('.alert-danger span').on('click', function() {
        $(this).parent().remove();
      });
  },

  add: function() {

    $.ajax({
        url: "/tasks/create",
        type: "POST",
        data: $('.form-task').serialize(),
        dataType: "json",
        success: function(data) {
          $( template.render({
      			id: data.id,
      			title: data.title,
            status: data.status,
            description: data.description
      		}) ).prependTo('.todolist');

          $('.form-task').trigger('reset');
        },
        error: function(error) {
          $('.box-task .alert-danger').remove();
          $( templateError.render({
            message: 'Erro ao adicionar task!'
          }) ).prependTo('.box-task');
        }
    });

  },

  update: function() {
    console.log('update');
  },

  destroy: function(id) {

    $.ajax({
        url: "/tasks/destroy",
        type: "POST",
        data: { id: id },
        dataType: "json",
        success: function() {
            $('li[data-id="'+id+'"]').remove();
        },
        error: function(error) {
          $('.box-task .alert-danger').remove();
          $( templateError.render({
            message: 'Erro ao adicionar task!'
          }) ).prependTo('.box-task');
        }
    });

  },

  complete: function(id) {
    $.ajax({
        url: "/tasks/complete",
        type: "POST",
        data: { id: id },
        dataType: "json",
        success: function() {
            $('li[data-id="'+id+'"]').remove();
        },
        error: function(error) {
          $('.box-task .alert-danger').remove();
          $( templateError.render({
            message: 'Erro ao completar task!'
          }) ).prependTo('.box-task');
        }
    });
  }

};

module.exports = Task;
