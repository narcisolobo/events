document.addEventListener('DOMContentLoaded', function() {
    var selects = document.querySelectorAll('select');
    var selectInstances = M.FormSelect.init(selects);
    var date = document.querySelectorAll('.datepicker');
    var dateInstance = M.Datepicker.init(date);
});