$(document).ready(function () {
    $('#example').DataTable();
});

$(document).ready(function () {
    var table = $('#example').DataTable();

    $('#example tbody').on('click', 'tr', function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });

    $('#button').click(function () {
        table.row('.selected').remove().draw(false);
    });

    $('#delete_contact').click(function () {
        if (table.rows('.selected').data().length > 0) {
            if (confirm("Вы действительно хотите удалить запись?")) {
                var data = table.$('tr.selected').data('value');
                $.post("/contact/delete", 'toDelete=' + data);
                table.row('.selected').remove().draw(false);
            }
        }
    });

    $('#edit_contact').click(function () {
        if (table.rows('.selected').data().length > 0) {
            var data = table.$('tr.selected').data('value');
            $("#toUpdate").val(data);
            $('#formidupdate').submit();
        }
    });

    $('#delete_object').click(function () {
        if (table.rows('.selected').data().length > 0) {
            if (confirm("Вы действительно хотите удалить запись?")) {
                var data = table.$('tr.selected').data('value');
                $.post("/object/delete", 'toDelete=' + data);
                table.row('.selected').remove().draw(false);
            }
        }
    });

    $('#edit_object').click(function () {
        if (table.rows('.selected').data().length > 0) {
            var data = table.$('tr.selected').data('value');
            $("#toUpdate").val(data);
            $('#formidupdate').submit();
        }
    });
});