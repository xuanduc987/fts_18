var bindChecker = function () {
  $('#user_avatar').bind('change', function() {
    size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 1) {
      alert('Maximum file size is 1MB. Please choose a smaller file.');
    }
  });
};

$(document).ready(bindChecker);
$(document).on('page:load', bindChecker);
