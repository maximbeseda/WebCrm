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

    $('#info_contact').click(function () {
        if (table.rows('.selected').data().length > 0) {
            var data = table.$('tr.selected').data('value');
            $("#toInfo").val(data);
            $('#formInfo').submit();
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

    $('#info_contract').click(function () {
        if (table.rows('.selected').data().length > 0) {
            var data = table.$('tr.selected').data('value');
            $("#toInfo").val(data);
            $('#formInfo').submit();
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

    $('#info_object').click(function () {
        if (table.rows('.selected').data().length > 0) {
            var data = table.$('tr.selected').data('value');
            $("#toInfo").val(data);
            $('#formInfo').submit();
        }
    });

    $('#delete_document').click(function () {
        if (table.rows('.selected').data().length > 0) {
            if (confirm("Вы действительно хотите удалить запись?")) {
                var data = table.$('tr.selected').data('value');
                $.post("/document/delete", 'toDelete=' + data);
                table.row('.selected').remove().draw(false);
            }
        }
    });

    $('#edit_document').click(function () {
        if (table.rows('.selected').data().length > 0) {
            var data = table.$('tr.selected').data('value');
            $("#toUpdate").val(data);
            $('#formidupdate').submit();
        }
    });

    $('#info_document').click(function () {
        if (table.rows('.selected').data().length > 0) {
            var data = table.$('tr.selected').data('value');
            $("#toInfo").val(data);
            $('#formInfo').submit();
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

    $(".select2_contract").select2({
        placeholder: "Выберите договор",
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

    <!-- Autosize textarea -->
    autosize($('.resizable_textarea'));
    <!-- /Autosize textarea -->

});

$(function() {

    // We can attach the `fileselect` event to all file inputs on the page
    $(document).on('change', ':file', function() {
        var input = $(this),
            numFiles = input.get(0).files ? input.get(0).files.length : 1,
            label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
    });

    // We can watch for our custom `fileselect` event like this
    $(document).ready( function() {
        $(':file').on('fileselect', function(event, numFiles, label) {

            var input = $(this).parents('.input-group').find(':text'),
                log = numFiles > 1 ? numFiles + ' файлов выбрано' : label;

            if( input.length ) {
                input.val(log);
            } else {
                if( log ) alert(log);
            }

        });
    });

    var elems = document.getElementsByClassName('confirmation');
    var confirmIt = function (e) {
        if (!confirm('Удалить файл?')) {
            e.preventDefault();
        }
        else {
            var data = $(this).parents('tr').data('value');
            $.post("/delete/document_file", 'toDelete=' + data);
            $(this).parents('tr').remove();
        }
    };
    for (var i = 0, l = elems.length; i < l; i++) {
        elems[i].addEventListener('click', confirmIt, false);
    }

});

