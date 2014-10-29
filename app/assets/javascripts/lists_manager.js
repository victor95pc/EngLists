$(function() {

    $('#done').perfectScrollbar();
    $('#not_done').perfectScrollbar();

    $( 'div .delete' ).on('confirm:complete', function(e, answer) {
        if (answer)
            $(this).closest('li').remove();
    });

    $( 'div .delete_list' ).on('confirm:complete', function(e, answer) {
        if (answer)
            $(this).closest('div[class=list_container]').remove();
    });

    $( 'div #list_name' ).keypress(function( event ) {
        if ( event.which == 13 ) {

            $.ajax({
                type:"PUT",
                url:"/lists/"+$(this).closest('div').attr('id'),
                data: {"list": { "name": $( this ).val() }},
                success:function(data){
                    console.log('Saved');
                }
            });
            event.preventDefault();
        }
    });

    $( 'li .change' ).click(function() {
            $.ajax({
                type:"PUT",
                url:"/tasks/"+this.id,
                data: {"task": { "status": $(this).data('status') }},
                success:function(data){
                    console.log('Saved');
                    location.reload();
                }
            });
            event.preventDefault();
    });


    $( 'li .task' ).keypress(function( event ) {
        if ( event.which == 13 ) {

            $.ajax({
                type:"PUT",
                url:"/tasks/"+this.id,
                data: {"task": { "description": $( this ).val() }},
                success:function(data){
                    console.log('Saved');
                }
            });
            event.preventDefault();
        }
    });

    $( '#add_list' ).click(function() {
        $.ajax({
            type:"POST",
            url:"/lists/",
            data: {"list": { "name": "New list", user_id: $("#user").attr('data-user') }},
            success:function(data){
                console.log('Saved');
                location.reload();
            }
        });
    });


    $( '.add_task' ).click(function() {

        $.ajax({
            type:"POST",
            url:"/tasks/",
            data: {"task": { "description": "New task", "list_id": $(this).closest('div[class=list_container]').attr('id'), "status": false}},
            success:function(data){
                console.log('Saved');
                location.reload();
            }
        });
    });

});



