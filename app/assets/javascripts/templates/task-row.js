'use strict';

var template = '<li class="row"'+
  'data-id="{id}"'+
  'data-status="{status}">'+
  '<div class="col-md-10">'+
   '<strong>{title}</strong>'+
   '<p>{description}</p>'+
  '</div>'+
  '<div class="col-md-2">'+
     '<a href="#" class="btn btn-success btn-complete" title="Completar task"><i class="glyphicon glyphicon-ok"></i></a> '+
     '<a href="#" class="btn btn-info btn-update" title="Editar task"><i class="glyphicon glyphicon-edit"></i></a> '+
     '<a href="#" class="btn btn-danger btn-destroy" title="Remover task"><i class="glyphicon glyphicon-remove"></i></a> '+
  '</div>'+
 '</li>';

module.exports = template;
