'use strict';
// '<div class="alert alert-danger"></div>';
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
        Task.destroy();
      });

      $('.btn-complete').on('click', function() {
        Task.complete();
      });
  },

  add: function() {

    $.ajax({
        url: "/tasks/create",
        type: "POST",
        data: $('.form-task').serialize(),
        dataType: "json",
        success: function(data) {
          console.log(data);
        },
        error: function(error) {
          console.log(error);
        }
    });
  },

  update: function() {
    console.log('update');
  },

  destroy: function() {
    console.log('destroy');
  },

  complete: function() {
    console.log('complete');
  }

};

module.exports = Task;
