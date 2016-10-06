(function() {
  var dropdown        = document.querySelectorAll('.Dropdown'),
      dropdownOptions = document.querySelectorAll('.Dropdown .Dropdown-options a');

  var initialize = function() {

    document.addEventListener('click', function(evt) {
      if (!evt.target.closest('.Dropdown') && document.querySelector('.is-shown')) {
        [].forEach.call( dropdown, function(el) {
          if (el.classList.contains('is-shown')) {
            el.classList.remove('is-shown');
          }
        });
      }
    }, true);

    [].forEach.call( dropdown, function(el) {
      el.addEventListener('click', function(evt) {
        evt.preventDefault();

        if (evt.target.classList.contains('disabled')) {
          return false;
        }

        if (this.classList.contains('is-shown')) {
          this.classList.remove('is-shown');
        } else {
          this.classList.add('is-shown');
        }

      });
    });

    [].forEach.call( dropdownOptions, function(el) {
      el.addEventListener('click', function(evt) {
        evt.preventDefault();

        if (evt.target.classList.contains('disabled')) {
          return false;
        }

        var dropdownLabel = evt.target.closest('.Dropdown').querySelector('.Dropdown-selection');

        dropdownLabel.innerHTML = this.innerHTML;
      }, false)
    });
  }

  initialize();
})();