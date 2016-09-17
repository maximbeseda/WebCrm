$(document).ready(function () {
    $('#datatable').dataTable();
});

$(document).ready(function () {
    var table = $('#datatable').DataTable();

    $('#datatable tbody').on('click', 'tr', function () {
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

    $('#delete_user').click(function () {
        if (table.rows('.selected').data().length > 0) {
            if (confirm("Вы действительно хотите удалить запись?")) {
                var data = table.$('tr.selected').data('value');
                $.post("/user/delete", 'toDelete=' + data);
                table.row('.selected').remove().draw(false);
            }
        }
    });

    $('#edit_user').click(function () {
        if (table.rows('.selected').data().length > 0) {
            var data = table.$('tr.selected').data('value');
            $("#toUpdate").val(data);
            $('#formidupdate').submit();
        }
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

    $('#delete_contract').click(function () {
        if (table.rows('.selected').data().length > 0) {
            if (confirm("Вы действительно хотите удалить запись?")) {
                var data = table.$('tr.selected').data('value');
                $.post("/contract/delete", 'toDelete=' + data);
                table.row('.selected').remove().draw(false);
            }
        }
    });

    $('#edit_contract').click(function () {
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

    <!-- Select2 -->
    $(".select2_client").select2({
        placeholder: "Выберите клиента",
        allowClear: true
    });

    $(".select2_object").select2({
        placeholder: "Выберите объект",
        allowClear: true
    });
    <!-- /Select2 -->

    <!-- Parsley -->

    $.listen('parsley:field:validate', function () {
        validateFront();
    });
    $('#demo-form2 .btn').on('click', function () {
        $('#demo-form2').parsley().validate();
        validateFront();
    });
    var validateFront = function () {
        if (true === $('#demo-form2').parsley().isValid()) {
            $('.bs-callout-info').removeClass('hidden');
            $('.bs-callout-warning').addClass('hidden');
        } else {
            $('.bs-callout-info').addClass('hidden');
            $('.bs-callout-warning').removeClass('hidden');
        }
    };

    try {
        hljs.initHighlightingOnLoad();
    } catch (err) {
    }

    $.listen('parsley:field:validate', function () {
        validateFront();
    });
    $('#demo-form2P .btn').on('click', function () {
        $('#demo-form2P').parsley().validate();
        validateFront();
    });
    var validateFront = function () {
        if (true === $('#demo-form2P').parsley().isValid()) {
            $('.bs-callout-info').removeClass('hidden');
            $('.bs-callout-warning').addClass('hidden');
        } else {
            $('.bs-callout-info').addClass('hidden');
            $('.bs-callout-warning').removeClass('hidden');
        }
    };

    try {
        hljs.initHighlightingOnLoad();
    } catch (err) {
    }
    <!-- /Parsley -->

});

