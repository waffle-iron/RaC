var bootgrid = null;
$(document).ready(function(){
  if(typeof commands == 'function' ){
    bootgrid = $("#data-table-command").bootgrid({
      css: {
        icon: 'zmdi icon',
        iconColumns: 'zmdi-view-module',
        iconDown: 'zmdi-sort-amount-desc',
        iconRefresh: 'zmdi-refresh',
        iconUp: 'zmdi-sort-amount-asc'
      },
      formatters: {
        "commands": commands
      }
    });

    $.ajaxSetup({
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
    });

    $("#data-table-command").on("loaded.rs.jquery.bootgrid", function(){
      bootgrid.find(".command-edit").on("click", function(e){
        window.location.href = e.delegateTarget.getAttribute("href");
      }).end().find(".command-delete").on("click", function(e){
        $.ajax({
          url: e.delegateTarget.getAttribute("href"),
          type: "DELETE"
        }).done(function(){
          window.location.href = e.delegateTarget.getAttribute("redirect_to");
        });
      });
    });
  }
});
